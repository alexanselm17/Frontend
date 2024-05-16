import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:shop0koa_frontend/constants/colors.dart';
import 'package:shop0koa_frontend/controllers/navigation_controller.dart';
import 'package:shop0koa_frontend/view/screens/account_page.dart';
import 'package:shop0koa_frontend/view/screens/catalogue_page.dart';
import 'package:shop0koa_frontend/view/screens/home_page.dart';
import 'package:shop0koa_frontend/view/screens/oders/oders_page.dart';

class NavigationPage extends GetView<NavigationController> {
  const NavigationPage({super.key});

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
          icon: const Icon(CupertinoIcons.house),
          title: ("Home"),
          activeColorPrimary: AppColors.mainColor,
          inactiveColorPrimary: CupertinoColors.black),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.list_bullet),
        title: ("Catalogue"),
        activeColorPrimary: AppColors.mainColor,
        inactiveColorPrimary: CupertinoColors.black,
      ),
      // PersistentBottomNavBarItem(
      //   textStyle: const TextStyle(color: Colors.black),
      //   icon: const Icon(CupertinoIcons.cart),
      //   title: ("Oders"),
      //   activeColorPrimary: AppColors.mainColor,
      //   inactiveColorPrimary: CupertinoColors.black,
      // ),
      // PersistentBottomNavBarItem(
      //   icon: const Icon(CupertinoIcons.profile_circled),
      //   title: ("Account"),
      //   activeColorPrimary: AppColors.mainColor,
      //   inactiveColorPrimary: CupertinoColors.black,
      // ),
    ];
  }

  List<Widget> _buildScreens() {
    return [
      const HomePage(),
      const CataloguePage(),
      // const OdersPage(),
      // const AccountPage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      // controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style6, // Choose the nav bar style with this property.
    );
  }
}
