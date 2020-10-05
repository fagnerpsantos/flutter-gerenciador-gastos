import 'package:flutter/material.dart';
import 'package:flutter_gerenciador_gastos/screens/home/components/body.dart';
import 'package:flutter_gerenciador_gastos/screens/home/components/float_action_button.dart';

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
      floatingActionButton: buildSpeedDial(context),
    );
  }

}
