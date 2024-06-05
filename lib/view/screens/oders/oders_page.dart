import 'package:flutter/material.dart';
import 'package:shop0koa_frontend/constants/colors.dart';
import 'package:shop0koa_frontend/view/widgets/Vertical_spacing.dart';
import 'package:shop0koa_frontend/view/screens/oders/buy_now_pay_later.dart';
import 'package:shop0koa_frontend/view/screens/oders/flexi_save.dart';

class OrdersPage extends StatefulWidget {
  static const routeName = 'OrdersPage';
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        shadowColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          'Orders',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TabBar(
              controller: _tabController,
              dividerColor: Colors.white,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: AppColors.mainColor,
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.grey,
              labelStyle: const TextStyle(fontWeight: FontWeight.bold),
              unselectedLabelStyle: const TextStyle(),
              tabs: const [
                Tab(
                  child: Text('FlexiSave'),
                ),
                Tab(
                  child: Text("Pay Later"),
                ),
              ],
            ),
            const VerticalSpacing(),
            Expanded(
                child: TabBarView(
              controller: _tabController,
              children: const [
                FlexiSave(),
                PayLaterOders(),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
