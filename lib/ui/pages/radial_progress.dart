import "package:flutter/material.dart";
import 'package:vector_math/vector_math_64.dart' as math;

class RadialProgress extends StatelessWidget {
  final double ht;
  final double wt;
  final double progress;
  RadialProgress({this.ht, this.wt, this.progress});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: RadialPainter(progress: progress),
      child: Container(
        height: ht,
        width: wt,
        //color: Colors.white,
        child: Center(
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: "1534",
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
}

class RadialPainter extends CustomPainter {
  final double progress;

  RadialPainter({this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, size.height / 2);
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
