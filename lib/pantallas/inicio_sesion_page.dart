import 'package:flutter/material.dart';
import 'package:kitchen_organizer_app/widgets/main_drawer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MainDrawer(),
        appBar: AppBar(
          title: Text('Kitchen organizer'),
        ),
        body : Container(
          decoration: BoxDecoration(
              image : DecorationImage(
                  image : AssetImage("assets/images/Screen1.png"),
                  fit : BoxFit.cover
              )
          ),
          child: null,
        )

    );
  }
}