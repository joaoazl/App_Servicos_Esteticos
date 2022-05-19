class Pagamento {
  late String id,
  late String id_tipo_pagamento,
  late String vlr_pagamento,
  late String dt_pagamento;

  Pagamento({
    required this.id,
    required this.id_tipo_pagamento,
    required this.vlr_pagamento,
    required this.dt_pagamento;
  });

  Pagamento.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        id_tipo_pagamento = map['id_tipo_pagamento'],
        vlr_pagamento = map['vlr_pagamento'],
        dt_pagamento = map['dt_pagamento'];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'id_tipo_pagamento': id_tipo_pagamento,
      'vlr_pagamento': vlr_pagamento,
      'dt_pagamento': dt_pagamento;
    };
  }
}