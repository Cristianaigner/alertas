import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

final box = GetStorage();

class UpdateAlertController extends GetxController {
  final escuela = box.read('escuela');
  final circuito = box.read('circuito');

  CollectionReference users = FirebaseFirestore.instance.collection('alertas');

  Future<void> updateUser(String id) {
    return users
        .doc(id)
        .update({'edad': 25})
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }

  Future<void> deleteUser(String id) {
    return users
        .doc(id)
        .delete()
        .then((value) => print("User Deleted"))
        .catchError((error) => print("Failed to delete user: $error"));
  }

  Future<void> addAlert(
      String usuario, String circuito, String escuela, String alerta) {
    //var mesa = box.read('mesa');
    // Call the user's CollectionReference to add a new user
    return users
        .add({
          'usuario': usuario,
          'circuito': circuito, // John Doe
          'escuela': escuela, // 42
          'alerta': alerta,
          'hora': DateTime.now() // Stokes and Sons
          // 42
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
}
