import 'package:alertas/controllers/home_controller.dart';
import 'package:alertas/widgets/boton_azul.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class TcircuitoPage extends StatelessWidget {
  final controller = Get.put(TcircuitoController());
  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TcircuitoController>(
        id: 'circuito',
        init: controller,
        builder: (_) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Seleccion de Circuito',
              ),
              actions: [
                IconButton(
                    onPressed: () =>
                        Get.offNamedUntil('principal', (route) => false),
                    icon: Icon(Icons.home_outlined))
              ],
            ),
            body: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.only(top: 150),
                child: Column(
                  children: [
                    _.crearCircuito(),
                    SizedBox(
                      height: 20,
                    ),
                    BotonAzul(
                        color: Colors.purple[300],
                        text: 'Seleccionar',
                        width: Get.context!.width * 0.7,
                        onPressed: () => _.press())
                  ],
                )),
          );
        });
  }
}
