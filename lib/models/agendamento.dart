import 'package:app/models/client.dart';
import 'package:app/models/service.dart';

class Agendamento {
   String? id;
   Client? client;
   List<Service>? services = [];
   String? hora;
   String? data;
   String? observacao;

  Agendamento(
      {this.id,
       this.client,
       this.services,
       this.hora,
       this.data,
      this.observacao});

  set(Service service) {
    services!.add(service);
  }

  Agendamento.fromMap(Map<String, dynamic> map)
      : hora = map['hora'],
        data = map['data'],
        observacao = map['observacao'];

  Map<String, dynamic> toMap() {
    return {
      'id_client': client!.id,
      'services': services,
      'hora': hora,
      'data': data,
      'observacao': observacao
    };
  }
}
