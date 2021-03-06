import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:kitchen_organizer_app/widgets/main_drawer.dart';
import 'inicio_sesion_page.dart';

class RegistrarsePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MainDrawer(),
        body : Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              image : DecorationImage(
                  image : AssetImage("assets/images/Screen2.png"),
                  fit : BoxFit.cover
              )
          ),
          child: Container(
            //margin: EdgeInsets.only(top: 270),
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                SizedBox(height: 230,),
                Center(
                  child: Text('Registrarse', style : TextStyle(fontSize: 45, color: Color(0xff38006B)) ),
                ),
                SizedBox(height: 20,),
                Container(
                  margin: EdgeInsets.only(left: 25.0, right: 25.0),
                  width: double.infinity,
                  height: 55,
                  alignment: Alignment.center,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))
                      ),
                      filled: true,
                      hintText: 'Nombre completo',
                      hintStyle: new TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  margin: EdgeInsets.only(left: 25.0, right: 25.0),
                  width: double.infinity,
                  height: 55,
                  alignment: Alignment.center,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))
                      ),
                      filled: true,
                      hintText: 'Correo electrónico',
                      hintStyle: new TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  margin : EdgeInsets.only(left : 25,right: 25),
                  width: double.infinity,
                  height: 55,
                  alignment: Alignment.center,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))
                      ),
                      filled: true,
                      hintText: 'Contraseña',
                      hintStyle: new TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  margin : EdgeInsets.only(left : 25,right: 25),
                  width: double.infinity,
                  height: 55,
                  child: RaisedButton(
                    onPressed: () {
                      /*Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => InicioSesionPage()),
                    );*/
                    },
                    child: Text('Registrarse',style : TextStyle(fontSize: 20, color: Colors.white) ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: Color(0xff4A148C),
                  ),
                ),
                SizedBox(height: 20,),
                Center(
                  child: RichText(
                      text : TextSpan(
                          text: '¿Ya tienes cuenta? Inicia sesión',
                          style: TextStyle(fontSize: 25, color: Color(0xff38006B)),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => InicioSesionPage()),
                              );
                            }
                      )
                  ),
                ),
              ],
            ),
          ),
        )

    );
  }
}