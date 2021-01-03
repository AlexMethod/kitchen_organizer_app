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
              _cardReceta(context, 'Pollo a la plancha'),
              _cardReceta(context, 'Pollo encacahuatado'),
              _cardReceta(context, 'Estofado de pollo con hongos'),
              _cardReceta(context, 'Tacos dorados de pollo'),
            ]
        ),
      ),
    );
  }

  _cardReceta(context, nombreReceta){
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
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
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