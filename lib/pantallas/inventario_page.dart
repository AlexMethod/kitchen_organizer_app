import 'package:flutter/material.dart';
import 'package:kitchen_organizer_app/widgets/main_drawer.dart';
import 'package:kitchen_organizer_app/modelos/producto_super.dart';

class InventarioPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _InventarioPageState();

}

class _InventarioPageState extends State<InventarioPage> {
  final nuevoProductoController = TextEditingController();
  List<ProductoSuper> productos = new List();

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

    return items;
  }

  List<Widget> _getItemsInventario(context){
    var cardsProductos = <Widget>[];
    productos.add(new ProductoSuper("Cebolla"));
    productos.add(new ProductoSuper("Lechuga"));
    productos.add(new ProductoSuper("Jitomate"));
    productos.add(new ProductoSuper("Arroz"));
    productos.forEach((element) {
      cardsProductos.add(_cardItemInventario(context, element.nombre, 2,"17 dic 2020", 45));
    });
    return cardsProductos;
  }

  Widget _cardItemInventario(context, String producto, int cantidad, String fecha, int caducidad) {
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
                                    text : fecha,
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


}
