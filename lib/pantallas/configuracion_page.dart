import 'package:flutter/material.dart';

import 'package:kitchen_organizer_app/widgets/main_drawer.dart';

class ConfiguracionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configuración'),
      ),
      drawer: MainDrawer(),
      body: ListView(
        padding: EdgeInsets.all(20.0),
        children: <Widget>[
          Text(
            'Notificaciones',
            style: Theme.of(context).textTheme.headline6,
          ),
          ListTile(
            leading: Checkbox(
              onChanged: (value){},
              value: false,
            ),
            title: Text('Caducidad'),
          ),
          ListTile(
            leading: Checkbox(
              onChanged: (value){},
              value: false,
            ),
            title: Text('Poco producto'),
          ),
          Text(
            'Aplicación',
            style: Theme.of(context).textTheme.headline6,
          ),
          InkWell(
            onTap: (){},
            child: ListTile(
              title: Text(
                'Tema de la aplicación',
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Text(
            'Cuenta',
            style: Theme.of(context).textTheme.headline6,
          ),
          InkWell(
            onTap: (){},
            child: ListTile(
              title: Text(
                'Detalles de la cuenta',
                textAlign: TextAlign.left,
              ),
            ),
          ),
        ],
      ),
    );
  }
}