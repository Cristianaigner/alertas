import 'package:cloud_firestore/cloud_firestore.dart';

//String imagenModelToJson(ImagenModel data) => json.encode(data.toJson());

class ImagenModel {
  String id;
  String alerta = '';
  String escuela = '';
  String circuito = '';
  Timestamp hora;
  String usuario = '';
  bool check;

  ImagenModel(this.alerta, this.id,
      {required this.circuito,
      required this.escuela,
      required this.usuario,
      required this.hora,
      required this.check});

  ImagenModel.from(DocumentSnapshot snapshot)
      : id = snapshot.id,
        alerta = snapshot['alerta'],
        circuito = snapshot['circuito'],
        hora = snapshot['hora'],
        usuario = snapshot['usuario'],
        check = snapshot['check'],
        escuela = snapshot['escuela'];

  Map<String, dynamic> toJson() {
    return {
      'alerta': alerta,
      'escuela': escuela,
      'circuito': circuito,
      'hora': hora,
      'usuario': usuario,
    };
  }
}
