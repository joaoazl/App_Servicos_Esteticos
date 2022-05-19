import 'package:app/models/vendas.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class VendaService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> add(Venda venda) async{
    var vendaMap = venda.toMap();
    var ref = await _firestore.collection("venda").add(vendaMap);
    venda.id = ref.id;
  }

  getVenda() {
    var employeeCollection = _firestore.collection("venda");
    return employeeCollection.snapshots();
  }

  deleteVenda(String id) {
    DocumentReference docRef = _firestore.collection('venda').doc(id);
    docRef
        .delete()
        .whenComplete(() => debugPrint("Dados do $id deletado com sucesso!!"))
        .catchError((erro) => debugPrint("Erro ao deletar o $id -> $erro!!"));
  }

  updateVenda(Venda venda) {
    DocumentReference docRef = _firestore.collection('venda').doc(venda.id);
    docRef
        .update(venda.toMap())
        .whenComplete(
            () => debugPrint("Dados do ${venda.id} deletado com sucesso!!"))
        .catchError(
            (erro) => debugPrint("Erro ao deletar o ${venda.id} -> $erro!!"));
  }
}