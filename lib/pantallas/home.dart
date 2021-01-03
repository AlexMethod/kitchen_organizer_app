import 'package:flutter/material.dart';
import 'package:kitchen_organizer_app/widgets/main_drawer.dart';
import 'informacion_productos_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      /*appBar: AppBar(
        title: Text('Kitchen organizer'),
      )*/
      body : Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image : DecorationImage(
              image : AssetImage("assets/images/Screen1.png"),
            fit : BoxFit.cover
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(child: Container()),
            Expanded(
                child: Container(
                  width: 100,
                  height: 50,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => InformacionProductosPage()),
                      );
                    },
                    child: Text('Comenzar',style : TextStyle(fontSize: 20, color: Colors.white) ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: Color(0xff4A148C),
                  ),
              )
            )
          ],
        ),
      )

    );
  }
}
