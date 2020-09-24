import 'package:flutter_gerenciador_gastos/models/conta.dart';
import 'package:flutter_gerenciador_gastos/utils/db_util.dart';

class ContaService {
  List<Conta> _contaList = [];

  Future<List> getAllContas() async {
    final dataList = await DbUtil.getData('conta');
    _contaList = dataList.map((contas) => Conta(
        id: contas['id'],
        titulo: contas['titulo'],
        saldo: contas['saldo'],
    )).toList();
    return _contaList;
  }

  void addConta(Conta conta){
    final newConta = Conta(
      titulo: conta.titulo,
      saldo: conta.saldo,
    );
    DbUtil.insertData('contas', newConta.toMap());
  }

  void editConta(int id, Conta conta) async {
    final newConta = Conta(
      id: id,
      titulo: conta.titulo,
      saldo: conta.saldo,
    );
    String whereString = "id = ?";
    int rowId = id;
    List<dynamic> whereArguments = [rowId];
    DbUtil.editData("contas", newConta.toMap(), whereString, whereArguments);
    print("editou");
  }

  Future<Conta> getConta(int id) async {
    List<String> columnsToSelect = [
      "id",
      "titulo",
      "saldo"
    ];
    String whereString = "id = ?";
    int rowId = id;
    List<dynamic> whereArguments = [rowId];
    final dataList = await DbUtil.getDataId("conta", columnsToSelect, whereString, whereArguments);
    return Conta.fromMap(dataList.first);
  }
}