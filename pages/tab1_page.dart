import 'package:alertas/controllers/controllerstabs/tab1_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Tab1Page extends StatelessWidget {
  final controller = Get.put(Tab1Controller());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<Tab1Controller>(
        init: controller,
        builder: (_) => Scaffold(
            appBar: AppBar(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('Nuevas Alertas'), Icon(Icons.messenger)],
              ),
              actions: [
                IconButton(
                    onPressed: () =>
                        Get.offNamedUntil('home', (route) => false),
                    icon: Icon(Icons.change_circle_outlined))
              ],
            ),
            body: _.buidBody()));
  }
}
