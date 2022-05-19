class AgendamentoService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  add(Agendamento _agenda) {
    var agendaMap = _agenda.toMap();
    _firestore.collection("agenda").add(agendaMap);
  }

  getAgendamento() {
    var employeeCollection = _firestore.collection("agenda");
    return employeeCollection.snapshots();
  }

  deleteAgendamento(String id) {
    DocumentReference docRef = _firestore.collection('agenda').doc(id);
    docRef
        .delete()
        .whenComplete(() => debugPrint("Dados do $id deletado com sucesso!!"))
        .catchError((erro) => debugPrint("Erro ao deletar o $id -> $erro!!"));
  }

  updateAgendamento(Agendamento _agenda) {
    DocumentReference docRef = _firestore.collection('agenda').doc(_agenda.id);
    docRef
        .update(_agenda.toMap())
        .whenComplete(
            () => debugPrint("Dados do ${_agenda.id} deletado com sucesso!!"))
        .catchError(
            (erro) => debugPrint("Erro ao deletar o ${_agenda.id} -> $erro!!"));
  }
}