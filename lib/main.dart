import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutterkidsdrawingapp/svg_parser/parser.dart';
import 'package:touchable/touchable.dart';
import 'package:xml/xml.dart' as xml;
import 'package:xml/xml.dart';



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

  List<Path> selectedPath = [];


  //List<Color> colors = [Colors.red, Colors.blue, Colors.green,Colors.yellow,Colors.amberAccent];

  final List<Color> colors = <Color>[
    Colors.red, Colors.blue, Colors.green, Colors.yellow, Colors.orange,
    Colors.black, Colors.blueGrey, Colors.deepOrange, Colors.indigo, Colors.lightBlue,
    Colors.teal, Colors.yellowAccent, Colors.lightGreen, Colors.purple, Colors.limeAccent];


  Color currentColor = Colors.limeAccent;
  void changeColor(Color color) => setState(() => currentColor = color);



  @override
  void initState() {
    parseSvgToPath();
    extractSVGData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Center(
          child: Text('Kids Number'),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            // SizedBox(
            //   width: double.infinity, // full screen here, you can change size to see different effect
            //   height: MediaQuery.of(context).size.height * .6,
            //   child: Padding(
            //     padding: const EdgeInsets.symmetric(horizontal: 1.0),
            //     child: CanvasTouchDetector(
            //       builder: (context) => CustomPaint(
            //         painter: PathPainter(
            //           context: context,
            //           paths: paths,
            //           curPath: _selectPath,
            //           onPressed: (curPath) {
            //
            //             setState(() {
            //               _selectPath = curPath;
            //               print(currentColor);
            //               // _color=Colors.green;
            //             });
            //             // controller.animateTo(
            //             //   controller.position.maxScrollExtent *
            //             //       paths.indexOf(curPath) /
            //             //       paths.length,
            //             //   curve: Curves.easeIn,
            //             //   duration: const Duration(milliseconds: 500),
            //             // );
            //             // setState(() {
            //             //   _selectedPath = curPath;
            //             //
            //             //   print('path  ${curPath}');
            //             //   print('path  ${_selectedPath}');
            //             //
            //             // });
            //           },
            //           // height: heightSvg,
            //           // width: widthSvg,
            //         ),
            //       ),
            //     ),
            //   ),
            // ),

            // Container(
            //   color: Colors.grey,  // just make a difference
            //   width: 300, // full screen here, you can change size to see different effect
            //   height: 300,
            //   child: CanvasTouchDetector(
            //     builder: (context) => CustomPaint(
            //       painter: PathPainter(
            //         context: context,
            //         paths: paths,
            //         curPath: _selectPath,
            //         color: currentColor,
            //         onPressed: (curPath) {
            //
            //           setState(() {
            //             _selectPath = curPath;
            //             print(currentColor);
            //
            //
            //
            //             // _color=Colors.green;
            //           });
            //         },
            //       ),
            //     ),
            //   ),
            // ),


            SizedBox(
              width: double.infinity, // full screen here, you can change size to see different effect
              height: MediaQuery.of(context).size.height * .6,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Container(
                  color: Colors.grey,  // just make a difference
                  // width: double.infinity, // full screen here, you can change size to see different effect
                  // height: double.infinity,
                  child: CanvasTouchDetector( // see: https://pub.dev/packages/touchable
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
            ),

            Expanded(
              child: ListView.separated(
                  // controller: controller,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () => setState(() {
                     // _selectedPath = paths[index];
                      currentColor=colors[index];
                    }),
                    child: CircleAvatar(
                      child: Text("${index + 1}"),
                      backgroundColor: colors[index],
                    ),
                  ),
                  separatorBuilder: (context, index) =>
                  const SizedBox(width: 8),
                  itemCount: colors.length),
            )
          ],
        ),
      )


    /*  Center(
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
      ),*/
    );
  }

  void parseSvgToPath() {
    SvgParser parser = SvgParser();
    parser.loadFromFile(svgPath).then((value) {
      setState(() {
        paths = parser.getPaths();


        for(var p in paths){



          print('id ${p.getBounds().size}');

        }


      });
    });

    //parser.loadFromString(svgPath);

  }


  Future<void> extractSVGData() async {
    final svgString = await DefaultAssetBundle.of(context).loadString(svgPath);
    final document = xml.parse(svgString);


    String generalString = await rootBundle.loadString(svgPath);


    XmlDocument document1 = XmlDocument.parse(generalString);


    //final path = document1.findElements('path');

   // String partId = path.getAttribute('id').toString();


    // for (var element in paths) {
    //   String partId = element.getAttribute('id').toString();
    //   String partPath = element.getAttribute('d').toString();
    //   String name = element.getAttribute('name').toString();
    //   String color = element.getAttribute('color')?.toString() ?? 'D7D3D2';
    //
    //   //_selectPath=element as Path;
    //   print('id $name');
    //
    //   //maps.add(Country(id: partId, path: partPath, color: color, name: name));
    // }




    for (var element in document.descendants) {
      if (element is xml.XmlElement) {
        if (element.name.local == 'path') {
          final pathName = element.getAttribute('id');

          print('dd ${element.getAttribute('id')}');
         // element=_selectPath;
          // Use pathName as needed
        //  print('dd ${pathName}');
        } else if (element.name.local == 'id') {
          final id = element.text;
          print('id $id');
          // Use id as needed
        }
      }
    }
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
      //..style =PaintingStyle.stroke
    // ..color = Colors.red
      ..color = color;
     // ..strokeWidth = 1.0;

    final Paint paint2 = Paint()
    //..style =PaintingStyle.stroke
     ..color = Colors.white
     // ..color = color
      ..strokeWidth = 1.0;


    paths.forEach(
          (path) {

            // Here: archive our target, select one province, just change the paint's style to fill
        paint.style = path == curPath ? PaintingStyle.fill: PaintingStyle.stroke;

        touchCanvas.drawPath(
          // scale and offset each path to match the canvas
          path.transform(matrix4.storage).shift(Offset(offsetX, offsetY)),
          paint,
          onTapDown: (details) {
            // notify select change and redraw
            onPressed(path);
          },
        );

        paint2.style = PaintingStyle.stroke;
        touchCanvas.drawPath(
          // scale and offset each path to match the canvas
          path.transform(matrix4.storage).shift(Offset(offsetX, offsetY)),
          paint2,
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
