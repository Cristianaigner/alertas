import 'package:alertas/pages/principal_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'controllers/main_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MainController());
    return GetMaterialApp(
      theme: ThemeData(
        primaryColor: Colors.purple[300],
      ),

      debugShowCheckedModeBanner: false,
      title: 'Material App',
      // home: LoginPage(),
      home: controller.page,
      getPages: [
        GetPage(name: "principal", page: () => PrincipalPage()),
      ],
    );
  }
}
