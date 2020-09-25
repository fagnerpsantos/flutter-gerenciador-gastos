import 'package:flutter/material.dart';
import 'package:flutter_gerenciador_gastos/screens/cadastrar_transacao/cadastrar_transacao_screen.dart';
import 'package:flutter_gerenciador_gastos/screens/constants/color_contant.dart';
import 'package:flutter_gerenciador_gastos/screens/home/components/body.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import 'components/drawer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool dialVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).backgroundColor,
      body: Body(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: kBlackColor,
          ),
          onPressed: () {
            return _scaffoldKey.currentState.openDrawer();
          },
          padding: EdgeInsets.only(left: 8),
        ),
      ),
      drawer: drawer(context),
      floatingActionButton: buildSpeedDial(),
    );
  }

  SpeedDial buildSpeedDial() {
    return SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      animatedIconTheme: IconThemeData(size: 22.0),
      // child: Icon(Icons.add),
      visible: dialVisible,
      curve: Curves.bounceIn,
      children: [
        SpeedDialChild(
          child: Icon(Icons.add, color: Colors.white),
          backgroundColor: kGreenColor,
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => CadastrarTransacaoScreen(
                  tipoTransacao: 1,
                ),
              ),
            );
          },
          label: 'Entrada',
          labelStyle: TextStyle(fontWeight: FontWeight.w500),
          labelBackgroundColor: kGreenColor,
        ),
        SpeedDialChild(
          child: Icon(Icons.remove, color: Colors.white),
          backgroundColor: Colors.redAccent,
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => CadastrarTransacaoScreen(
                  tipoTransacao: 2,
                ),
              ),
            );
          },
          label: 'Saída',
          labelStyle: TextStyle(fontWeight: FontWeight.w500),
          labelBackgroundColor: Colors.redAccent,
        ),
      ],
    );
  }
}
