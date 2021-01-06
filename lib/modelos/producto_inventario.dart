class ProductoInventario {
  String nombre;
  int cantidad;
  DateTime adquisicion;
  int caducidad;

  ProductoInventario(String n, int cant, DateTime f, int cad){
    nombre = n;
    cantidad = cant;
    adquisicion = f;
    caducidad = cad;
  }
}