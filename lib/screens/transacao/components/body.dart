import 'package:flutter/material.dart';
import 'package:flutter_gerenciador_gastos/models/transacao.dart';
import 'package:flutter_gerenciador_gastos/screens/components/card_transacao.dart';
import 'package:flutter_gerenciador_gastos/screens/constants/color_contant.dart';
import 'package:flutter_gerenciador_gastos/services/transacao_service.dart';
import 'package:google_fonts/google_fonts.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TransacaoService ts = TransacaoService();
  Future<List> _loadTransacoes;
  List<Transacao> _transacoes;

  @override
  void initState() {
    // TODO: implement initState
    _loadTransacoes = _getTransacoes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding:
            EdgeInsets.only(left: 60, top: 67, bottom: 16, right: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Todas as transações',
                  style: GoogleFonts.nunito(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: kBlackColor,
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

  Future<List> _getTransacoes() async {
    return await ts.getAllTransacoes();
  }
}
