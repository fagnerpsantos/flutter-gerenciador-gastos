import 'package:flutter/material.dart';
import 'package:flutter_gerenciador_gastos/screens/constants/color_contant.dart';

import 'screens/home/home_screen.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          accentColor: Colors.blue,
          backgroundColor: kBackgroundColor
      ),
      home: HomeScreen(),
    );
  }
}
