import 'package:flutter/material.dart';
import 'package:flutter_gerenciador_gastos/models/conta.dart';
import 'package:flutter_gerenciador_gastos/models/transacao.dart';
import 'package:flutter_gerenciador_gastos/screens/components/card_transacao.dart';
import 'package:flutter_gerenciador_gastos/screens/constants/color_contant.dart';
import 'package:flutter_gerenciador_gastos/screens/transacao/transacao_screen.dart';
import 'package:flutter_gerenciador_gastos/services/conta_service.dart';
import 'package:flutter_gerenciador_gastos/services/transacao_service.dart';
import 'package:google_fonts/google_fonts.dart';

import 'card_conta.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TransacaoService ts = TransacaoService();
  ContaService cs = ContaService();
  Future<List> _loadTransacoes;
  Future<List> _loadContas;
  List<Transacao> _transacoes;
  List<Conta> _contas;

  @override
  void initState() {
    // TODO: implement initState
    _loadTransacoes = _getTransacoes();
    _loadContas = _getContas();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      EdgeInsets.only(top: 70),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 175,
              child: FutureBuilder(
                  future: _loadContas,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      _contas = snapshot.data;
                      return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: _contas.length,
                          padding: EdgeInsets.only(left: 16, right: 8),
                          itemBuilder: (context, index) {
                            return cardConta(context, _contas[index]);
                          },
                        );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }
              ),
            ),
            Padding(
                padding:
                EdgeInsets.only(left: 24, top: 32, bottom: 16, right: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Últimas transações',
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
                      // physics: const AlwaysScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: _transacoes.length > 6 ? 6 : _transacoes.length,
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
        ),
    );

  }

  Future<List> _getTransacoes() async {
    return await ts.getAllTransacoes();
  }

  Future<List> _getContas() async {
    return await cs.getAllContas();
  }
}
