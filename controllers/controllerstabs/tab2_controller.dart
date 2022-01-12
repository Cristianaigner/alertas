import 'package:alertas/controllers/update_controller.dart';
import 'package:alertas/model/alertas_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

final box = GetStorage();
final update = Get.put(UpdateController());

class Tab2Controller extends GetxController {
  //bool check = false;
  List alertas = [];
  List escuelas = [];
  String alerta = '';
  String escuela = '';

  final query = FirebaseFirestore.instance.collection('alertaV');

  Map<String, dynamic> alertasMap = {'alerta': '', 'circuito': ''};

  Widget buidBody() {
    String cir = box.read('circuito');
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
            return Container(
                key: Key(item.id),
                child: Column(
                  children: [
                    ListTile(
                      onTap: () {
                        message(item);
                      },
                      title: Text('${item.alerta}'),
                      subtitle: Text('${item.escuela}'),
                      trailing: SizedBox(
                        width: 80,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                                '${DateTimeFormat.format(datetime, format: 'H:i')}'),
                            SizedBox(
                              width: 10,
                            ),
                            checking(item)
                          ],
                        ),
                      ),
                    ),
                    Divider(
                      height: 15,
                      //color: Colors.black,
                    )
                  ],
                ));
          }).toList(),
        );
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

  Widget checking(ImagenModel item) {
    if (item.check == false) {
      return Icon(
        Icons.check_circle,
      );
    } else {
      return Icon(
        Icons.check_circle,
        color: Colors.greenAccent,
      );
    }
  }

  Future message(ImagenModel item) {
    return Get.dialog(AlertDialog(
      title: Text('Atencion'),
      content: Text('Desea cambiar estado del mensaje?'),
      actions: [
        TextButton(
            onPressed: () {
              update.updateUser(item.id, item.check);
              Get.back();
            },
            child: Text('Ok')),
        TextButton(onPressed: () => Get.back(), child: Text('Cancel')),
      ],
    ));
  }
}
