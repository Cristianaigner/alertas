import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class TabsController extends GetxController {
  int paginaActual = 0;
  PageController pagectrl = PageController();

  void navigationTab(int valor) {
    paginaActual = valor;
    print(paginaActual);
    pagectrl.animateToPage(valor,
        duration: Duration(milliseconds: 250), curve: Curves.easeInOut);
    update();
  }
}
