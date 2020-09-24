import 'package:flutter_gerenciador_gastos/models/transacao.dart';
import 'package:flutter_gerenciador_gastos/utils/db_util.dart';

class TransacaoService {
  List<Transacao> _transacaoList = [];

  Future<List> getAllTransacoes() async {
    final dataList = await DbUtil.getData('transacao');
    _transacaoList = dataList.map((transacoes) => Transacao(
      id: transacoes['id'],
      titulo: transacoes['titulo'],
      tipo: transacoes['tipo'],
      descricao: transacoes['descricao'],
      valor: transacoes['valor'],
      data: transacoes['data'],
    )).toList();
    return _transacaoList;
  }

  void addTransacao(Transacao transacao){
    final newTransacao = Transacao(
      id: transacao.id,
      titulo: transacao.titulo,
      tipo: transacao.tipo,
      descricao: transacao.descricao,
      valor: transacao.valor,
      data: transacao.data
    );
    DbUtil.insertData('transacao', newTransacao.toMap());

  }

  void editTransacao(int id, Transacao transacao) async {
    final newTransacao = Transacao(
      id: transacao.id,
      titulo: transacao.titulo,
      tipo: transacao.tipo,
      descricao: transacao.descricao,
      valor: transacao.valor,
      data: transacao.data,
    );
    String whereString = "id = ?";
    int rowId = id;
    List<dynamic> whereArguments = [rowId];
    DbUtil.editData("transacaos", newTransacao.toMap(), whereString, whereArguments);
    print("editou");
  }

  Future<Transacao> getTransacao(int id) async {
    List<String> columnsToSelect = [
      "id",
      "titulo",
      "tipo",
      "descricao",
      "valor",
      "data",
    ];
    String whereString = "id = ?";
    int rowId = id;
    List<dynamic> whereArguments = [rowId];
    final dataList = await DbUtil.getDataId("transacao", columnsToSelect, whereString, whereArguments);
    return Transacao.fromMap(dataList.first);
  }
}