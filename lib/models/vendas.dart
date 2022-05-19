class Venda {
  late String id;
  late Agendamento agenda;
  late List<Pagamento> pagamentos;
  late String email;
  late String telefone;

  Client({
    required this.id,
    required this.name,
    required this.dt_nasc,
    required this.email,
    required this.telefone,
  });

  Client.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        name = map['name'],
        dt_nasc = map['dt_nasc'],
        email = map['email'],
        telefone = map['telefone'];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'dt_nasc': dt_nasc,
      'email': email,
      'telefone': telefone,
    };
  }
}