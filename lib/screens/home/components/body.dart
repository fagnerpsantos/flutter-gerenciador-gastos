import 'package:flutter/material.dart';
import 'package:flutter_gerenciador_gastos/models/conta.dart';
import 'package:flutter_gerenciador_gastos/models/transacao.dart';
import 'package:flutter_gerenciador_gastos/screens/constants/color_contant.dart';
import 'package:flutter_gerenciador_gastos/screens/home/components/card_transacao.dart';
import 'package:flutter_gerenciador_gastos/services/transacao_service.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gerenciador_gastos/models/conta.dart';

import 'card_conta.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TransacaoService ts = TransacaoService();
  Future<List> _loadTransacoes;

  @override
  void initState() {
    // TODO: implement initState
    _loadTransacoes = _getTransacoes();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          // Card Account Section
          CardConta(),
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
                  Text(
                    'ver mais',
                    style: GoogleFonts.nunito(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: kBlueColor,
                    ),
                  ),
                ],
              )
          ),
          FutureBuilder(
            future: _loadTransacoes,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                transacoes = snapshot.data;
                // transacoes.forEach((element) {print(element.data);});
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: transacoes.length,
                  itemBuilder: (context, index) {
                    return cardTransacao(context, index, transacoes[index]);
                  },
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
}
