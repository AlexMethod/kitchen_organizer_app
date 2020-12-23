class ProductoSuper {
  int _id;
  bool _adquirido;
  String _nombre;

  ProductoSuper(this._nombre){ 
    _adquirido = false;
  }

  int get id => _id;
  bool get adquirido => _adquirido;
  String get nombre => _nombre;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();

    if(_id != null){
      map['id'] = _id;
    }
    map['adquirido'] = _adquirido;
    map['nombre'] = _nombre;

    return map;
  }

  ProductoSuper.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._adquirido = map['adquirido'];
    this._nombre = map['nombre'];
  }

  void cambiarAdquirido(){
    _adquirido = !_adquirido;
  }
}