import 'package:flutter/material.dart';

import 'pantallas/home.dart';
import 'package:kitchen_organizer_app/pantallas/lista_super_page.dart';
import 'package:kitchen_organizer_app/pantallas/configuracion_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primaryColor: Colors.blue,
        accentColor: Colors.purple[800],
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,

        textTheme: TextTheme(
          headline6: TextStyle(color: Colors.purple[800]),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/'              : ( BuildContext context ) => HomePage(),
        '/recetas'       : ( BuildContext context ) => HomePage(),
        '/listaSuper'    : ( BuildContext context ) => ListaSuperPage(),
        '/infoProductos' : ( BuildContext context ) => HomePage(),
        '/configuracion' : ( BuildContext context ) => ConfiguracionPage(),
      },
    );
  }
}
