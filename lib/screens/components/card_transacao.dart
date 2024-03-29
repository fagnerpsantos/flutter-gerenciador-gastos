import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gerenciador_gastos/models/transacao.dart';
import 'package:flutter_gerenciador_gastos/screens/constants/color_contant.dart';
import 'package:google_fonts/google_fonts.dart';

Widget cardTransacao(BuildContext context, int index, Transacao transacao) {
  return Container(
    margin: EdgeInsets.only(bottom: 8, left: 10, right: 10),
    height: 68,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
              color: Color(0x04000000),
              blurRadius: 10,
              spreadRadius: 10,
              offset: Offset(0.0, 8.0))
        ],
        color: kWhiteColor),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  transacao.titulo,
                  style: GoogleFonts.nunito(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: transacao.tipo == 1 ? Colors.green : Colors.redAccent),
                ),
                Text(
                  transacao.descricao,
                  style: GoogleFonts.nunito(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: kGreyColor),
                ),
              ],
            )
          ],
        ),

        Row(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "R\$ " + transacao.valor.toString(),
                  style: GoogleFonts.nunito(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: kGreyColor),
                ),
                Text(
                  formatDate(
                      DateTime.parse(transacao.data),
                      [dd, '/', mm, '/', yyyy]
                  ).toString(),
                  style: GoogleFonts.nunito(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: kGreyColor),
                )
              ],
            )
          ],
        )
      ],
    ),
  );
}

