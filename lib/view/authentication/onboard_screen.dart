import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop0koa_frontend/controllers/introduction_controller.dart';
import 'package:shop0koa_frontend/utils/button.dart';
import 'package:shop0koa_frontend/view/authentication/confirm_pin.dart';
import 'package:shop0koa_frontend/view/authentication/login_page.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({super.key});

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  IntroductionController introductionController = Get.find();

  late SharedPreferences preferences;
  final PageController _pageController = PageController();
  int _currentPageIndex = 0;

  final List<OnboardingItem> onboardingItems = [
    OnboardingItem(
      title: 'Welcome to Our shopOkoa App',
      description: 'Manage your sales, inventory, and more with ease.',
      imageUrl: 'assets/images/apple.png',
    ),
    OnboardingItem(
      title: 'Track Your Sales',
      description:
          'Monitor your sales in real-time and analyze your performance.',
      imageUrl: 'assets/images/apple.png',
    ),
    OnboardingItem(
      title: 'Manage Inventory',
      description: 'Effortlessly manage your inventory and stock levels.',
      imageUrl: 'assets/images/apple.png',
    ),
  ];
  @override
  void initState() {
    _pageController.addListener(() {
      setState(() {
        _currentPageIndex = _pageController.page!.round();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: onboardingItems.length,
              itemBuilder: (context, index) {
                return OnboardingItemWidget(
                  item: onboardingItems[index],
                  isLastPage: index == onboardingItems.length - 1,
                );
              },
            ),
          ),
          const SizedBox(height: 16.0),
          if (_currentPageIndex < onboardingItems.length - 1)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                onboardingItems.length,
                (index) =>
                    buildDot(index: index, currentIndex: _currentPageIndex),
              ),
            ),
          if (_currentPageIndex == onboardingItems.length - 1)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: CustomButton(
                  onTap: () {
                    Get.to(const ConfirmPin());
                    introductionController.disableIntro();
                  },
                  text: 'Get Started',
                ),
              ),
            ),
          const SizedBox(height: 16.0),
        ],
      ),
    );
  }

  Widget buildDot({required int index, required int currentIndex}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      width: 8.0,
      height: 8.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: currentIndex == index
            ? Colors.black
            : Colors.black.withOpacity(0.5),
      ),
    );
  }
}

class OnboardingItem {
  final String title;
  final String description;
  final String imageUrl;

  OnboardingItem({
    required this.title,
    required this.description,
    required this.imageUrl,
  });
}

class OnboardingItemWidget extends StatelessWidget {
  final OnboardingItem item;
  final bool isLastPage;

  const OnboardingItemWidget({
    super.key,
    required this.item,
    required this.isLastPage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            item.imageUrl,
            height: 300,
            width: 300,
          ),
          const SizedBox(height: 32.0),
          Text(
            item.title,
            style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16.0),
          Text(
            item.description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16.0,
            ),
          ),
          const SizedBox(height: 32.0),
        ],
      ),
    );
  }
}
