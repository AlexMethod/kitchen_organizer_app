import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:kitchen_organizer_app/widgets/main_drawer.dart';
import 'package:kitchen_organizer_app/widgets/textfield_edicion_producto.dart';

class EditarItemInventarioPage extends StatelessWidget {
  String nombreProducto;
  int cantidadProducto;
  String adquisicionProducto;
  int caducidadProducto;

  final nombreProductoController = TextEditingController();
  final cantidadProductoController = TextEditingController();
  final caducidadProductoController = TextEditingController();

  EditarItemInventarioPage(String n,String ad,int can, int cad){
    nombreProducto = n;
    adquisicionProducto = ad;
    cantidadProducto = can;
    caducidadProducto = cad;
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Item Inventario'),
      ),
      drawer: MainDrawer(),
      body : Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              image : DecorationImage(
                  image : AssetImage("assets/images/Screen3.png"),
                  fit : BoxFit.cover
              )
          ),
        child : ListView(
          children: [
            Container(
                margin: EdgeInsets.only(left : 10,right: 10, top: 10),
                child : Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: Container(
                        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 8.0,),
                        margin: EdgeInsets.only(left : 10, right: 10),
                        child : Column(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Nombre: ', style : TextStyle(color : Colors.black, fontSize: 20)),
                                Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(100.0)
                                  ),
                                  clipBehavior: Clip.hardEdge,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(width: 10.0,),
                                      Expanded(
                                        child: TextFieldEdicionProducto(
                                          nombreProducto,
                                          textEdittingController: nombreProductoController,
                                          textInputType: TextInputType.text,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Divider(
                                thickness: 2,
                                color : Color(0xff5D34AF)
                            ),
                            Container(
                                margin : EdgeInsets.only(top: 10),
                                alignment: Alignment.centerLeft,
                                child : Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Cantidad: ',
                                      style: TextStyle(color : Colors.black, fontSize: 20),
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
                                          Expanded(
                                            child: TextFieldEdicionProducto(
                                              cantidadProducto.toString(),
                                              textEdittingController: cantidadProductoController,
                                              textInputType: TextInputType.text,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 20,),
                                    RichText(
                                        text: TextSpan(
                                            text : 'Adquisición: ',
                                            style: TextStyle(fontSize: 20, color : Colors.black),
                                            children : [
                                              TextSpan(
                                                  text : adquisicionProducto,
                                                  style: TextStyle(color : Color(0xff5D34AF), fontSize: 20)
                                              )
                                            ]
                                        )
                                    ),
                                    SizedBox(height: 20,),
                                    Text('Caducidad: ',
                                      style: TextStyle(color : Colors.black, fontSize: 20),
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
                                          Expanded(
                                            child: TextFieldEdicionProducto(
                                              caducidadProducto.toString(),
                                              textEdittingController: caducidadProductoController,
                                              textInputType: TextInputType.text,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                        margin : EdgeInsets.only(right: 15),
                                        child : Align(
                                          alignment: Alignment.centerRight,
                                          child: IconButton(
                                            icon : Icon(Icons.check_box, color : Color(0xff5D34AF), size: 50,),
                                            onPressed: () {

                                            },
                                          ),
                                        )
                                    )
                                  ],
                                )
                            )

                          ],
                        )
                    )
                )
            ),
          ],
        )
      )
    );
  }

}