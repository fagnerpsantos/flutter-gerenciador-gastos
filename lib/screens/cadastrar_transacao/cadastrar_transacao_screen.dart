import 'package:flutter/material.dart';
import 'package:flutter_gerenciador_gastos/models/transacao.dart';
import 'package:flutter_gerenciador_gastos/screens/home/home_screen.dart';
import 'package:flutter_gerenciador_gastos/services/transacao_service.dart';
import 'package:date_format/date_format.dart';



class CadastrarTransacaoScreen extends StatefulWidget {

  @override
  _CadastrarTransacaoScreenState createState() => _CadastrarTransacaoScreenState();
}

class _CadastrarTransacaoScreenState extends State<CadastrarTransacaoScreen> {
  final TransacaoService ts = TransacaoService();
  Transacao transacao;
  final _tituloController = TextEditingController();
  final _descricaoController = TextEditingController();
  final _tipoController = TextEditingController();
  final _valorController = TextEditingController();
  final _dataController = TextEditingController();
  DateTime selectedDate = DateTime.now();


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro de transação"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  controller: _tituloController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(labelText: "Título"),
                ),
                TextFormField(
                  controller: _descricaoController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(labelText: "Descrição"),
                ),
                TextFormField(
                  controller: _tipoController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: "Tipo"),
                ),
                TextFormField(
                  controller: _valorController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(labelText: "Valor"),
                ),
                GestureDetector(
                  onTap: () => _selectDate(context),
                  child: AbsorbPointer(
                    child: TextFormField(
                      controller: _dataController,
                      keyboardType: TextInputType.datetime,
                      decoration:
                      InputDecoration(
                          labelText: formatDate(selectedDate, [dd, '/', mm, '/', yyyy])),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  child: Container(
                    height: 40,
                    width: double.infinity,
                    child: RaisedButton(
                      onPressed: () {
                        Transacao newTransacao = Transacao(
                            titulo: _tituloController.text,
                            descricao: _descricaoController.text,
                            tipo: int.parse(_tipoController.text),
                            valor: double.parse(_valorController.text),
                            data: selectedDate.toString());
                        ts.addTransacao(newTransacao);
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => HomeScreen(),
                          ),
                        );
                      },
                      color: Colors.blue,
                      child: Text(
                        "Cadastrar",
                        style: TextStyle(
                            color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

}

