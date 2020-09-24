import 'package:flutter/material.dart';

Drawer drawer(BuildContext context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        UserAccountsDrawerHeader(
          accountEmail: Text("user@mail.com"),
          accountName: Text("Seu zé"),
          currentAccountPicture: CircleAvatar(
            child: Text("SZ"),
          ),
        ),
        ListTile(
          leading: Icon(Icons.home),
          title: Text("Home"),
          onTap: () {
            Navigator.pop(context);
            //Navegar para outra página
          },
        ),
        ListTile(
          leading: Icon(Icons.history),
          title: Text("Histórico"),
          onTap: () {
            Navigator.pop(context);
            //Navegar para outra página

          },
        ),
        ListTile(
          leading: Icon(Icons.account_balance),
          title: Text("Contas"),
          onTap: () {
            Navigator.pop(context);
            //Navegar para outra página
          },
        ),
      ],
    ),
  );
}