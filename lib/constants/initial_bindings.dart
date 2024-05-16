import 'package:get/get.dart';
import 'package:shop0koa_frontend/controllers/introduction_controller.dart';
import 'package:shop0koa_frontend/controllers/navigation_controller.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<IntroductionController>(IntroductionController());
    Get.put<NavigationController>(NavigationController());
  }
}
