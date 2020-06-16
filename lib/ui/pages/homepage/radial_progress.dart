import "package:flutter/material.dart";
import 'package:flutterdev/Models/datamod.dart';
import 'package:vector_math/vector_math_64.dart' as math;
import 'package:provider/provider.dart';
class RadialProgress extends StatelessWidget {
  final double ht;
  final double wt;
  double progress;
  RadialProgress({this.ht, this.wt});

  @override
  Widget build(BuildContext context) {
    Datamod dum =
        new Datamod(age: '', uid: '', name: '', height: '0', weight: '0',activelevel: '0',protein: '1',gender: '',fat: '1',bmi: '0',carbs: '1',caloriesdone: '1',calories: '2');
    final userspecifics = Provider.of<Datamod>(context)??dum;
    progress=double.parse(userspecifics.caloriesdone)/double.parse(userspecifics.calories);
    if(int.parse(userspecifics.caloriesdone)<  int.parse(userspecifics.calories)){
    return CustomPaint(
      painter: RadialPainter(progress: progress),
      child: Container(
        height: ht,
        width: wt,
        child: Center(
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: "${userspecifics.caloriesdone}",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1,
                    fontSize: 35,
                  ),
                ),
                TextSpan(text: "\n"),
                TextSpan(text: "kcal consumed", style: TextStyle(color:Color(0xFFe83323)) ),
              ],
            ),
          ),
        ),
      ),
    );
    }
    else{
      return CustomPaint(
      painter: RadialPainter(progress: progress),
      child: Container(
        height: ht,
        width: wt,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Center(
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "CONGRATS",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      //letterSpacing: 1,
                      fontSize: 20,
                    ),
                  ),
                  TextSpan(text: "\n"),
                  TextSpan(text: "DONE FOR THE DAY!", style: TextStyle(color:Color(0xFFe83323)) ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
    }
    
  }
}

class RadialPainter extends CustomPainter {
   double progress;

  RadialPainter({this.progress});
  
  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, size.height / 2);
    if(progress==0)
    progress=0.01;
    double relProgress = 360 * progress;
    Paint paint = Paint()
      ..strokeWidth = 7
      //.color = Colors.red
      ..shader = LinearGradient(colors: [Colors.redAccent, Color(0xFFde5371),Colors.red,Colors.red[900]]).createShader(Rect.fromCircle(center:center,radius: size.width/2))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
     
    canvas.drawArc(Rect.fromCircle(center: center, radius: size.width / 2),
        math.radians(-90), math.radians(-relProgress), false, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
    throw UnimplementedError();
  }
}
