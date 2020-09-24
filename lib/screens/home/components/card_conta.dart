import 'package:flutter/material.dart';
import 'package:flutter_gerenciador_gastos/models/conta.dart';
import 'package:flutter_gerenciador_gastos/screens/constants/color_contant.dart';
import 'package:google_fonts/google_fonts.dart';

class CardConta extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10, left: 10),
      height: 175,
      width: 220,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: kBlueColor,
        boxShadow: [
          BoxShadow(
              color: Color(0x10000000),
              blurRadius: 10,
              spreadRadius: 4,
              offset: Offset(0.0, 8.0))
        ],
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 14,
            right: 12,
            child: Text(
              conta.titulo,
              style: GoogleFonts.nunito(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
          ),
          Positioned(
            top: 63,
            left: 16,
            child: Text(
              'Saldo em conta',
              style: GoogleFonts.nunito(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
          ),
          Positioned(
            left: 16,
            top: 81,
            child: Text(
              'R\$ ' + conta.saldo.toString(),
              style: GoogleFonts.nunito(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
