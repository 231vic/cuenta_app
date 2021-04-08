import 'package:flutter/material.dart';

import 'package:cuenta_app/bloc/login_provider.dart';
import 'package:cuenta_app/provider/mes_provider.dart';

import 'package:cuenta_app/pages/login_page.dart';
import 'package:cuenta_app/pages/tabs_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => new MesService(),
        )
      ],
      child: LoginProvider(
        child: MaterialApp(
          title: 'Cuenta App',
          debugShowCheckedModeBanner: false,
          initialRoute: 'login',
          routes: {
            'login': (BuildContext context) => LoginPage(),
            'home': (BuildContext context) => TabsPage(),
          },
          theme: ThemeData(
            primaryColor: Color.fromRGBO(7, 17, 154, 1.0),
          ),
        ),
      ),
    );
  }
}
