import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop0koa_frontend/constants/app_constants.dart';

class IntroductionController extends GetxController {
  final Future<SharedPreferences> sharedPreferences =
      SharedPreferences.getInstance();
  RxBool showIntro = true.obs;

  @override
  void onInit() {
    getIntroStatus();
    super.onInit();
  }

  void getIntroStatus() async {
    final SharedPreferences prefs = await sharedPreferences;
    if (prefs.getBool(AppConstants.INITIAL_LAUNCH) == null ||
        prefs.getBool(AppConstants.INITIAL_LAUNCH) == true) {
      showIntro.value = true;
      update();
    } else {
      showIntro.value = false;
      update();
    }
  }

  void disableIntro() async {
    final SharedPreferences prefs = await sharedPreferences;
    prefs.setBool(AppConstants.INITIAL_LAUNCH, false);
    showIntro.value = false;
    update();
  }
}
