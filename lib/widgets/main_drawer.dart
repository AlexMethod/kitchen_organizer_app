import 'package:flutter/material.dart';


class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Text('Usuario'),
          ),
          _botonDrawer(Icons.inventory, 'Inventario', context: context, ruta: ''),
          _botonDrawer(Icons.view_list_outlined, 'Lista del super', context: context, ruta: '/listaSuper'),
          _botonDrawer(Icons.food_bank, 'Recetas', context: context, ruta: ''),
          _botonDrawer(Icons.featured_play_list, 'Info. productos', context: context, ruta: '/informacionProductos'),
          Divider(),
          _botonDrawer(Icons.settings, 'Configuración', context: context, ruta: '/configuracion'),
        ],
      ),
    );
  }
}

Widget _botonDrawer(IconData icon, String texto, {BuildContext context, String ruta}){
    return ListTile(
      title: Text(texto),
      leading: Icon(icon),
      onTap: (){
        if(ruta != null && context != null && ruta != ''){
          Navigator.pushNamed(context, ruta);
        }
      },
    );
  }