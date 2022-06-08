import 'package:app/models/client.dart';
import 'package:app/models/service.dart';

class Agendamento {
  late String? id;
  late Client client;
  late Service service;
  late List<Agendamento> agendamento;
  late String hora;
  late String data;
  late String? observacao;

  Agendamento({
    this.id,
    required this.client,
    required this.service,
    required this.hora,
    required this.data,
    this.observacao
  });

  Agendamento.fromMap(Map<String, dynamic> map)
      :
        hora = map['hora'],
        data = map['data'],
        observacao = map['observacao'];

  Map<String, dynamic> toMap() {
    return {
      'id_client': client.id,
      'id_service': service.id,
      'hora': hora,
      'data': data,
      'observacao':observacao
    };
  }
}