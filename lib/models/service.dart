import 'dart:developer';

class Service {
  late String id;
  late String name;
  late String vlr;

  Service({
    required this.id,
    required this.name,
    required this.vlr,
  });

  Service.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        name = map['name'],
        vlr = map['vlr'];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'vlr': vlr,
    };
  }
}