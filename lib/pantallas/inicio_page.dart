import 'package:flutter/material.dart';
import 'package:kitchen_organizer_app/widgets/main_drawer.dart';

class InicioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MainDrawer(),
        appBar: AppBar(
        title: Text('Inicio'),
      ),
        body : Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              image : DecorationImage(
                  image : AssetImage("assets/images/Screen3.png"),
                  fit : BoxFit.cover
              )
          ),
        )

    );
  }
}