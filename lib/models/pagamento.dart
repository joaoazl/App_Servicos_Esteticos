class Pagamento {
  late String? id,
  late TipoPagamento tipo_pagamento,
  late String vlr_pagamento,
  late String dt_pagamento;

  Pagamento({
    required this.tipo_pagamento,
    required this.vlr_pagamento,
    required this.dt_pagamento,
  });

  Pagamento.fromMap(Map<String, dynamic> map)
      :
        vlr_pagamento = map['vlr_pagamento'],
        dt_pagamento = map['dt_pagamento'];

  Map<String, dynamic> toMap() {
    return {
      'id_tipo_pagamento': tipo_pagamento.id,
      'vlr_pagamento': vlr_pagamento,
      'dt_pagamento': dt_pagamento;
    };
  }
}