class Client {
  late String? id;
  late String name;
  late String dt_nasc;
  late String email;
  late String telefone;

  Client({
    this.id,
    required this.name,
    required this.dt_nasc,
    required this.email,
    required this.telefone,
  });

  Client.fromMap(Map<String, dynamic> map)
      :
        name = map['name'],
        dt_nasc = map['dt_nasc'],
        email = map['email'],
        telefone = map['telefone'];

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'dt_nasc': dt_nasc,
      'email': email,
      'telefone': telefone,
    };
  }
}