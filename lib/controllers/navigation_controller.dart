import 'package:get/get.dart';

class NavigationController extends GetxController {
  RxInt selectedTab = 0.obs;
  onTabSelection(int index) => selectedTab.value = index;
}
