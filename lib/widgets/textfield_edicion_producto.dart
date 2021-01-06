import 'package:flutter/material.dart';

class TextFieldEdicionProducto extends StatefulWidget {
  const TextFieldEdicionProducto(this.texto,{this.textEdittingController, this.textInputType, this.textStyle});

  final String texto;
  final TextEditingController textEdittingController;
  final TextInputType textInputType;
  final TextStyle textStyle;

  @override
  _TextFieldPersonalizadoState createState() => _TextFieldPersonalizadoState();
}

class _TextFieldPersonalizadoState extends State<TextFieldEdicionProducto> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.textEdittingController,
      cursorColor: Theme.of(context).accentColor,
      cursorHeight: 20.0,
      keyboardType: widget.textInputType,
      textCapitalization: TextCapitalization.sentences,
      style: TextStyle(fontSize: 20, color: Color(0xff5D34AF)) ,
      decoration: InputDecoration(
        labelText: widget.texto,
        labelStyle: TextStyle(
            color: Theme.of(context).accentColor,
            fontWeight: FontWeight.w300
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        contentPadding: EdgeInsets.only(top: -15.0),
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
      ),
    );
  }
}