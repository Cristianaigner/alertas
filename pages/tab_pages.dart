import 'package:alertas/controllers/tabs_controller.dart';
import 'package:alertas/pages/tab1_page.dart';
import 'package:alertas/pages/tab2_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabsPage extends StatelessWidget {
  final controller = Get.put(TabsController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TabsController>(
      init: controller,
      builder: (_) => Scaffold(
          //appBar: AppBar(),
          body: PageView(
            controller: _.pagectrl,
            onPageChanged: (value) => _.navigationTab(value),
            children: [Tab1Page(), Tab2Page()],
          ),
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: _.paginaActual,
              onTap: (value) => _.navigationTab(value),
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.notification_add_sharp), label: 'Nuevos'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.mark_chat_read_outlined), label: 'Vistos'),
              ])),
    );
  }
}
