import 'package:app/models/client.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class ClientService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  add(Client _client) {
    var clientMap = _client.toMap();
    _firestore.collection("clients").add(clientMap);
  }

  getClient() {
    var employeeCollection = _firestore.collection("clients");
    return employeeCollection.snapshots();
  }

  deleteClient(String id) {
    DocumentReference docRef = _firestore.collection('clients').doc(id);
    docRef
        .delete()
        .whenComplete(() => debugPrint("Dados do $id deletado com sucesso!!"))
        .catchError((erro) => debugPrint("Erro ao deletar o $id -> $erro!!"));
  }

  updateClient(Client _client) {
    DocumentReference docRef = _firestore.collection('clients').doc(_client.id);
    docRef
        .update(_client.toMap())
        .whenComplete(
            () => debugPrint("Dados do ${_client.id} deletado com sucesso!!"))
        .catchError(
            (erro) => debugPrint("Erro ao deletar o ${_client.id} -> $erro!!"));
  }
}