class TipoPagamentoService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  add(TipoPagamento _tipo_pagamento) {
    var tipo_pagamentoMap = _tipo_pagamento.toMap();
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

  updateTipoPagamento(TipoPagamento _tipo_pagamento) {
    DocumentReference docRef = _firestore.collection('tipo_pagamento').doc(_tipo_pagamento.id);
    docRef
        .update(_tipo_pagamento.toMap())
        .whenComplete(
            () => debugPrint("Dados do ${_tipo_pagamento.id} deletado com sucesso!!"))
        .catchError(
            (erro) => debugPrint("Erro ao deletar o ${_tipo_pagamento.id} -> $erro!!"));
  }
}