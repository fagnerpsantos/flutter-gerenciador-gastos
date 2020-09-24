import 'package:flutter/material.dart';
import 'package:flutter_gerenciador_gastos/models/conta.dart';
import 'package:flutter_gerenciador_gastos/models/transacao.dart';
import 'package:flutter_gerenciador_gastos/screens/constants/color_contant.dart';
import 'package:flutter_gerenciador_gastos/screens/home/components/card_transacao.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gerenciador_gastos/models/conta.dart';

import 'card_conta.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
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
          CardTransacao(),
        ],
      ),
    );
  }
}
