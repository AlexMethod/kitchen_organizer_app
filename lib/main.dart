import 'package:flutter/material.dart';
import 'package:kitchen_organizer_app/pantallas/inventario_page.dart';

import 'pantallas/home.dart';
import 'package:kitchen_organizer_app/pantallas/recetas_page.dart';
import 'package:kitchen_organizer_app/pantallas/lista_super_page.dart';
import 'package:kitchen_organizer_app/pantallas/informacion_productos_page.dart';
import 'package:kitchen_organizer_app/pantallas/configuracion_page.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
              bodyText2: TextStyle(fontSize: 16.0,)
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              foregroundColor:  MaterialStateProperty.all<Color>(Colors.purple[800]),
            ),
            /* colorScheme: ColorScheme(
            brightness: Brightness.light,
            primary: Colors.white,
            onPrimary: Colors.purple[800],
            secondary: Colors.lightGreen,
            onSecondary: Colors.black,

            secondaryVariant: Colors.lime,
            primaryVariant: Colors.black,
            surface: Colors.pinkAccent,
            onSurface: Colors.black,
            background: Colors.yellowAccent,
            onBackground: Colors.black,
            error: Colors.redAccent,
            onError: Colors.black,
          ) */
          )
      ),
      initialRoute: '/',
      routes: {
        '/'              : ( BuildContext context ) => HomePage(),
        '/inventario'    : ( BuildContext context ) => InventarioPage(),
        '/recetas'       : ( BuildContext context ) => RecetasPage(),
        '/listaSuper'    : ( BuildContext context ) => ListaSuperPage(),
        '/informacionProductos' : ( BuildContext context ) => InformacionProductosPage(),
        '/configuracion' : ( BuildContext context ) => ConfiguracionPage(),
      },
    );
  }
}
