import 'package:flutter/material.dart';
import 'package:flutter_gerenciador_gastos/models/transacao.dart';
import 'package:flutter_gerenciador_gastos/screens/constants/color_contant.dart';
import 'package:google_fonts/google_fonts.dart';

class CardTransacao extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: ListView.builder(
        padding: EdgeInsets.only(left: 10, right: 10),
        itemCount: transacoes.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(bottom: 8),
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
                      width: 12,
                    ),
                    // Container(
                    //   width: 44,
                    //   height: 44,
                    //   decoration: BoxDecoration(
                    //     shape: BoxShape.circle,
                    //     color: kWhiteGreyColor,
                    //   ),
                    //   child: Icon(
                    //     transacoes[index].tipo == 1 ? Icons.add : Icons.remove
                    //   ),
                    // ),
                    SizedBox(
                      width: 12,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          transacoes[index].titulo,
                          style: GoogleFonts.nunito(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: transacoes[index].tipo == 1 ? Colors.green : Colors.redAccent),
                        ),
                        Text(
                          transacoes[index].descricao,
                          style: GoogleFonts.nunito(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: kGreyColor),
                        )
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
                          transacoes[index].valor.toString(),
                          style: GoogleFonts.nunito(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: kGreyColor),
                        ),
                        Text(
                          transacoes[index].data.day.toString() + "/" +
                              transacoes[index].data.month.toString() + "/" +
                              transacoes[index].data.year.toString(),
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
        },
      ),
    );
  }
}
