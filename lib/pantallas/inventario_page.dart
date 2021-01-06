import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kitchen_organizer_app/widgets/main_drawer.dart';
import 'package:kitchen_organizer_app/modelos/producto_inventario.dart';
import 'package:intl/intl.dart';

class InventarioPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _InventarioPageState();

}

class _InventarioPageState extends State<InventarioPage> {
  final nuevoProductoController = TextEditingController();
  List<ProductoInventario> productos = new List();

  @override
  Widget build(BuildContext context){
      return Scaffold(
        appBar: AppBar(
          title: Text('Inventario'),
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
          child : Builder( builder: (context) =>
              GestureDetector(
                onTap: () {
                  _unfocus(context);
                },
                child: ListView(
                  children: _itemsInventarioList(context),
                ),
              ),
          )
        )
      );

  }

  _itemsInventarioList(context){
    var items = <Widget>[];

    items.addAll(_getItemsInventario(context));
    items.add(_addButton(context));

    return items;
  }

  List<Widget> _getItemsInventario(context){
    var cardsProductos = <Widget>[];
    productos.add(new ProductoInventario("Cebolla",2,new DateTime(2020,12,17),20));
    productos.add(new ProductoInventario("Lechuga",6,new DateTime(2020,12,18),1));
    productos.add(new ProductoInventario("Jitomate",10,new DateTime(2020,12,19),10));
    productos.add(new ProductoInventario("Arroz",12,new DateTime(2020,12,20),4));
    productos.forEach((element) {
      cardsProductos.add(_cardItemInventario(context, element.nombre, element.cantidad,element.adquisicion, element.caducidad));
    });
    return cardsProductos;
  }

  Widget _addButton(context){
    return Container(
      margin : EdgeInsets.only(right: 15),
      child : Align(
        alignment: Alignment.centerRight,
        child: IconButton(
          icon : Icon(Icons.add_box, color : Color(0xff5D34AF), size: 50,),
          onPressed: () {
              addItemIventario();
          },
        ),
      )
    );
  }

  Widget _cardItemInventario(context, String producto, int cantidad, DateTime fecha, int caducidad) {
    final DateFormat formatter = DateFormat("dd-MM-yyyy");
    String _fecha = formatter.format(fecha);
    return Container(
        height: 100,
        margin: EdgeInsets.only(left : 10,right: 10, top: 10),
        child : Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)
            ),
            clipBehavior: Clip.hardEdge,
            child: Container(
                margin: EdgeInsets.only(left : 10, right: 10),
                child : Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(producto,style : TextStyle(fontSize: 20, color: Color(0xff5D34AF))),
                        Icon(
                            Icons.border_color,
                            color : Color(0xff5D34AF)
                        )
                      ],
                    ),
                    Divider(
                        thickness: 2,
                        color : Color(0xff5D34AF)
                    ),
                    Container(
                      margin : EdgeInsets.only(top: 10),
                      child : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                              text : TextSpan(
                                  text : 'Cantidad: ',
                                  style: TextStyle(color : Colors.black, fontSize: 15),
                                  children: [
                                    TextSpan(
                                        text : cantidad.toString(),
                                        style : TextStyle(color : Color(0xff5D34AF), fontSize: 15)
                                    )
                                  ]
                              )
                          ),
                          RichText(
                              text: TextSpan(
                                text : 'Adquisición: ',
                                style: TextStyle(fontSize: 15, color : Colors.black),
                                children : [
                                  TextSpan(
                                    text : _fecha,
                                    style: TextStyle(color : Color(0xff5D34AF), fontSize: 15)
                                  )
                                ]
                              )
                          ),
                          RichText(
                              text: TextSpan(
                                  text : 'Caducidad: ',
                                  style: TextStyle(fontSize: 15, color : Colors.black),
                                  children : [
                                    TextSpan(
                                        text : caducidad.toString(),
                                        style: TextStyle(color : Color(0xff5D34AF), fontSize: 15)
                                    )
                                  ]
                              )
                          )
                        ],
                      )
                    )

                  ],
                )
            )
        )
    );
  }

  _unfocus(context){
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  addItemIventario(){
    CollectionReference Productos = FirebaseFirestore.instance.collection('productos');
    Map<String,dynamic> producto = {
      "nombre" : "Chuleta",
      "adquisicion" : DateTime.now(),
      "cantidad" : 15,
      "caducidad" : 10
    };
    Productos.add(producto);
  }

  fetchItemsInventario(){
    CollectionReference Productos = FirebaseFirestore.instance.collection('productos');
    Productos.snapshots().listen((snapshot) {
      List documents;
      setState(() {
          documents = snapshot.docs;
      });
    });
  }

}
