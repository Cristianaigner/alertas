import 'package:alertas/controllers/update_controller.dart';
import 'package:alertas/model/alertas_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:date_time_format/date_time_format.dart';

final box = GetStorage();
final update = Get.put(UpdateController());

class Tab1Controller extends GetxController {
  List alertas = [];
  List escuelas = [];
  String alerta = '';
  String escuela = '';

  final query = FirebaseFirestore.instance.collection('alertas');

  Map<String, dynamic> alertasMap = {'alerta': '', 'circuito': ''};

  Widget buidBody() {
    final cir = box.read('circuito');
    return StreamBuilder(
        builder: buildList,
        stream: query.where('circuito', isEqualTo: cir).snapshots());
  }

  Widget buildList(context, AsyncSnapshot<QuerySnapshot> snapshot) {
    DateTime datetime;
    if (!snapshot.hasData) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      if (snapshot.data!.docs.length == 0) {
        return buidEmptyMessage();
      } else {
        return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
          ImagenModel item = ImagenModel.from(document);
          datetime = item.hora.toDate();
          return Dismissible(
            direction: DismissDirection.startToEnd,
            key: Key(item.id),
            background: Container(
              child: Row(
                children: [
                  Icon(
                    Icons.check_circle,
                    color: Colors.white,
                  ),
                  Text(
                    'Visto',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              color: Colors.green,
            ),
            child: ListTile(
              title: Text('${item.alerta}'),
              subtitle: Text('${item.escuela}'),
              trailing:
                  Text('${DateTimeFormat.format(datetime, format: 'H:i')}'),
              onTap: () => Get.dialog(AlertDialog(
                contentPadding: EdgeInsets.symmetric(vertical: 30),
                contentTextStyle: TextStyle(color: Colors.white, fontSize: 18),
                backgroundColor: Colors.blue,
                title: Text(
                  '${item.alerta}',
                  style: TextStyle(color: Colors.white),
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '${item.escuela}',
                    ),
                    SizedBox(height: 20),
                    Text(
                      '${item.usuario}',
                    ),
                    SizedBox(height: 20),
                    Text(
                      '${DateTimeFormat.format(datetime, format: 'H:i')}',
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child:
                          Text('Listo', style: TextStyle(color: Colors.white))),
                ],
              )),
            ),
            onDismissed: (direction) {
              update.deleteUser(item.id);
              update.addData(item.alerta, item.escuela, item.circuito,
                  item.hora, item.usuario);
            },
          );
        }).toList());
      }
    }
  }

  Widget buidEmptyMessage() {
    return Center(
      child: Flex(
        direction: Axis.vertical,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.check,
            size: 45,
            color: Colors.blueGrey,
          ),
          Padding(padding: EdgeInsets.all(10.0)),
          Text(
            'Parece que no hay aletas',
            style: TextStyle(color: Colors.blueGrey),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }

  message() {
    return Get.dialog(AlertDialog(
      title: Text('Atencion'),
      content: Text('Pasar a vistos?'),
      actions: [
        TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text('Si')),
        TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text('Cancelar')),
      ],
    ));
  }
}
