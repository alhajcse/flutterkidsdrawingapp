import 'package:flutter/cupertino.dart';

//Copy this CustomPainter code to the Bottom of the File
class SailBoatPainter extends CustomPainter {

  static List<Path> _paths = [];

  @override
  void paint(Canvas canvas, Size size) {

    Path path_0 = Path();
    path_0.moveTo(size.width*0.4322037,size.height*0.1525380);
    path_0.lineTo(size.width*0.4322037,size.height*0.7118811);
    path_0.lineTo(size.width*0.008472706,size.height*0.7118811);
    path_0.close();

    _paths.add(path_0);

    Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
    paint_0_fill.color = Color.fromARGB(255, 13, 131, 23).withOpacity(1.0);
    canvas.drawPath(path_0,paint_0_fill);


    // Path path_1 = Path();
    // path_1.moveTo(size.width*0.5000010,size.height*0.7288129);
    // path_1.cubicTo(size.width*0.4906279,size.height*0.7288129,size.width*0.4830517,size.height*0.7212191,size.width*0.4830517,size.height*0.7118635);
    // path_1.lineTo(size.width*0.4830517,size.height*0.03389278);
    // path_1.cubicTo(size.width*0.4830517,size.height*0.02453725,size.width*0.4906279,size.height*0.01694346,size.width*0.5000010,size.height*0.01694346);
    // path_1.cubicTo(size.width*0.5093741,size.height*0.01694346,size.width*0.5169503,size.height*0.02453725,size.width*0.5169503,size.height*0.03389278);
    // path_1.lineTo(size.width*0.5169503,size.height*0.7118635);
    // path_1.cubicTo(size.width*0.5169503,size.height*0.7212191,size.width*0.5093741,size.height*0.7288129,size.width*0.5000010,size.height*0.7288129);
    //
    // Paint paint_1_fill = Paint()..style=PaintingStyle.fill;
    // paint_1_fill.color = Color.fromARGB(255, 74, 24, 135).withOpacity(1.0);
    // canvas.drawPath(path_1,paint_1_fill);
    //
    // _paths.add(path_1);

    // Path path_2 = Path();
    // path_2.moveTo(size.width*0.9915292,size.height*0.7118772);
    // path_2.lineTo(size.width*0.5677982,size.height*0.7118772);
    // path_2.lineTo(size.width*0.5677982,size.height*0.1525341);
    // path_2.cubicTo(size.width*0.5677982,size.height*0.1525341,size.width*0.9915292,size.height*0.2722633,size.width*0.9915292,size.height*0.7118772);
    //
    // Paint paint_2_fill = Paint()..style=PaintingStyle.fill;
    // paint_2_fill.color = Color.fromARGB(255, 208, 207, 206).withOpacity(1.0);
    // canvas.drawPath(path_2,paint_2_fill);
    //
    // _paths.add(path_2);
    //
    // Path path_3 = Path();
    // path_3.moveTo(size.width*0.008472706,size.height*0.7796608);
    // path_3.cubicTo(size.width*0.1324227,size.height*0.9150522,size.width*0.3051522,size.height*1.000002,size.width*0.5031709,size.height*1.000002);
    // path_3.cubicTo(size.width*0.7012053,size.height*1.000002,size.width*0.8675793,size.height*0.9150522,size.width*0.9915292,size.height*0.7796608);
    // path_3.lineTo(size.width*0.008472706,size.height*0.7796608);
    // path_3.close();
    //
    // Paint paint_3_fill = Paint()..style=PaintingStyle.fill;
    // paint_3_fill.color = Color.fromARGB(255, 57, 31, 4).withOpacity(1.0);
    // canvas.drawPath(path_3,paint_3_fill);
    //
    // _paths.add(path_3);
    //
    // Path path_4 = Path();
    // path_4.moveTo(size.width*0.3474571,size.height*0.1016959);
    // path_4.lineTo(size.width*0.5169503,size.height*0.1016959);
    // path_4.lineTo(size.width*0.5169503,0);
    // path_4.lineTo(size.width*0.3474571,0);
    // path_4.close();
    //
    // Paint paint_4_fill = Paint()..style=PaintingStyle.fill;
    // paint_4_fill.color = Color.fromARGB(255, 208, 207, 206).withOpacity(1.0);
    // canvas.drawPath(path_4,paint_4_fill);
    //
    // _paths.add(path_4);
    //
    // Path path_5 = Path();
    // path_5.moveTo(size.width*0.9207866,size.height*0.8305088);
    // path_5.lineTo(size.width*0.7711920,size.height*0.8305088);
    // path_5.cubicTo(size.width*0.7618189,size.height*0.8305088,size.width*0.7542427,size.height*0.8381026,size.width*0.7542427,size.height*0.8474581);
    // path_5.cubicTo(size.width*0.7542427,size.height*0.8568136,size.width*0.7618189,size.height*0.8644074,size.width*0.7711920,size.height*0.8644074);
    // path_5.lineTo(size.width*0.8994311,size.height*0.8644074);
    // path_5.cubicTo(size.width*0.9110249,size.height*0.8554581,size.width*0.9223472,size.height*0.8461026,size.width*0.9333980,size.height*0.8364072);
    // path_5.cubicTo(size.width*0.9302945,size.height*0.8328467,size.width*0.9258707,size.height*0.8305088,size.width*0.9207866,size.height*0.8305088);
    //
    // Paint paint_5_fill = Paint()..style=PaintingStyle.fill;
    // paint_5_fill.color = Color.fromARGB(255, 208, 207, 206).withOpacity(1.0);
    // canvas.drawPath(path_5,paint_5_fill);
    //
    // _paths.add(path_5);
    //
    // Path path_6 = Path();
    // path_6.moveTo(size.width*0.8239072,size.height*0.8983060);
    // path_6.lineTo(size.width*0.6695000,size.height*0.8983060);
    // path_6.cubicTo(size.width*0.6601269,size.height*0.8983060,size.width*0.6525507,size.height*0.9058998,size.width*0.6525507,size.height*0.9152554);
    // path_6.cubicTo(size.width*0.6525507,size.height*0.9246109,size.width*0.6601269,size.height*0.9322047,size.width*0.6695000,size.height*0.9322047);
    // path_6.lineTo(size.width*0.7919753,size.height*0.9322047);
    // path_6.cubicTo(size.width*0.8077215,size.height*0.9242886,size.width*0.8231787,size.height*0.9158491,size.width*0.8381963,size.height*0.9066967);
    // path_6.cubicTo(size.width*0.8352295,size.height*0.9017631,size.width*0.8300771,size.height*0.8983060,size.width*0.8239072,size.height*0.8983060);
    //
    // Paint paint_6_fill = Paint()..style=PaintingStyle.fill;
    // paint_6_fill.color = Color.fromARGB(255, 208, 207, 206).withOpacity(1.0);
    // canvas.drawPath(path_6,paint_6_fill);
    //
    // _paths.add(path_6);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}