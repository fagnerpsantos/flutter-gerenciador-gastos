class Transacao {
  int id, tipo;
  String titulo, descricao;
  double valor;
  DateTime data;

  Transacao({this.id, this.tipo, this.titulo, this.descricao,
    this.valor, this.data});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'tipo': tipo,
      'titulo': titulo,
      'descricao': descricao,
      'valor': valor,
      'data': data,
    };
  }

  Transacao.fromMap(Map map){
    id = map["id"];
    titulo = map["titulo"];
    tipo = map["tipo"];
    descricao = map["descricao"];
    valor = map["valor"];
    data = map["data"];
  }


}
List<Transacao> transacoes = [
  Transacao(
      id: 1,
      tipo: 1,
      titulo: "Supermercado",
      descricao: "Supermercado do mês",
      valor: 700.00,
      data: DateTime.now(),
  ),
  Transacao(
      id: 2,
      tipo: 1,
      titulo: "Padaria",
      descricao: "Padaria do mês",
      valor: 100.00,
      data: DateTime.now(),

  ),
  Transacao(
      id: 3,
      tipo: 1,
      titulo: "Padaria",
      descricao: "Padaria do mês",
      valor: 100.00,
    data: DateTime.now(),

  ),
  Transacao(
      id: 4,
      tipo: 2,
      titulo: "Padaria",
      descricao: "Padaria do mês",
      valor: 100.00,
    data: DateTime.now(),

  ),
  Transacao(
      id: 5,
      tipo: 1,
      titulo: "Padaria",
      descricao: "Padaria do mês",
      valor: 100.00,
    data: DateTime.now(),

  ),
  Transacao(
      id: 6,
      tipo: 1,
      titulo: "Padaria",
      descricao: "Padaria do mês",
      valor: 100.00,
    data: DateTime.now(),

  ),
  Transacao(
      id: 7,
      tipo: 1,
      titulo: "Padaria",
      descricao: "Padaria do mês",
      valor: 100.00,
    data: DateTime.now(),

  ),
  Transacao(
      id: 8,
      tipo: 2,
      titulo: "Padaria",
      descricao: "Padaria do mês",
      valor: 100.00,
    data: DateTime.now(),

  ),
  Transacao(
      id: 9,
      tipo: 1,
      titulo: "Padaria",
      descricao: "Padaria do mês",
      valor: 100.00,
    data: DateTime.now(),

  ),
];