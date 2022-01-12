import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

final box = GetStorage();

class UpdateController extends GetxController {
  var escuela = box.read('escuela');
  var circuito = box.read('circuito');

//CollectionReference users =
//    FirebaseFirestore.instance.collection('votos/$circuito/$escuela');
  // CollectionReference imagenes =
  //     FirebaseFirestore.instance.collection('imagen/$circuito/$escuela');

  Future<void>? updateUser(String id, bool check) {
    CollectionReference alertas =
        FirebaseFirestore.instance.collection('alertaV');
    if (check == false) {
      return alertas
          .doc(id)
          .update({'check': true})
          .then((value) => print("User Updated"))
          .catchError((error) => print("Failed to update user: $error"));
    } else {
      return alertas
          .doc(id)
          .update({'check': false})
          .then((value) => print("User Updated"))
          .catchError((error) => print("Failed to update user: $error"));
    }
  }

  Future<void> deleteUser(String id) {
    CollectionReference alertas =
        FirebaseFirestore.instance.collection('alertas');
    return alertas
        .doc(id)
        .delete()
        .then((value) => print("User Deleted"))
        .catchError((error) => print("Failed to delete user: $error"));
  }

  Future<void> addData(String alerta, String escuela, String circuito,
      Timestamp hora, String usuario) {
    CollectionReference users =
        FirebaseFirestore.instance.collection('alertaV');
    //var mesa = box.read('mesa');
    // Call the user's CollectionReference to add a new user
    return users
        .add({
          'alerta': alerta,
          'escuela': escuela, // John Doe
          // 'company': company, // Stokes and Sons
          'circuito': circuito, // 42
          'hora': hora,
          'usuario': usuario,
          'check': false,

          // 42
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
}
