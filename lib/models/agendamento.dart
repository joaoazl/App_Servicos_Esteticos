import 'package:app/models/client.dart';
import 'package:app/models/service.dart';

class Agendamento {
   String? id;
   Client? client;
   List<Service> services;
   String? hora;
   String? data;
   String? observacao;

  Agendamento(
      {this.id,
       this.client,
       List<Service>? services,
       this.hora,
       this.data,
        this.observacao
      }
    ): services = services ?? [];

  Agendamento.fromMap(Map<String, dynamic> map)
      : 
        services = map['services'].map((service)=> Service.fromMap(service)).toList(),
        hora = map['hora'],
        data = map['data'],
        observacao = map['observacao'];

  Map<String, dynamic> toMap() {
    return {
      'id_client': client!.id,
      'services': services.map((service) => service.toMap()).toList(),
      'hora': hora,
      'data': data,
      'observacao': observacao
    };
  }
}
