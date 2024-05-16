import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop0koa_frontend/constants/colors.dart';
import 'package:shop0koa_frontend/utils/Vertical_spacing.dart';
import 'package:shop0koa_frontend/view/screens/oders/buy_now_pay_later.dart';
import 'package:shop0koa_frontend/view/screens/oders/flexi_save.dart';

class OdersPage extends StatefulWidget {
  const OdersPage({super.key});

  @override
  State<OdersPage> createState() => _OdersPageState();
}

class _OdersPageState extends State<OdersPage>
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
            Get.back();
          },
        ),
        title: const Text('Oders'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.white),
              padding: const EdgeInsets.all(5.0),
              child: TabBar(
                controller: _tabController,
                dividerColor: Colors.white,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.white),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.grey,
                labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                unselectedLabelStyle: const TextStyle(),
                tabs: [
                  SizedBox(
                    width: 120, // Specify the width for the first tab
                    child: Tab(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.mainColor,
                        ),
                        child: const Text('FlexiSave'),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 120, // Specify the width for the second tab
                    child: Tab(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.mainColor,
                        ),
                        child: const Text("Pay Later"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const VerticalSpacing(),
            Expanded(
                child: TabBarView(
              controller: _tabController,
              children: const [PayLaterOders(), FlexiSave()],
            ))
          ],
        ),
      ),
    );
  }
}
