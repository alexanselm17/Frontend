import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop0koa_frontend/constants/colors.dart';
import 'package:shop0koa_frontend/view/account/accounts.dart';
import 'package:shop0koa_frontend/view/screens/catalogue_page.dart';
import 'package:shop0koa_frontend/view/screens/home_page.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    const HomePage(),
    const CataloguePage(),
    const AccountPage(),
  ];

  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.mainColor,
        onTap: onTappedBar,
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.house),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.list_bullet),
            label: 'Catalogue',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.profile_circled),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
