import 'package:app/models/pagamento.dart';
import 'package:app/models/vendas.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class PagamentoService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  add(Pagamento pagamento) {
    var pagamentoMap = pagamento.toMap();
    _firestore.collection("pagamento").add(pagamentoMap);
  }

  getPagamento() {
    var employeeCollection = _firestore.collection("pagamento");
    return employeeCollection.snapshots();
  }

  deletePagamento(String id) {
    DocumentReference docRef = _firestore.collection('pagamento').doc(id);
    docRef
        .delete()
        .whenComplete(() => debugPrint("Dados do $id deletado com sucesso!!"))
        .catchError((erro) => debugPrint("Erro ao deletar o $id -> $erro!!"));
  }

  updateClient(Pagamento pagamento) {
    DocumentReference docRef = _firestore.collection('pagamento').doc(pagamento.id);
    docRef
        .update(pagamento.toMap())
        .whenComplete(
            () => debugPrint("Dados do ${pagamento.id} deletado com sucesso!!"))
        .catchError(
            (erro) => debugPrint("Erro ao deletar o ${pagamento.id} -> $erro!!"));
  }

   addListPagamento(Venda venda, Pagamento pagamento){
    var vendaMap = venda.toMap();
    _firestore
      .collection('venda')
      .doc(venda.id)
      .collection('pagamentos')
      .add(pagamento.toMap());
  }
}