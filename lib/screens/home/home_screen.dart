import 'package:flutter/material.dart';
import 'package:flutter_gerenciador_gastos/screens/cadastrar_transacao/cadastrar_transacao_screen.dart';
import 'package:flutter_gerenciador_gastos/screens/constants/color_contant.dart';
import 'package:flutter_gerenciador_gastos/screens/home/components/body.dart';

import 'components/drawer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

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
      floatingActionButton: FloatingActionButton(
        mini: true,
        onPressed: (){
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => CadastrarTransacaoScreen(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
