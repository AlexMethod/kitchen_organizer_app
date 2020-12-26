import 'package:flutter/material.dart';

import 'package:kitchen_organizer_app/widgets/main_drawer.dart';
import 'package:kitchen_organizer_app/widgets/textfield_personalizado.dart';

class InformacionProductosPage extends StatefulWidget {
  @override
  _InformacionProductosPageState createState() => _InformacionProductosPageState();
}

class _InformacionProductosPageState extends State<InformacionProductosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Info. Productos'),
      ),
      drawer: MainDrawer(),
      body: Builder( builder: (context) =>
        ListView(
          children: <Widget>[
            _cardNuevaInfoProducto(context),
            _cardInfoProducto(context, 'Cebolla', '4 semanas', false),
            _cardInfoProducto(context, 'Limón', '2 semanas', false),
            _cardInfoProducto(context, 'Leche', '', true),
            _cardInfoProducto(context, 'Lechuga', '1 semana', false),
            _cardInfoProducto(context, 'Jitomate', '2 semanas', false),
            _cardInfoProducto(context, 'Mayonesa', '', true),
            _cardInfoProducto(context, 'Plátano', '6 días', false),
            _cardInfoProducto(context, 'Zanahoria', '18 días', false),
          ],
        )
      ),
    );
  }

  _cardInfoProducto(context, String producto, caducidad, bool enEmpaque){
    return Card(
      child: Container(
        padding: EdgeInsets.only(bottom: 10.0, left: 15.0, right: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  producto,
                  style: Theme.of(context).textTheme.headline6,
                ),
                Spacer(),
                IconButton(
                  icon: Icon(
                    Icons.edit,
                    color: Theme.of(context).accentColor,
                  ), 
                  onPressed: (){}
                ),
              ],
            ),
            Divider(
              color: Theme.of(context).accentColor,
            ),
            RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: 'Caducidad: ',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  TextSpan(
                    text: enEmpaque ? 'Viene en el empaque': caducidad,
                    style: Theme.of(context).textTheme.bodyText2.copyWith(
                      color: Theme.of(context).accentColor
                    ),
                  ),
                ]
              )
            ),
          ],
        ),
      ),
    );
  }

  _cardNuevaInfoProducto(context){
    return Card(
      child: Container(
        padding: EdgeInsets.only(bottom: 10.0, left: 15.0, right: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: TextFieldPersonalizado(
                    'Nuevo producto'
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.add_circle,
                    color: Theme.of(context).accentColor,
                  ), 
                  onPressed: (){}
                ),
              ],
            ),
            Divider(
              color: Theme.of(context).accentColor,
            ),
            Row(
              children: [
                Container(
                  width: 95.0,
                  child: TextFieldPersonalizado(
                    'Caducidad...',
                    textInputType: TextInputType.number,
                  ),
                ),
                Text('en días')
              ],
            ),
            Row(
              children: [
                Switch(
                  value: false, 
                  onChanged: (value){}
                  
                ),
                Text('Caducidad en el empaque')
              ],
            )
          ],
        ),
      ),
    );
  }


}