import 'package:alertas/controllers/user_controller.dart';
import 'package:alertas/widgets/labels.dart';
import 'package:alertas/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  final controller = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey();
    return Scaffold(
        backgroundColor: Color(0xffF2F2F2),
        body: GetBuilder<UserController>(
          init: UserController(),
          builder: (_) => SafeArea(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.9,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Logo(titulo: '#ReconstrucciónLanús', key: key),
                    _.form(),
                    Labels(
                      ruta: 'register',
                      titulo: 'Debes estar autorizado para ingresar',
                      subTitulo: 'Atención!',
                      key: key,
                    ),
                    Text(
                      'Términos y condiciones de uso',
                      style: TextStyle(fontWeight: FontWeight.w200),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
