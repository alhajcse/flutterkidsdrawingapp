import 'package:flutter/material.dart';
import 'package:flutterkidsdrawingapp/custom_painter.dart';
import 'package:flutterkidsdrawingapp/svg_painter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final GlobalKey _paintKey = GlobalKey();
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    double width = 200;
  //  double width = MediaQuery.of(context).width;
    double height = 200;
   // double height = MediaQuery.of(context).height;

    List<Path> _paths = [];
    //Size size=new Size();
    Path path_0 = Path();
    path_0.moveTo(width*0.4322037,height*0.1525380);
    path_0.moveTo(width*0.4322037,height*0.1525380);
    path_0.lineTo(width*0.4322037,height*0.7118811);
    path_0.lineTo(width*0.008472706,height*0.7118811);
    path_0.close();

    _paths.add(path_0);


    Path path_1 = Path();
    path_1.moveTo(width*0.5000010,height*0.7288129);
    path_1.cubicTo(width*0.4906279,height*0.7288129,width*0.4830517,height*0.7212191,width*0.4830517,height*0.7118635);
    path_1.lineTo(width*0.4830517,height*0.03389278);
    path_1.cubicTo(width*0.4830517,height*0.02453725,width*0.4906279,height*0.01694346,width*0.5000010,height*0.01694346);
    path_1.cubicTo(width*0.5093741,height*0.01694346,width*0.5169503,height*0.02453725,width*0.5169503,height*0.03389278);
    path_1.lineTo(width*0.5169503,height*0.7118635);
    path_1.cubicTo(width*0.5169503,height*0.7212191,width*0.5093741,height*0.7288129,width*0.5000010,height*0.7288129);


    _paths.add(path_1);

    Path path_2 = Path();
    path_2.moveTo(width*0.9915292,height*0.7118772);
    path_2.lineTo(width*0.5677982,height*0.7118772);
    path_2.lineTo(width*0.5677982,height*0.1525341);
    path_2.cubicTo(width*0.5677982,height*0.1525341,width*0.9915292,height*0.2722633,width*0.9915292,height*0.7118772);



    _paths.add(path_2);

    Path path_3 = Path();
    path_3.moveTo(width*0.008472706,height*0.7796608);
    path_3.cubicTo(width*0.1324227,height*0.9150522,width*0.3051522,height*1.000002,width*0.5031709,height*1.000002);
    path_3.cubicTo(width*0.7012053,height*1.000002,width*0.8675793,height*0.9150522,width*0.9915292,height*0.7796608);
    path_3.lineTo(width*0.008472706,height*0.7796608);
    path_3.close();



    _paths.add(path_3);

    Path path_4 = Path();
    path_4.moveTo(width*0.3474571,height*0.1016959);
    path_4.lineTo(width*0.5169503,height*0.1016959);
    path_4.lineTo(width*0.5169503,0);
    path_4.lineTo(width*0.3474571,0);
    path_4.close();

    _paths.add(path_4);

    Path path_5 = Path();
    path_5.moveTo(width*0.9207866,height*0.8305088);
    path_5.lineTo(width*0.7711920,height*0.8305088);
    path_5.cubicTo(width*0.7618189,height*0.8305088,width*0.7542427,height*0.8381026,width*0.7542427,height*0.8474581);
    path_5.cubicTo(width*0.7542427,height*0.8568136,width*0.7618189,height*0.8644074,width*0.7711920,height*0.8644074);
    path_5.lineTo(width*0.8994311,height*0.8644074);
    path_5.cubicTo(width*0.9110249,height*0.8554581,width*0.9223472,height*0.8461026,width*0.9333980,height*0.8364072);
    path_5.cubicTo(width*0.9302945,height*0.8328467,width*0.9258707,height*0.8305088,width*0.9207866,height*0.8305088);


    _paths.add(path_5);

    Path path_6 = Path();
    path_6.moveTo(width*0.8239072,height*0.8983060);
    path_6.lineTo(width*0.6695000,height*0.8983060);
    path_6.cubicTo(width*0.6601269,height*0.8983060,width*0.6525507,height*0.9058998,width*0.6525507,height*0.9152554);
    path_6.cubicTo(width*0.6525507,height*0.9246109,width*0.6601269,height*0.9322047,width*0.6695000,height*0.9322047);
    path_6.lineTo(width*0.7919753,height*0.9322047);
    path_6.cubicTo(width*0.8077215,height*0.9242886,width*0.8231787,height*0.9158491,width*0.8381963,height*0.9066967);
    path_6.cubicTo(width*0.8352295,height*0.9017631,width*0.8300771,height*0.8983060,width*0.8239072,height*0.8983060);


    _paths.add(path_6);
    
    

    return GestureDetector(
      onTapDown: (details) {

            final renderBox = context.findRenderObject() as RenderBox;
            final tapPosition = renderBox.globalToLocal(details.globalPosition);

            // Check if the tap position is within any path
            for (final path in _paths) {
              print(path.getBounds());
              if (_isWithinPath(tapPosition, path)) {
                // Handle the tap event for the clicked path
                break;
              }
            }

        print('object');
        // if (isWithinRegion(details.localPosition)) {
        //   // Handle the tap event for the clicked region
        // }
      },
      child: Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: Center(
          child: Container(
            child: RepaintBoundary(
              child: CustomPaint(
                painter: _SVGPainter(_paths),
              ),
            ),
          ),
        ),
      ),
    );
  }



  bool isWithinRegion(Offset tapPosition) {
    // Implement your logic here
    // Check if the tapPosition is within a specific region
    print('object');
    return false;
  }


  bool _isWithinPath(Offset tapPosition, Path path) {
    final paintBounds = (context.findRenderObject() as RenderBox).paintBounds;
    final transformedPath = path.transform(
      Matrix4.translationValues(-paintBounds.left, -paintBounds.top, 0).storage,
    );
    print(tapPosition);
    return transformedPath.contains(tapPosition);
  }
}



class _SVGPainter extends CustomPainter {
  final List<Path> paths;
  _SVGPainter(this.paths);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.fill;

    for (final path in paths) {
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false; // Since the painter won't change
  }
}