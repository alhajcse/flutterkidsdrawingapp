import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutterkidsdrawingapp/svg_parser/parser.dart';
import 'package:touchable/touchable.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

//! Make sure fill the current svg's viewBox(width and height)
// TODO: fix svg parser to automatic get the viewBox
const double SvgWidth = 1369; //1369; //612.54211;
const double SvgHeight = 1141; //1141; //723.61865;

class _MyHomePageState extends State<MyHomePage> {
  Path _selectPath;
  // Color _color;
  final svgPath = "assets/map_china.svg";
  //final svgPath = "assets/netherlands.svg";
  List<Path> paths = [];

  Color currentColor = Colors.limeAccent;
  void changeColor(Color color) => setState(() => currentColor = color);



  @override
  void initState() {
    parseSvgToPath();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Center(
          child: RaisedButton(
            elevation: 3.0,
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    titlePadding: const EdgeInsets.all(0.0),
                    contentPadding: const EdgeInsets.all(0.0),
                    content: SingleChildScrollView(
                      child: BlockPicker(
                        pickerColor: currentColor,
                        onColorChanged: changeColor,
                      ),
                    ),
                  );
                },
              );
            },
            child: const Text('Change me'),
            color: currentColor,
            textColor: useWhiteForeground(currentColor)
                ? const Color(0xffffffff)
                : const Color(0xff000000),
          ),
        ),
      ),
      body: Center(
        child: Container(
          color: Colors.grey,  // just make a difference
          width: double.infinity, // full screen here, you can change size to see different effect
          height: double.infinity,
          child: CanvasTouchDetector(
            builder: (context) => CustomPaint(
              painter: PathPainter(
                context: context,
                paths: paths,
                curPath: _selectPath,
                color: currentColor,
                onPressed: (curPath) {

                  setState(() {
                    _selectPath = curPath;
                    print(currentColor);
                    // _color=Colors.green;
                  });
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  void parseSvgToPath() {
    SvgParser parser = SvgParser();
    parser.loadFromFile(svgPath).then((value) {
      setState(() {
        paths = parser.getPaths();
      });
    });

  }
}

class PathPainter extends CustomPainter {
  final BuildContext context;
  final List<Path> paths;
  final Path curPath;
  final Color color;
  final Function(Path curPath) onPressed;
  PathPainter({this.context, this.paths, this.curPath, this.onPressed,this.color});

  @override
  void paint(Canvas canvas, Size size) {

    // calculate the scale factor, use the min value
    final double xScale = size.width / SvgWidth;
    final double yScale = size.height / SvgHeight;
    final double scale = xScale < yScale ? xScale : yScale;

    // scale each path to match canvas size
    final Matrix4 matrix4 = Matrix4.identity();
    matrix4.scale(scale, scale);

    // calculate the scaled svg image width and height in order to get right offset
    double scaledSvgWidth = SvgWidth * scale;
    double scaledSvgHeight = SvgHeight * scale;
    // calculate offset to center the svg image
    double offsetX = (size.width - scaledSvgWidth) / 2;
    double offsetY = (size.height - scaledSvgHeight) / 2;

    // make canvas clickable, see: https://pub.dev/packages/touchable
    final TouchyCanvas touchCanvas = TouchyCanvas(context, canvas);
    // your paint
    final Paint paint = Paint()
      ..style = PaintingStyle.stroke
    // ..color = Colors.red
      ..color = color
      ..strokeWidth = 1.0;

    paths.forEach(
          (path) {
        // Here: archive our target, select one province, just change the paint's style to fill
        paint.style = path == curPath ? PaintingStyle.fill : PaintingStyle.stroke;

        touchCanvas.drawPath(
          // scale and offset each path to match the canvas
          path.transform(matrix4.storage).shift(Offset(offsetX, offsetY)),
          paint,
          onTapDown: (details) {
            // notify select change and redraw
            onPressed(path);
          },
        );
      },
    );
  }

  @override
  bool shouldRepaint(PathPainter oldDelegate) => true;
}
