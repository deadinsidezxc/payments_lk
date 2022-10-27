import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';


class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({super.key});

  @override
  State<CustomNavigationBar> createState() => _NavigationBarState();
}

class _NavigationBarState extends State<CustomNavigationBar> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: true,
      showUnselectedLabels: false,
      selectedItemColor: Colors.red.shade600,
      unselectedItemColor: Colors.black45,
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Ionicons.home, size: 30,),
          label: 'Главное',
        ),
        BottomNavigationBarItem(
          icon: Icon(Ionicons.card, size: 30,),
          label: 'Платежи',
        ),
        BottomNavigationBarItem(
          icon: Icon(Ionicons.grid, size: 30,),
          label: 'Сервисы',
        ),
        BottomNavigationBarItem(
          icon: Icon(Ionicons.chatbox_ellipses, size: 30,),
          label: 'Сообщения',
        ),
        BottomNavigationBarItem(
          icon: Icon(Ionicons.person, size: 30,),
          label: 'Профиль',
        ),
      ],
    );
  }
}