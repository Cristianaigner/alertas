import 'package:alertas/controllers/controllerstabs/tab2_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Tab2Page extends StatelessWidget {
  final controller = Get.put(Tab2Controller());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<Tab2Controller>(
        init: controller,
        builder: (_) => Scaffold(
            appBar: AppBar(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Alertas Vistas'),
                  Icon(Icons.messenger_outline_outlined),
                ],
              ),
            ),
            body: _.buidBody()));
  }
}
