import 'package:app/models/service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class ServicosService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  add(Service service) {
    var serviceMap = service.toMap();
    _firestore.collection("services").add(serviceMap);
  }

  getService() {
    var employeeCollection = _firestore.collection("services");
    return employeeCollection.snapshots();
  }

  deleteService(String id) {
    DocumentReference docRef = _firestore.collection('services').doc(id);
    docRef
        .delete()
        .whenComplete(() => debugPrint("Dados do $id deletado com sucesso!!"))
        .catchError((erro) => debugPrint("Erro ao deletar o $id -> $erro!!"));
  }

  updateService(Service service) {
    DocumentReference docRef = _firestore.collection('services').doc(service.id);
    docRef
        .update(service.toMap())
        .whenComplete(
            () => debugPrint("Dados do ${service.id} deletado com sucesso!!"))
        .catchError(
            (erro) => debugPrint("Erro ao deletar o ${service.id} -> $erro!!"));
  }
}
