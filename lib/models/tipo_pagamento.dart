class TipoPagamento {
  late String? id;
  late String tipo_pagamento;

  TipoPagamento({
    this.id,
    required this.tipo_pagamento,
  });

  TipoPagamento.fromMap(Map<String, dynamic> map)
      :
        tipo_pagamento = map['tipo_pagamento'];

  Map<String, dynamic> toMap() {
    return {
      'tipo_pagamento': tipo_pagamento,
    };
  }
}