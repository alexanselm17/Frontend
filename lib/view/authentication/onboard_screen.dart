import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop0koa_frontend/utils/button.dart';
import 'package:shop0koa_frontend/view/authentication/confirm_pin.dart';
import 'package:shop0koa_frontend/view/screens/GetStarted/started.dart';
import 'package:shop0koa_frontend/view/screens/screens.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({super.key});

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  late SharedPreferences preferences;
  final PageController _pageController = PageController();
  int _currentPageIndex = 0;

  final List<OnboardingItem> onboardingItems = [
    OnboardingItem(
      title: 'Merchant App',
      description: 'Loading',
      imageUrl: 'assets/images/logo.jpg',
      child: const CircularProgressIndicator(),
    ),
    OnboardingItem(
      title: 'Track Your Sales',
      description:
          'Monitor your sales in real-time and analyze your performance.',
      imageUrl: 'assets/images/logo.jpg',
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
      //backgroundColor: Colors.white,
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
            //
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                onboardingItems.length,
                (index) =>
                    buildDot(index: index, currentIndex: _currentPageIndex),
              ),
            ),
          if (_currentPageIndex == 1)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: CustomButton(
                  onTap: () {
                    //Bypassed the Navigation from Onboading to Sign up page fpr new users
                    //If the User exists we will be displaying the login page first instead of the onboard screen
                    Navigator.of(context).pushNamed(LoginPage.routeName);
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
            ? Theme.of(context).colorScheme.onSurface
            : Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
      ),
    );
  }
}

class OnboardingItem {
  final String title;
  final String description;
  final String? imageUrl;
  final Widget? child;

  OnboardingItem({
    required this.title,
    required this.description,
    this.imageUrl,
    this.child,
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
          Container(
            //width: MediaQuery.sizeOf(context).height * .5,
            decoration: const BoxDecoration(shape: BoxShape.circle),

            child: ClipOval(
              child: Image.asset(
                item.imageUrl ?? '',
                height: 200,
                width: 200,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          Text(
            item.title,
            style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10.0),
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
