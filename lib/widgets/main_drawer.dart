import 'package:flutter/material.dart';


class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          Container(
            color : Color(0xff42A5F5),
            child : DrawerHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          image : DecorationImage(
                              image : AssetImage("assets/images/MaleAvatar.png"),
                              fit : BoxFit.cover
                          )
                      )
                  ),
                  SizedBox(height: 10,),
                  Text('Alejandro Alvarez', style: TextStyle(fontSize: 20,color: Color(0xff37006A)),)
                ],
              ),
            )
          ),
          _botonDrawer(Icons.inventory, 'Inventario', context: context, ruta: ''),
          _botonDrawer(Icons.view_list_outlined, 'Lista del super', context: context, ruta: '/listaSuper'),
          _botonDrawer(Icons.food_bank, 'Recetas', context: context, ruta: '/recetas'),
          _botonDrawer(Icons.featured_play_list, 'Info. productos', context: context, ruta: '/informacionProductos'),
          Divider(),
          _botonDrawer(Icons.settings, 'Configuración', context: context, ruta: '/configuracion'),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      image : DecorationImage(
                          image : AssetImage("assets/images/Cabin.png"),
                          fit : BoxFit.cover
                      )
                  )
              )
            ],
          )
        ],
      ),
    );
  }
}

Widget _botonDrawer(IconData icon, String texto, {BuildContext context, String ruta}){
    return ListTile(
      title: Text(texto),
      leading: Icon(icon,color : Color(0xff42A5F5)),
      onTap: (){
        if(ruta != null && context != null && ruta != ''){
          Navigator.pushNamed(context, ruta);
        }
      },
    );
  }