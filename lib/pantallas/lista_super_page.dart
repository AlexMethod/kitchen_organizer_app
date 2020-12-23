import 'package:flutter/material.dart';

import 'package:kitchen_organizer_app/widgets/main_drawer.dart';
import 'package:kitchen_organizer_app/modelos/producto_super.dart';

class ListaSuperPage extends StatefulWidget {
  @override
  _ListaSuperPageState createState() => _ListaSuperPageState();
}

class _ListaSuperPageState extends State<ListaSuperPage> {
  final nuevoProductoController = TextEditingController();

  List<ProductoSuper> productos = new List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista del super'),
      ),
      drawer: MainDrawer(),
      body: Builder( builder: (context) =>
        GestureDetector(
          onTap: () {
            _unfocus(context);
          },
          child: ListView(
            children: _cardsLista(context),
          ),
        ),
      ),
    );
  }

  _cardsLista(context){
    var cards = <Widget>[];

    cards.addAll(_crearCardsProductos(context));
    cards.add(_cardAgregarProducto(context));

    return cards;
  }
  
  List<Widget> _crearCardsProductos(context){
    var cardsProductos = <Widget>[];
    productos.forEach((element) { 
      cardsProductos.add(_cardProductoSuper(context, element.nombre, element.adquirido));
    });
    return cardsProductos;
  }

  Widget _cardProductoSuper(context, String producto, bool adquirido){
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100.0)
      ),
      clipBehavior: Clip.hardEdge,
      child: CheckboxListTile(
        onChanged: (value){
          setState(() {
            ProductoSuper productoBuscado = productos.where((item) => item.nombre == producto).first;
            productoBuscado.cambiarAdquirido();
          });
          adquirido = value;
        },
        value: adquirido,
        controlAffinity: ListTileControlAffinity.leading,
        title: Row(
          children: [
            Text(producto),
            Spacer(),
            IconButton(
              color: Theme.of(context).accentColor,
              icon: Icon(
                Icons.delete
              ), 
              onPressed: (){
                setState(() {
                  productos.removeWhere((item) => item.nombre == producto);
                });
              }
            )
          ],
        ),
      ),
    );
  }

  Widget _cardAgregarProducto(context){
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100.0)
      ),
      clipBehavior: Clip.hardEdge,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: 10.0,),
          IconButton(
            color: Theme.of(context).accentColor,
            icon: Icon(
              Icons.add_circle,
              size: 26.0,
            ),
            onPressed: (){
              _crearProductoSuper(context);
            }
          ),
          SizedBox(width: 10.0,),
          Expanded(
            child: TextField(
              controller: nuevoProductoController,
              cursorColor: Theme.of(context).accentColor,
              cursorHeight: 25.0,
              keyboardType: TextInputType.text,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                labelText: 'Añadir nuevo producto',
                floatingLabelBehavior: FloatingLabelBehavior.never,
                contentPadding: EdgeInsets.only(top: -20.0),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          )
        ],
      ),
    );
  }

  void _crearProductoSuper(context){
    if(nuevoProductoController.text != ''){
      setState(() {
        // El producto ya está en la lista
        if(productos.any((element) => 
                          element.nombre.toUpperCase() == 
                          nuevoProductoController.text.toUpperCase())){
          final snackBar = SnackBar(
            backgroundColor: Theme.of(context).accentColor,
            content: Text('Este producto ya se encuentra en la lista'),
          );
          Scaffold.of(context).showSnackBar(snackBar);
        }
        else{
          ProductoSuper nuevoProducto = ProductoSuper(nuevoProductoController.text);
          productos.add(nuevoProducto);
        }
        nuevoProductoController.clear();
        _unfocus(context);
      });
    }
  }

  _unfocus(context){
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }


}