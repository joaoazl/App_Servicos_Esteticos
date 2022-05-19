import 'package:app/models/agendamento.dart';
import 'package:app/models/pagamento.dart';

class Venda {
  late String? id;
  late Agendamento agenda;
  late List<Pagamento> pagamentos = [];
  late String dt_venda;
  late String desconto;

  Venda({
    required this.agenda,
    required this.dt_venda,
    required this.desconto,
  });

  Venda.fromMap(Map<String, dynamic> map)
      :
        dt_venda = map['dt_venda'],
        desconto = map['desconto'];

  Map<String, dynamic> toMap() {
    return {
      'agenda': agenda.id,
      'dt_venda': dt_venda,
      'desconto': desconto,
    };
  }
}