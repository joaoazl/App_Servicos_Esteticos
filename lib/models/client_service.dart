import 'package:app/models/client.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class ClientService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  add(Client client) {
    var clientMap = client.toMap();
    _firestore.collection("clients").add(clientMap);
  }

  getClient() {
    var employeeCollection = _firestore.collection("clients");
    return employeeCollection.snapshots();
  }

   Future<QuerySnapshot<Map<String, dynamic>>> getList() {
    var employeeCollection = _firestore.collection("clients");
    return employeeCollection.get();
  }

  deleteClient(String id) {
    DocumentReference docRef = _firestore.collection('clients').doc(id);
    docRef
        .delete()
        .whenComplete(() => debugPrint("Dados do $id deletado com sucesso!!"))
        .catchError((erro) => debugPrint("Erro ao deletar o $id -> $erro!!"));
  }

  updateClient(Client client) {
    DocumentReference docRef = _firestore.collection('clients').doc(client.id);
    docRef
        .update(client.toMap())
        .whenComplete(
            () => debugPrint("Dados do ${client.id} deletado com sucesso!!"))
        .catchError(
            (erro) => debugPrint("Erro ao deletar o ${client.id} -> $erro!!"));
  }
}