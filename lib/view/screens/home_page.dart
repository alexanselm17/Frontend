import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop0koa_frontend/constants/app_constants.dart';
import 'package:shop0koa_frontend/constants/colors.dart';
import 'package:shop0koa_frontend/provider/authenticationProvider.dart';
import 'package:shop0koa_frontend/view/authentication/login.dart';
import 'package:shop0koa_frontend/view/authentication/onboard_screen.dart';
import 'package:shop0koa_frontend/view/widgets/Vertical_spacing.dart';
import 'package:shop0koa_frontend/view/screens/oders/oders_page.dart';
import 'package:shop0koa_frontend/view/widgets/product_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late SharedPreferences preferences;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final provider = Provider.of<AuthProvider>(context);
    provider.getUser(userId: provider.user!.user!.id!, context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(6.0),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Consumer<AuthProvider>(
              builder: (context, authProvider, _) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: CachedNetworkImageProvider(
                                authProvider.user!.user!.url!,
                              ),
                              // child: CustomCachedNetworkImage(
                              //   image: authProvider.user!.user!.url!,
                              //   width: 50,
                              //   height: 50,
                              // ),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  authProvider.user!.user!.businessName!
                                      .toUpperCase(),
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Hello ${authProvider.user!.user!.firstName!}',
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.notifications_none),
                            ),
                            authProvider.isLoading
                                ? const CircularProgressIndicator()
                                : IconButton(
                                    onPressed: () async {
                                      final preferences =
                                          await SharedPreferences.getInstance();
        
                                      if (preferences
                                          .containsKey(AppConstants.TOKEN_KEY)) {
                                        final token = preferences.getString(
                                                AppConstants.TOKEN_KEY) ??
                                            '';
                                        if (token != null || token != '') {
                                          authProvider.logOut(
                                            context: context,
                                            token: token,
                                          );
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    LoginPage()),
                                          );
                                        } else {}
                                      }
                                    },
                                    icon: const Icon(Icons.logout),
                                  ),
                          ],
                        ),
                      ],
                    ),
                    const VerticalSpacing(),
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.shade200,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Row(
                                children: [
                                  Text(
                                    'Your Balance  ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Icon(Icons.visibility),
                                ],
                              ),
                              Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'View more ',
                                      style: TextStyle(
                                        color: AppColors.mainColor,
                                        decoration: TextDecoration.underline,
                                        decorationThickness: 2,
                                        decorationColor: AppColors.mainColor,
                                        decorationStyle:
                                            TextDecorationStyle.solid,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          print('Text tapped!');
                                          // Perform your action here
                                        },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const VerticalSpacing(),
                          Container(
                            width: MediaQuery.of(context).size.width - 10,
                            padding: const EdgeInsets.all(25),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Colors.green,
                                  Colors.green,
                                  Colors.black,
                                ],
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                'Ksh. 0',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 32,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const VerticalSpacing(),
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.shade200,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Row(
                                children: [
                                  Text(
                                    'Pending Orders ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Icon(Icons.access_time_rounded),
                                ],
                              ),
                              Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'View more ',
                                      style: TextStyle(
                                        color: AppColors.mainColor,
                                        decoration: TextDecoration.underline,
                                        decorationThickness: 2,
                                        decorationColor: AppColors.mainColor,
                                        decorationStyle:
                                            TextDecorationStyle.solid,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.of(context)
                                              .pushNamed(OrdersPage.routeName);
                                          //(const OdersPage());
                                          print('Text tapped!');
                                        },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const VerticalSpacing(),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              OdersCard(oderType: 'Pick Up', oderAmount: 0),
                              OdersCard(oderType: 'Deliveries', oderAmount: 0),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const VerticalSpacing(),
                    const Text(
                      'Catalogue',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const ProductTile(
                      isAnalytics: false,
                      productName: 'soko maize meal -5 kg',
                      leftUnits: '45',
                      productPrice: '389',
                      productImage:
                          'https://images.pexels.com/photos/90946/pexels-photo-90946.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                      productDiscount: '20',
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class OdersCard extends StatelessWidget {
  final String oderType;
  final int oderAmount;
  const OdersCard({
    super.key,
    required this.oderType,
    required this.oderAmount,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.25,
          height: MediaQuery.of(context).size.width * 0.25,
          padding: const EdgeInsets.all(25),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: AppColors.mainColor),
          child: Center(
            child: Text(
              oderAmount.toString(),
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 32),
            ),
          ),
        ),
        const VerticalSpacing(),
        Text(
          oderType,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ],
    );
  }
}
