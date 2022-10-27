import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ionicons/ionicons.dart';

import '../../../../common/static/colors.dart';
import '../../../../common/static/styles.dart';
import '../../../../gen/assets.gen.dart';
import '../../data/contracts_data/contract_model/contract_model.dart';
import '../../local_storage/local_storage.dart';
import '../../riverpod/riverpod.dart';
import '../widgets/custom_list_tile.dart';
import '../widgets/widgets_new_back/custom_bottom_sheet.dart';


class PaymentsMainPage extends ConsumerStatefulWidget {
  const PaymentsMainPage({Key? key}) : super(key: key);

  @override
  AllUsersState createState() => AllUsersState();
}

class AllUsersState extends ConsumerState<PaymentsMainPage> with TickerProviderStateMixin {
  late AnimationController controller;
  ScrollController scrollController = ScrollController();
  int filter = 0;

  @override
  void initState() {
    super.initState();

    ref.read(summProvider);
    ref.read(checkedProvider);
    ref.read(contractsProvider);

    controller = BottomSheet.createAnimationController(this);
    controller.duration = Duration(milliseconds: 450);
    controller.reverseDuration = Duration(milliseconds: 350);
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  Future<void> _onRefresh() async {
    setState(() {
      final summ = ref.refresh(summProvider.notifier);
      final checked = ref.refresh(checkedProvider.notifier);
      final count = ref.refresh(countProvider.notifier);
      count.state = 0;
      summ.state = 0;
      checked.state.clear();
    });
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => PaymentsMainPage(),
        ),
    );
  }

  void _showChooseType() async {
    await showModalBottomSheet(
      isScrollControlled: true,
      transitionAnimationController: controller,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.r), topRight: Radius.circular(16.r)),
      ),
      context: context,
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.35,
          child: _chooseSort(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final contracts = ref.watch(contractsProvider);
    return Scaffold(
      backgroundColor: AppColors.primaryBackgroundContracts,
      appBar: contracts.when(
        error: (err, stack) => AppBar(
          toolbarHeight: 64.h,
          elevation: 4.0,
          shadowColor: Colors.black.withOpacity(0.15),
          title: Text(
            '$err',
            style: AppStyles.headerTitle(),
          ),
        ),
        loading: () => AppBar(
          toolbarHeight: 64.h,
          elevation: 4.0,
          shadowColor: Colors.black.withOpacity(0.15),
          centerTitle: true,
          title: Text(
            'loading...',
            style: AppStyles.headerTitle(),
          ),
        ),
        data: (contracts) => _appBar(contracts),
      ),
      body: contracts.when(
        error: (err, stack) => Center(child: Text('$err', style: AppStyles.headerTitle(),)),//_noContracts(),
        loading: () => const Center(child: CircularProgressIndicator(color: AppColors.primary)),
        data: (contracts) => listOfContracts(contracts),
      ),
      bottomSheet: CustomBottomSheet(),
    );
  }

  AppBar _appBar(List<ContractModel> contracts) {
    return AppBar(
      toolbarHeight: 64.h,
      elevation: 4.0,
      shadowColor: Colors.black.withOpacity(0.15),
      actions: [
        IconButton(
          onPressed: () {
            showSearch(
              context: context,
              delegate: MySearchDelegate(contracts: contracts),
            );
          },
          icon: Icon(Ionicons.search, color: AppColors.darkGrey, size: 24.w),
        ),
        Padding(
          padding: EdgeInsets.only(right: 16.w),
          child: IconButton(
            onPressed: () {
              _showChooseType();
            },
            icon: Icon(Ionicons.filter_circle, color: AppColors.darkGrey, size: 24.w),
          ),
        ),
      ],
      title: Text(
        'Платежи',
        style: AppStyles.headerTitle(),
      ),
    );
  }

  Widget listOfContracts(List<ContractModel> contracts) {
    _sort(contracts);
    return contracts.isEmpty
        ? _noContracts()
        : RefreshIndicator(
          onRefresh: _onRefresh,
          child: ListView.builder(
          itemCount: contracts.length,
            itemBuilder: (context, index){
              return Padding(
                padding: EdgeInsets.only (top: 14.h),
                child: SizedBox(
                  child: !(filter == 3 && contracts[index].isActive == false)
                      ? CustomListTile(contract: contracts[index])
                      : const SizedBox.shrink(),
                ),
              );
              },
          ),
        );
  }

  Widget _noContracts() {
    return RefreshIndicator(
      onRefresh: _onRefresh,
      child: SizedBox(
        width: 1.sw,
        height: 1.sh,
        child: SingleChildScrollView(
          padding: EdgeInsets.zero,
          child: SizedBox(
              width: 1.sw,
              height: 600.h,
              child: Stack(
                alignment: AlignmentDirectional.topCenter,
                children: [
                  Positioned(
                    child: Assets.icons.top.svg(
                      color: Colors.white,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                  Positioned(
                    top: 20.h,
                    child: Assets.icons.nocontracts.svg(
                      height: 250.h,
                      width: 210.w,
                      alignment: Alignment.center,
                    ),
                  ),
                  Positioned(
                    top: 310.h,
                      child: Container(
                        width: 1.sw,
                        padding: EdgeInsets.symmetric(horizontal: 30.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 1.sw,
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Здесь будут отображаться Ваши договора.',
                                style: AppStyles.body2().copyWith(wordSpacing: 1.5),
                              ),
                            ),
                            12.verticalSpace,
                            Container(
                              width: 1.sw,
                              alignment: Alignment.centerLeft,
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Добавить их можно через вкладку ',
                                      style: AppStyles.body2().copyWith(
                                        wordSpacing: 1.5,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'Сервисы,\n',
                                      style: AppStyles.body2().copyWith(
                                        wordSpacing: 1.5,
                                        fontWeight: FontWeight.w500,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'а так же по номеру телефона:',
                                      style: AppStyles.body2().copyWith(
                                        wordSpacing: 1.5,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            12.verticalSpace,
                            Container(
                              width: 1.sw,
                              alignment: Alignment.centerLeft,
                              child: Text(
                                '8 800 555 7 555',
                                style: AppStyles.body2().copyWith(
                                    wordSpacing: 1.5,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ),
                ],
              ),
            ),
        ),
      ),
    );
  }

  DateTime _toDateTime(String dateRaw) {
    String dateTemp = dateRaw.split(' ')[0].split('.').reversed.join('-');
    return DateTime.parse(dateTemp);
  }

  void _sort(List<ContractModel> contract) {
    switch(filter) {
      case 0 : contract.sort((a, b) => a.number!.toLowerCase().compareTo(b.number!.toLowerCase()));
      break;
      case 1 : contract.sort((a, b) => _toDateTime(b.date!).compareTo(_toDateTime(a.date!)));
      break;
      case 2 : contract.sort((a, b) => _toDateTime(a.date!).compareTo(_toDateTime(b.date!)));
      break;
    }
  }

  Widget _chooseSort() {
    return Container(
      width: 1.sw,
      padding: EdgeInsets.symmetric(horizontal: 21.w, vertical: 22.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(8.r)),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Сортировка',
            style: AppStyles.subHeader1(),
          ),
          12.verticalSpace,
          MaterialButton(
            padding: EdgeInsets.zero,
            minWidth: 1.sw,
            height: 45.h,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            onPressed: () {
              setState(() {
                filter = 0;
              });
              Navigator.pop(context);
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 12.w,
                  height: 12.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: filter == 0
                        ? AppColors.primary
                        : Colors.transparent,
                    border: Border.all(
                      width: 1.w,
                      color: filter == 0
                          ? Colors.transparent
                          : AppColors.lightDarkGrey,
                    ),
                  ),
                ),
                6.horizontalSpace,
                Text(
                  'по имени',
                  style: AppStyles.body1(),
                ),
              ],
            ),
          ),
          MaterialButton(
            padding: EdgeInsets.zero,
            minWidth: 1.sw,
            height: 45.h,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            onPressed: () {
              setState(() {
                filter = 1;
              });
              Navigator.pop(context);
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 12.w,
                  height: 12.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: filter == 1
                        ? AppColors.primary
                        : Colors.transparent,
                    border: Border.all(
                      width: 1.w,
                      color: filter == 1
                          ? Colors.transparent
                          : AppColors.lightDarkGrey,
                    ),
                  ),
                ),
                6.horizontalSpace,
                Text(
                  'сначала новые',
                  style: AppStyles.body1(),
                ),
              ],
            ),
          ),
          MaterialButton(
            padding: EdgeInsets.zero,
            minWidth: 1.sw,
            height: 45.h,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            onPressed: () {
              setState(() {
                filter = 2;
              });
              Navigator.pop(context);
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 12.w,
                  height: 12.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: filter == 2
                        ? AppColors.primary
                        : Colors.transparent,
                    border: Border.all(
                      width: 1.w,
                      color: filter == 2
                          ? Colors.transparent
                          : AppColors.lightDarkGrey,
                    ),
                  ),
                ),
                6.horizontalSpace,
                Text(
                  'сначала старые',
                  style: AppStyles.body1(),
                ),
              ],
            ),
          ),
          MaterialButton(
            padding: EdgeInsets.zero,
            minWidth: 1.sw,
            height: 45.h,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            onPressed: () {
              setState(() {
                filter = 3;
              });
              Navigator.pop(context);
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 12.w,
                  height: 12.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: filter == 3
                        ? AppColors.primary
                        : Colors.transparent,
                    border: Border.all(
                      width: 1.w,
                      color: filter == 3
                          ? Colors.transparent
                          : AppColors.lightDarkGrey,
                    ),
                  ),
                ),
                6.horizontalSpace,
                Text(
                  'только активные',
                  style: AppStyles.body1(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MySearchDelegate extends SearchDelegate {
  final List<ContractModel> contracts;
  late List<ContractModel> searchResultContracts = [...contracts];
  List<String> searchHistory = LocalStorage.getList('searchHistory'); //TODO add mobile number or smth to key

  MySearchDelegate({required this.contracts, String hintText = 'поиск'}) : super(searchFieldLabel: hintText);

  String _formatDate(String? dateRaw) {
    if(dateRaw != null) {
      String _date = '';
      String _str = dateRaw.substring(0, dateRaw.indexOf(' '));
      List<String> _dateArr = _str.split('.');
      switch(_dateArr[1]) {
        case '01': _dateArr[1] = 'января';
        break;
        case '02': _dateArr[1] = 'февраля';
        break;
        case '03': _dateArr[1] = 'марта';
        break;
        case '04': _dateArr[1] = 'апреля';
        break;
        case '05': _dateArr[1] = 'мая';
        break;
        case '06': _dateArr[1] = 'июня';
        break;
        case '07': _dateArr[1] = 'июля';
        break;
        case '08': _dateArr[1] = 'августа';
        break;
        case '09': _dateArr[1] = 'сентября';
        break;
        case '10': _dateArr[1] = 'октября';
        break;
        case '11': _dateArr[1] = 'ноября';
        break;
        case '12': _dateArr[1] = 'декабря';
        break;
      }

      _date = '${_dateArr[0]} ${_dateArr[1]} ${_dateArr[2]}';

      return _date;
    } else {
      return 'unknown';
    }
  }

  String _allData(ContractModel contract) {
    return '${contract.number} ${contract.type} ${contract.address} ${_formatDate(contract.date)}'.toLowerCase();
  }

  void _addToHistory(String value) {
    if(value == '') {
      return;
    }
    if(searchHistory.length < 5) {
      List<String> tempList = searchHistory.reversed.toList();
      tempList.add(value);
      searchHistory = tempList.reversed.toList();
    } else {
      for(var i = 4; i > 0; i--) {
        searchHistory[i] = searchHistory[i - 1];
      }
      searchHistory[0] = value;
    }
    searchHistory = searchHistory.toSet().toList();
    LocalStorage.setList('searchHistory', searchHistory);
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      appBarTheme: Theme.of(context).appBarTheme.copyWith(
        toolbarHeight: 64.h,
        elevation: 0.0,
        shadowColor: Colors.black.withOpacity(0.15),
        titleSpacing: 0.w,
      ),
      inputDecorationTheme: Theme.of(context).inputDecorationTheme.copyWith(
        contentPadding: EdgeInsets.symmetric(horizontal: 8.w),
        constraints: BoxConstraints.tight(Size(240.w, 40.h)),
        focusedBorder: OutlineInputBorder(
          gapPadding: 12.w,
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(width: 1.w, color: AppColors.grey),
        ),
        disabledBorder: OutlineInputBorder(
          gapPadding: 12.w,
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(width: 1.w, color: AppColors.grey),
        ),
        enabledBorder: OutlineInputBorder(
          gapPadding: 12.w,
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(width: 1.w, color: AppColors.grey),
        ),
        border: OutlineInputBorder(
          gapPadding: 12.w,
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(width: 1.w, color: AppColors.grey),
        ),
      ),
    );
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Assets.icons.chevronBack.svg(
        color: AppColors.darkGrey,
      ),
      onPressed: () {
        this.close(context, null);
      },
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
      return [
        IconButton(
          icon: Transform.rotate(
            angle: pi / 2,
            child: Icon(
              Ionicons.close,
              color: AppColors.darkGrey,
              size: ScreenUtil().setWidth(24),
            ),
          ),
          onPressed: () {
            query = '';
          },
        ),
        12.horizontalSpace,
      ];
  }

  @override
  Widget buildResults(BuildContext context) {
    List<ContractModel> users = searchResultContracts.where((searchResult) {
      final result = _allData(searchResult);
      final input = query.toLowerCase();
      return result.contains(input.toLowerCase());
    }).toList();

    _addToHistory(query.toLowerCase());

    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only (top: 14.h),
          child: SizedBox(
            child: query == ''
                ? SizedBox.shrink()
                : CustomListTile(contract: users[index]),
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<ContractModel> users = searchResultContracts.where((searchResult) {
      final result = _allData(searchResult);
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();


    if(query == '' && searchHistory.isNotEmpty) {
      return ListView.builder(
        padding: EdgeInsets.zero,
        //separatorBuilder: (context, index) => SizedBox(height: 0.h),
        itemCount: searchHistory.length,
        itemBuilder: (context, index) => _searchTile(searchHistory[index]),
      );
    } else {
      return ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only (top: 14.h),
            child: SizedBox(
              child: query == ''
                  ? SizedBox.shrink()
                  : CustomListTile(contract: users[index]),
            ),
          );
        },
      );
    }
  }

  Widget _searchTile(String search) {
    return MaterialButton(
      padding: EdgeInsets.zero,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      height: 60.h,
      onPressed: () {
        query = search;
      },
      child: Container(
        width: 1.sw,
        height: 60.h,
        padding: EdgeInsets.only(
          left: 58.w,
          right: 16.w,
        ),
        child: Row(
          children: [
            Assets.icons.time.svg(
              width: 18.w,
              height: 18.h,
            ),
            12.horizontalSpace,
            Text(
              search,
              style: AppStyles.body1(),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.centerRight,
                child: IconButton(
                  icon: Assets.icons.cross.svg(width: 18.w, height: 18.h),
                  onPressed: () {
                    searchHistory.remove(search);
                    LocalStorage.setList('searchHistory', searchHistory);
                    query = '';
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}