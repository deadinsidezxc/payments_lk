import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../common/static/export_all.dart';
import '../home/screen/list_security_object_screen.dart';
import '../payments/presentation/pages/contracts_main_page.dart';

class TabView extends StatelessWidget {
  TabView({Key? key}) : super(key: key);

  final _controller = PersistentTabController(initialIndex: 0);

  final _screens = [
    const ListSecurityObjectScreen(),
    const PaymentsMainPage(),
    const Center(child: Text('Еще не готово')),
    const Center(child: Text('Еще не готово')),
    const Center(child: Text('Еще не готово')),
  ];

  final _navBarsItems = [
    PersistentBottomNavBarItem(
      icon: const Icon(Ionicons.home),
      iconSize: 31,
      title: "Главное",
      textStyle: AppStyles.body3(),
      activeColorPrimary: AppColors.darkGrey,
      inactiveColorPrimary: const Color.fromRGBO(196, 196, 196, 1),
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Ionicons.card),
      iconSize: 31,
      title: "Платежи",
      textStyle: AppStyles.body3(),
      activeColorPrimary: AppColors.darkGrey,
      inactiveColorPrimary: const Color.fromRGBO(196, 196, 196, 1),
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Ionicons.grid),
      iconSize: 31,
      title: "Сервисы",
      textStyle: AppStyles.body3(),
      activeColorPrimary: AppColors.primary,
      inactiveColorPrimary: const Color.fromRGBO(196, 196, 196, 1),
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Ionicons.chatbox_ellipses),
      iconSize: 31,
      title: "Поддержка",
      textStyle: AppStyles.body3(),
      activeColorPrimary: AppColors.primary,
      inactiveColorPrimary: const Color.fromRGBO(196, 196, 196, 1),
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Ionicons.person),
      iconSize: 31,
      title: "Профиль",
      textStyle: AppStyles.body3(),
      activeColorPrimary: AppColors.primary,
      inactiveColorPrimary: const Color.fromRGBO(196, 196, 196, 1),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _screens,
      items: _navBarsItems,
      decoration: const NavBarDecoration(
        boxShadow: [
          BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.3),
              blurRadius: 0.1,
              offset: Offset(0, -1)),
        ],
      ),
      navBarStyle: NavBarStyle.style2,
    );
  }
}
