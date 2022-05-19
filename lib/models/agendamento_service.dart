import 'package:app/models/agendamento.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class AgendamentoService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  add(Agendamento agenda) {
    var agendaMap = agenda.toMap();
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

  updateAgendamento(Agendamento agenda) {
    DocumentReference docRef = _firestore.collection('agenda').doc(agenda.id);
    docRef
        .update(agenda.toMap())
        .whenComplete(
            () => debugPrint("Dados do ${agenda.id} deletado com sucesso!!"))
        .catchError(
            (erro) => debugPrint("Erro ao deletar o ${agenda.id} -> $erro!!"));
  }
}