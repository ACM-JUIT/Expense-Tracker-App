import 'package:basecode/Expense.dart';
import 'package:basecode/Notification.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        CustomPaint(
          size: Size(MediaQuery.of(context).size.width,
              MediaQuery.of(context).size.height),
          painter: CurvedRectanglePainter(),
        ),
        Positioned(
              top: 200,
              bottom: 480,
              left: 20,
              right: 20,
        child: Container(
            decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(40)),color: Color.fromRGBO(42, 124, 118, 1),),
            height: 50,
            width: 100,
          ),
        ),
        const Column(
          children: <Widget>[
            SizedBox(height: 460,),
            Row(
              children: <Widget>[
                SizedBox(width: 30,),
                Text('Transaction History', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),),
                SizedBox(width: 200,),
                Text('See all'),
              ],
            )
          ],
        ),
        Positioned(
            bottom: 5,
            right: 185,
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Expense()),
                );
              },
              icon: const Icon(Icons.add_circle_rounded),
              color: const Color.fromRGBO(42, 124, 118, 1),
              iconSize: 60,
            ),
        ),
        Positioned(
          top: 70,
          left: 360,
          child: FloatingActionButton(
            foregroundColor: Colors.white,
            backgroundColor: const Color.fromRGBO(42, 124, 118, 1),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Notify(),)
              );
            },
            child: Icon(Icons.notification_add)
          ),
        ),
      ],
    )
    );
  }
}

class CurvedRectanglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = const Color.fromRGBO(66, 150, 144, 1)
      ..style = PaintingStyle.fill;

    Path path = Path();
    double curveHeight =
        size.height * 0.3; // Adjust this value to reduce the height

    path.moveTo(0, 0);
    path.lineTo(0, curveHeight);
    path.quadraticBezierTo(size.width / 2, curveHeight + size.height * 0.1,
        size.width, curveHeight);
    path.lineTo(size.width, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
