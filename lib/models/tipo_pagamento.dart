class TipoPagamento {
  late String id;
  late String tipo_pagamento;

  TipoPagamento({
    required this.id,
    required this.tipo_pagamento,
  });

  TipoPagamento.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        tipo_pagamento = map['tipo_pagamento'];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'tipo_pagamento': tipo_pagamento,
    };
  }
}