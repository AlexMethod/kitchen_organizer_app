import 'package:flutter/material.dart';

import 'package:kitchen_organizer_app/widgets/main_drawer.dart';

class ListaSuperPage extends StatefulWidget {
  @override
  _ListaSuperPageState createState() => _ListaSuperPageState();
}

class _ListaSuperPageState extends State<ListaSuperPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista del super'),
      ),
      drawer: MainDrawer(),
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: ListView(
          children: <Widget>[
            _cardObjetoSuper(context),
            _cardObjetoSuper(context),
            _cardObjetoSuper(context),
            _cardObjetoSuper(context),
            _cardAgregarObjeto(context),
          ],
        ),
      ),
    );
  }

  Widget _cardObjetoSuper(context){
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100.0)
      ),
      clipBehavior: Clip.hardEdge,
      child: Row(
        children: [
          Checkbox(
            onChanged: (value){},
            value: true,
          ),
          Text(
            'Zanahoria'
          ),
          Spacer(),
          IconButton(
            color: Theme.of(context).accentColor,
            icon: Icon(
              Icons.delete
            ), 
            onPressed: (){}
          )
        ],
      ),
    );
  }

  Widget _cardAgregarObjeto(context){
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100.0)
      ),
      clipBehavior: Clip.hardEdge,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            color: Theme.of(context).accentColor,
            icon: Icon(
              Icons.add_circle
            ),
            onPressed: (){}
          ),
          Expanded(
            child: TextField(
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
}