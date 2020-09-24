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
          leading: Icon(Icons.person),
          title: Text("Minha conta"),
          onTap: () {
            Navigator.pop(context);
            //Navegar para outra página
          },
        ),
        ListTile(
          leading: Icon(Icons.shopping_basket),
          title: Text("Meus pedidos"),
          onTap: () {
            Navigator.pop(context);
            //Navegar para outra página

          },
        ),
        ListTile(
          leading: Icon(Icons.favorite),
          title: Text("Favoritos"),
          onTap: () {
            Navigator.pop(context);
            //Navegar para outra página
          },
        ),
      ],
    ),
  );
}