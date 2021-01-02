import 'package:flutter/material.dart';
import 'package:kitchen_organizer_app/widgets/main_drawer.dart';

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context){
    return Container(
        color: Colors.white,
        child: Screen1()
    );
  }
}

class Screen1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
      return Container(
        child: CustomPaint(
          painter : RectanguloPainter()
        ),
      );
  }
  
}

class RectanguloPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    var x = size.width;
    var y = size.height;
    var m = ( (y * 0.5) - (y)  ) / ( (x) - (x * 0.1) );
    var primaryColor =  Color(0xFF42A5F5);
    var primaryColor_80 =  Color(0xCC42A5F5);
    var primaryColor_40 =  Color(0x6642A5F5);

    var paint = Paint();
    var path = Path();
    paint.style = PaintingStyle.fill;

    //Rectangulo 1
    /*
    paint.color = primaryColor_40;
    path.moveTo(0, y * 0.35);
    path.quadraticBezierTo(x * 0.8, 0,x * 0.5, 0 );
    path.lineTo(0, 0);
    canvas.drawPath(path, paint);
    */
    //Rectangulo 4
    paint.color = primaryColor_40;

    path.moveTo(0, y * 0.975);
    path.addRRect(rrect)
    path.lineTo(x * 0.4, y * 0.7);
    path.quadraticBezierTo(x * 0.4, y * 0.5, 0, y * 0.65);
    //path.lineTo(0, y * 0.65);
    //path.quadraticBezierTo(x , y * 0.5,0, y * 0.65);
    canvas.drawPath(path, paint);

    //Rectangulo 5
    paint.color = primaryColor_80;
    path.moveTo(x * 0.1,y);
    path.lineTo(x, y * .6);
    path.lineTo(x, y);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text('Kitchen organizer'),
      )
    );
  }
}
