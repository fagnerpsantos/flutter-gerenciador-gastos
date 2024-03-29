import 'package:flutter/material.dart';
import 'package:flutter_gerenciador_gastos/models/conta.dart';
import 'package:flutter_gerenciador_gastos/models/transacao.dart';
import 'package:flutter_gerenciador_gastos/screens/components/card_transacao.dart';
import 'package:flutter_gerenciador_gastos/screens/constants/color_contant.dart';
import 'package:flutter_gerenciador_gastos/screens/home/components/card_conta.dart';
import 'package:flutter_gerenciador_gastos/screens/transacao/transacao_screen.dart';
import 'package:flutter_gerenciador_gastos/services/conta_service.dart';
import 'package:flutter_gerenciador_gastos/services/transacao_service.dart';
import 'package:google_fonts/google_fonts.dart';

class Body extends StatefulWidget {
  final int idConta;
  Body({this.idConta});

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TransacaoService ts = TransacaoService();
  ContaService cs = ContaService();
  Future<List> _loadTransacoes;
  Future<Conta> _loadConta;
  List<Transacao> _transacoes;
  Conta _conta;

  @override
  void initState() {
    // TODO: implement initState
    _loadTransacoes = _getTransacoes(widget.idConta);
    _loadConta = _getConta(widget.idConta);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding:
          EdgeInsets.only(top: 67, bottom: 16),

          child: Container(
            height: 175,
            width: double.infinity,
            child: FutureBuilder(
                future: _loadConta,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    _conta = snapshot.data;
                    return cardConta(context, _conta);
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }
            ),
          ),
        ),
        Padding(
            padding:
            EdgeInsets.only(left: 24, top: 32, bottom: 16, right: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Transações',
                  style: GoogleFonts.nunito(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: kBlackColor,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => TransacaoScreen(),
                      ),
                    );
                  },
                  child: Text(
                    'ver todas',
                    style: GoogleFonts.nunito(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: kBlueColor,
                    ),
                  ),
                ),
              ],
            )
        ),
        FutureBuilder(
            future: _loadTransacoes,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                _transacoes = snapshot.data;
                return Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: _transacoes.length,
                    padding: EdgeInsets.all(10),
                    itemBuilder: (context, index) {
                      return cardTransacao(context, index, _transacoes[index]);
                    },
                  ),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }
        ),
      ],
    );

  }

  Future<List> _getTransacoes(int id) async {
    return await ts.getTransacoesConta(id);
  }

  Future<Conta> _getConta(int id) async {
    return await cs.getConta(id);
  }
}
