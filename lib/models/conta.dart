class Conta {
  int id;
  String titulo;
  double saldo;

  Conta({this.id, this.titulo, this.saldo});

}

var conta = Conta(
    id: 1, titulo: "Minha carteira", saldo: 250.0
);
