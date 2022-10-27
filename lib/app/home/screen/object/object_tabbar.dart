import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reforce_platform/app/home/data/model/security_object/security_object.dart';
import '../../../../common/static/export_all.dart';
import 'object_events_tab.dart';
import 'object_information_tab.dart';

class ObjectTabbar extends StatefulWidget {
  const ObjectTabbar({required this.object, super.key});

  final SecurityObject object;

  @override
  State<ObjectTabbar> createState() => _TabBarState();
}

class _TabBarState extends State<ObjectTabbar> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _DecoratedTabBar(
          tabBar: TabBar(
              indicatorColor: Colors.black,
              labelColor: const Color.fromRGBO(75, 78, 81, 1),
              splashBorderRadius: BorderRadius.zero,
              labelPadding: EdgeInsets.zero,
              labelStyle: AppStyles.subHeader2(),
              unselectedLabelStyle: AppStyles.body2(),
              controller: _tabController,
              indicatorWeight: 3.h,
              splashFactory: NoSplash.splashFactory,
              tabs: [
                const Tab(
                    height: 30,
                    child: Align(
                        alignment: Alignment.topCenter,
                        child: Text('Информация'))),
                Tab(
                    height: 30,
                    child: Align(
                        alignment: Alignment.topCenter,
                        child: Badge(
                            position: BadgePosition.topEnd(top: -15, end: -25),
                            badgeColor: const Color.fromRGBO(167, 43, 42, 1),
                            badgeContent: Text('1',
                                style: AppStyles.body2()
                                    .copyWith(color: Colors.white)),
                            child: const Text('События')))),
              ]),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: const Color.fromRGBO(199, 201, 200, 1),
                width: 3.h,
              ),
            ),
          ),
        ),
        Expanded(child: _tabBarView()),
      ],
    );
  }

  TabBarView _tabBarView() {
    return TabBarView(
      controller: _tabController,
      children: [
        ObjectInformationTab(object: widget.object),
        const ObjectEventsTab(),
      ],
    );
  }

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}

class _DecoratedTabBar extends StatelessWidget implements PreferredSizeWidget {
  const _DecoratedTabBar({required this.tabBar, required this.decoration});

  final TabBar tabBar;
  final BoxDecoration decoration;

  @override
  Size get preferredSize => tabBar.preferredSize;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: Container(decoration: decoration)),
        tabBar,
      ],
    );
  }
}
