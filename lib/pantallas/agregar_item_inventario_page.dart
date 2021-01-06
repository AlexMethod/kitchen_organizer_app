import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kitchen_organizer_app/widgets/main_drawer.dart';
import 'package:kitchen_organizer_app/widgets/textfield_personalizado.dart';
import 'package:flutter/cupertino.dart';
import 'inventario_page.dart';
import 'dart:math';

class AgregarItemInventarioPage extends StatelessWidget{
  final nombreProductoController = TextEditingController();
  final cantidadProductoController = TextEditingController();
  final caducidadProductoController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          title: Text('Agregar Inventario')
      ),
      drawer: MainDrawer(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image : DecorationImage(
                image : AssetImage("assets/images/Screen3.png"),
                fit : BoxFit.cover
            )
        ),
        child: Container(
            margin : EdgeInsets.all(10),
            child : Column(
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100.0)
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(width: 10.0,),
                        Icon(
                            Icons.inbox_rounded,
                            color : Color(0xff5D34AF)
                        ),
                        SizedBox(width: 10.0,),
                        Expanded(
                          child: TextFieldPersonalizado(
                            'Nombre producto',
                            textEdittingController: nombreProductoController,
                            textInputType: TextInputType.text,
                          ),
                        )
                      ],
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100.0)
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(width: 10.0,),
                        Icon(
                            Icons.arrow_circle_up_rounded,
                            color : Color(0xff5D34AF)
                        ),
                        SizedBox(width: 10.0,),
                        Expanded(
                          child: TextFieldPersonalizado(
                            'Cantidad',
                            textEdittingController: cantidadProductoController,
                            textInputType: TextInputType.number,
                          ),
                        )
                      ],
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100.0)
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(width: 10.0,),
                        Icon(
                            Icons.arrow_circle_down_rounded,
                            color : Color(0xff5D34AF)
                        ),
                        SizedBox(width: 10.0,),
                        Expanded(
                          child: TextFieldPersonalizado(
                            'Caducidad en días',
                            textEdittingController: caducidadProductoController,
                            textInputType: TextInputType.number,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                      margin : EdgeInsets.only(right: 15),
                      child : Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          icon : Icon(Icons.add_box, color : Color(0xff5D34AF), size: 50,),
                          onPressed: () {
                            addItemIventario(nombreProductoController.text,int.parse(cantidadProductoController.text),int.parse(caducidadProductoController.text));
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) => InventarioPage()),
                              ModalRoute.withName('/inventario'),
                            );
                          },
                        ),
                      )
                  )
                ]
            )
        ),
      ),
    );
  }

  final _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  addItemIventario(String nombre, int cantidad, int caducidad){
    CollectionReference Productos = FirebaseFirestore.instance.collection('productos');
    Map<String,dynamic> producto = {
      "id" : getRandomString(15),
      "nombre" : nombre,
      "adquisicion" : DateTime.now(),
      "cantidad" : cantidad,
      "caducidad" : caducidad
    };
    Productos.add(producto);
  }

}