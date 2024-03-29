import 'package:alertas/pages/login_page.dart';
import 'package:alertas/pages/principal_page.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MainController extends GetxController {
  var page;
  @override
  void onInit() {
    super.onInit();
    final box = GetStorage();
    bool isTrue = box.read('login') ?? false;

    //ThemeData get theme => isDark ? ThemeData.dark() : ThemeData.light();
    //void changeTheme(bool val) => box.write('darkmode', val);
    if (isTrue) {
      page = PrincipalPage();
    } else {
      page = LoginPage();
      print('Login');
    }
  }
}
