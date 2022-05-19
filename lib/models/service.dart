class Service {
  late String? id;
  late String name;
  late String vlr;

  Service({
    required this.name,
    required this.vlr,
  });

  Service.fromMap(Map<String, dynamic> map)
      :
        name = map['name'],
        vlr = map['vlr'];

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'vlr': vlr,
    };
  }
}