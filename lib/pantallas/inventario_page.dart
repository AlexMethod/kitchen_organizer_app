import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kitchen_organizer_app/widgets/main_drawer.dart';
import 'package:intl/intl.dart';
import 'agregar_item_inventario_page.dart';
import 'editar_item_inventario_page.dart';

class InventarioPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _InventarioPageState();

}

class _InventarioPageState extends State<InventarioPage> {
  final nombreProductoController = TextEditingController();
  final cantidadProductoController = TextEditingController();
  final caducidadProductoController = TextEditingController();
  var _productos;

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

  List<Widget> _getItemsInventario(context) {
    var cardsProductos = <Widget>[];

    fetchItemsInventario();

    if(_productos != null)
      _productos.forEach((element) {
        var _id = element.get("id");
        var _nombre = element.get("nombre");
        var _cantidad = element.get("cantidad");
        var _adquisicionRaw = element.get("adquisicion");
        var _adquisicion = new DateTime.fromMicrosecondsSinceEpoch(_adquisicionRaw.microsecondsSinceEpoch);
        var _caducidad = element.get("caducidad");

        cardsProductos.add(_cardItemInventario(context,_id, _nombre, _cantidad,_adquisicion,_caducidad));
      });
    return cardsProductos;
  }

  Widget _addButton(context){

    return Container(
        margin : EdgeInsets.only(right : 15,bottom: 20),
        child : Align(
          alignment: Alignment.centerRight,
          child: IconButton(
            icon : Icon(Icons.add_box, color : Color(0xff5D34AF), size: 50,),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AgregarItemInventarioPage()),
              );
            },
          ),
        )
    );

  }

  Widget _cardItemInventario(context,String id, String producto, int cantidad, DateTime fecha, int caducidad) {
    final DateFormat formatter = DateFormat("dd-MM-yyyy");
    String _fecha = formatter.format(fecha);
    return Container(
        margin: EdgeInsets.only(left : 10,right: 10, top: 10),
        child : Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)
          ),
          clipBehavior: Clip.hardEdge,
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 13.0, vertical: 8.0),
              child : Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin : EdgeInsets.only(top : 5),
                        child : Text(producto,style : TextStyle(fontSize: 20, color: Color(0xff5D34AF))),
                      ),
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
                      Row(
                        children : [
                          GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => EditarItemInventarioPage(producto,_fecha, cantidad, caducidad)),
                                );
                              },
                              child : Icon(
                                  Icons.border_color,
                                  color : Color(0xff5D34AF)
                              )
                          ),
                          GestureDetector(
                              onTap: () {
                                deleteItemInventario(id);
                              },
                              child : Icon(
                                  Icons.restore_from_trash,
                                  color : Color(0xff5D34AF)
                              )
                          )
                        ]
                      )
                    ],
                  ),
                  Divider(
                      thickness: 2,
                      color : Color(0xff5D34AF)
                  ),
                  Container(
                    margin : EdgeInsets.only(top: 10),
                    child : Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
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
                                        text : caducidad.toString() + ' días',
                                        style: TextStyle(color : Color(0xff5D34AF), fontSize: 15)
                                    )
                                  ]
                              )
                          )
                        ],
                      ),
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

  addItemIventario(String nombre, int cantidad, int caducidad){
    CollectionReference Productos = FirebaseFirestore.instance.collection('productos');
    Map<String,dynamic> producto = {
      "nombre" : nombre,
      "adquisicion" : DateTime.now(),
      "cantidad" : cantidad,
      "caducidad" : caducidad
    };
    Productos.add(producto);
  }

  deleteItemInventario(String _id) async{
    CollectionReference Productos = FirebaseFirestore.instance.collection('productos');
    QuerySnapshot query = await Productos.get();
    query.docs.forEach((element) {
      var id = element.get("id");
      if(id == _id){
        element.reference.delete();
      }
    });
  }

  fetchItemsInventario() async {
    CollectionReference Productos = FirebaseFirestore.instance.collection('productos');
    var prod = (await Productos.get()).docs;
    if(this.mounted)
      setState(() {
        _productos = prod;
      });
  }

}
