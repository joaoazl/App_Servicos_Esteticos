import 'package:app/models/tipo_pagamento.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class TipoPagamentoService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  add(TipoPagamento tipo_pagamento) {
    var tipo_pagamentoMap = tipo_pagamento.toMap();
    _firestore.collection("tipo_pagamento").add(tipo_pagamentoMap);
  }

  getTipoPagamento() {
    var employeeCollection = _firestore.collection("tipo_pagamento");
    return employeeCollection.snapshots();
  }

  deleteTipoPagamento(String id) {
    DocumentReference docRef = _firestore.collection('tipo_pagamento').doc(id);
    docRef
        .delete()
        .whenComplete(() => debugPrint("Dados do $id deletado com sucesso!!"))
        .catchError((erro) => debugPrint("Erro ao deletar o $id -> $erro!!"));
  }

  updateTipoPagamento(TipoPagamento tipo_pagamento) {
    DocumentReference docRef = _firestore.collection('tipo_pagamento').doc(tipo_pagamento.id);
    docRef
        .update(tipo_pagamento.toMap())
        .whenComplete(
            () => debugPrint("Dados do ${tipo_pagamento.id} deletado com sucesso!!"))
        .catchError(
            (erro) => debugPrint("Erro ao deletar o ${tipo_pagamento.id} -> $erro!!"));
  }
}