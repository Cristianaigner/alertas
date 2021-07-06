import 'dart:io';

import 'package:alertas/widgets/boton_azul.dart';
import 'package:alertas/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class PrincipalPage extends StatelessWidget {
  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    final key = GlobalKey();
    final usuario = box.read('usuario');
    return WillPopScope(
      onWillPop: () => willScop(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Pantalla principal',
          ),
          actions: [
            IconButton(
                icon: Icon(Icons.fact_check_outlined),
                onPressed: () => Get.dialog(AlertDialog(
                      title: Text('Atencion'),
                      content: Text('Ver actas?'),
                      actions: [
                        TextButton(
                            onPressed: () => Get.toNamed('actas'),
                            child: Text('Si')),
                        TextButton(
                            onPressed: () => Get.back(), child: Text('Cancel')),
                      ],
                    )))
          ],
        ),
        body: SingleChildScrollView(
          //alignment: Alignment.center,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            //crossAxisAlignment: CrossAxisAlignment.center,|
            children: [
              Logo(
                titulo: '#ReconstrucciónLanús',
                key: key,
              ),
              SizedBox(height: 10),
              Text('Email: $usuario',
                  style: TextStyle(color: Colors.purple[300])),
              SizedBox(height: 50),
              BotonAzul(
                text: 'total por circuito',
                onPressed: () => Get.toNamed('tcircuito'),
                color: Colors.amber[900],
                width: Get.context!.width * 0.40,
                key: key,
              ),
              //   SizedBox(height: 50),
              //   BotonAzul(
              //     text: 'Ver actas',
              //     onPressed: () => Get.toNamed('actas'),
              //     color: Colors.red[400],
              //     width: Get.context.width * 0.40,
              //   ),
              SizedBox(height: 50),
              BotonAzul(
                text: 'Total General',
                onPressed: () => Get.toNamed('total'),
                color: Colors.purple[300],
                width: Get.context!.width * 0.60,
                key: key,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> willScop() {
    return Get.dialog(AlertDialog(
      title: Text('Atencion'),
      content: Text('Desea Salir?'),
      actions: [
        TextButton(
            onPressed: () {
              if (GetPlatform.isAndroid) {
                SystemNavigator.pop();
              } else {
                exit(0);
              }
            },
            child: Text('Ok')),
        TextButton(onPressed: () => Get.back(), child: Text('Cancel')),
      ],
    ));
  }
}
