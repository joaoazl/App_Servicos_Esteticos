class Agendamento {
  late String id;
  late String id_service;
  late String hora;
  late String data;
  late String? observacao;

  Agendamento({
    required this.id,
    required this.id_service,
    required this.hora,
    required this.data,
    this.observacao,
  });

  Agendamento.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        id_service = map['id_service'],
        hora = map['hora'],
        data = map['data'],
        observacao = map['observacao'];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'id_service': id_service,
      'hora': hora,
      'data': data,
      'observacao':observacao;
    };
  }
}