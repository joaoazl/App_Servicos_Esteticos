class PagamentoService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  add(Pagamento _pagamento) {
    var pagamentoMap = _pagamento.toMap();
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

  updateClient(Pagamento _pagamento) {
    DocumentReference docRef = _firestore.collection('pagamento').doc(_pagamento.id);
    docRef
        .update(_pagamento.toMap())
        .whenComplete(
            () => debugPrint("Dados do ${_pagamento.id} deletado com sucesso!!"))
        .catchError(
            (erro) => debugPrint("Erro ao deletar o ${_pagamento.id} -> $erro!!"));
  }
}