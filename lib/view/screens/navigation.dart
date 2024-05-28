import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shop0koa_frontend/constants/colors.dart';
import 'package:shop0koa_frontend/controllers/navigation_controller.dart';
import 'package:shop0koa_frontend/view/account/accounts.dart';
import 'package:shop0koa_frontend/view/screens/catalogue_page.dart';
import 'package:shop0koa_frontend/view/screens/home_page.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage>
    with TickerProviderStateMixin {
  int _currentPageIndex = 0;
  late PageController _pageController;

  final List<BottomNavigationBarItem> _navBarItems = [
    const BottomNavigationBarItem(
      label: 'Home',
      icon: Icon(
        CupertinoIcons.house,
      ),
    ),
    const BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.list_bullet),
      label: 'Catalogue',
    ),
    const BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.profile_circled),
      label: 'Account',
    )
  ];

  final List<Widget> _buildScreens = [
    const HomePage(),
    const CataloguePage(),
    const AccountPage(),
  ];

  void _updateCurrentPageIndex(int index) {
    setState(() {
      _currentPageIndex = index;
    });
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.ease,
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: PageView(
        onPageChanged: _updateCurrentPageIndex,
        controller: _pageController,
        children: _buildScreens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentPageIndex,
        onTap: (value) {
          _updateCurrentPageIndex(value);
        },
        items: _navBarItems,
        selectedItemColor: AppColors.mainColor,
        unselectedItemColor: CupertinoColors.black,
      ),
    );
  }
}
