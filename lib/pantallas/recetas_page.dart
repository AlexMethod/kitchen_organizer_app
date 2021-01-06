import 'package:flutter/material.dart';

import 'package:kitchen_organizer_app/widgets/main_drawer.dart';

class RecetasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recetas'),
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
        child: ListView(
            children: [
              Row(
                children: [
                  SizedBox(width: 5.0,),
                  _botonReceta(context, 'Filtrar', Icons.filter_alt),
                  SizedBox(width: 5.0,),
                  _botonReceta(context, 'Ordenar', Icons.sort_by_alpha),
                ],
              ),
              _cardReceta(context, 'Pollo a la plancha', 'Primero, reúne todos los ingredientes para preparar esta receta ligera. Usaremos limón para hacer que la pechuga a la plancha esté más jugosa, pero también puedes usar vinagre de manzana en vez de limón.'),
              _cardReceta(context, 'Pollo encacahuatado', 'Se pone a cocer el pollo con el cilantro, 1/4 de la cebolla y caldo de pollo en un poco de agua. También se hierven los jitomates para poder quitar la cascarilla. En una sartén se ponen a dorar los cacahuates y el chile (se reservan).'),
              _cardReceta(context, 'Estofado de pollo con hongos', 'Para este guiso podemos emplear trozos de pollo, pero siempre os recomiendo que sean trozos con hueso, pues suelen ser las partes del pollo más sabrosas. Con estos zancos o con muslos de pollo quedan muy ricos.'),
              _cardReceta(context, 'Tacos dorados de pollo', 'Lo primero es poner a cocer las pechugas de pollo en una olla junto con una cebolla y media, los cuatro ajos pelados y un chorrito de aceite de oliva. Cubrimos bien de agua y lo ponemos, tapado, a fuego alto hasta que hierva. En este paso podéis añadir a la olla otras verduras para dar más sabor, como tomate, puerro, pimiento, apio o zanahoria. '),
            ]
        ),
      ),
    );
  }

  _cardReceta(context, nombreReceta, contenido){
    return Container(
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            nombreReceta,
            style: Theme.of(context).textTheme.headline6,
          ),
          Divider(
            color: Theme.of(context).accentColor,
          ),
          Text(
            contenido,
            textAlign: TextAlign.justify,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FlatButton(
                child: Text(
                  'Ver más...',
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontWeight: FontWeight.w400
                  ),
                ),
                onPressed: (){},
              ),
            ],
          )
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.purple[900],
            blurRadius: 1.0,
          )
        ]
      ),
    );
  }

  Widget _botonReceta(context, texto, icono){
    return ElevatedButton(
      onPressed: (){}, 
      child: Row(
        children: [
          Text(texto),
          Icon(
            icono,
          )
        ],
      )
    );
  }
}