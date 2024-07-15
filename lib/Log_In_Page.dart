// import 'dart:ui';
import 'package:basecode/Home_Page.dart';
import 'package:basecode/Sign_Up_Page.dart';
import 'package:basecode/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class Log extends StatefulWidget {
  const Log({super.key});

  @override
  State<Log> createState() => _LogState();
}

class _LogState extends State<Log> {
  final TextEditingController _controller = TextEditingController();
  String _displayText = "";
  void _updateText() {
    setState(() {
      _displayText = _controller.text;
    });
  }

  final TextEditingController _controller1 = TextEditingController();
  String _displayText1 = "";
  void _updatetext1() {
    setState(() {
      _displayText1 = _controller1.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(66, 150, 144, 1),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            ClipPath(
              clipper: LogClipPath(),
              child: Container(
                height: screenheight,
                color: Colors.white,
              ),
            ),
            Positioned(
              top: 90,
              right: 40,
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                backgroundColor: Colors.white,
                elevation: double.maxFinite,
                child: const Icon(Icons.arrow_back),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 120,
                  ),
                  Container(
                    height: 250,
                    width: 390,
                    child: const Text(
                      'Spend Smarter\nSave More.',
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  Container(
                    height: 100,
                    width: 350,
                    child: const Text(
                      'Log In',
                      style: TextStyle(
                          fontSize: 54,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 35,
                    width: 295,
                    child: const Text(
                      'Email',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  Container(
                    height: 60,
                    width: 330,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(50),
                      ),
                      color: Colors.white70,
                    ),
                    child: Row(
                      children: <Widget>[
                        const SizedBox(
                          width: 30,
                        ),
                        const Icon(
                          Icons.email_outlined,
                          size: 29,
                        ),
                        const SizedBox(
                          width: 25,
                        ),
                        Expanded(
                          child: TextField(
                            controller: _controller,
                            decoration: const InputDecoration(
                                hintText: 'curecoders@gmail.com',
                                hoverColor: Colors.amber),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 35,
                    width: 295,
                    child: const Text(
                      'Password',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  Container(
                    height: 60,
                    width: 330,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      color: Colors.white70,
                    ),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 30,
                        ),
                        const Icon(
                          Icons.lock_outline,
                          size: 29,
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Expanded(
                          child: TextField(
                            controller: _controller1,
                            decoration: const InputDecoration(
                              hintText: '****************',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Column(
                      children: <Widget>[
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 30,
                          width: 160,
                          child: const Row(
                            children: [
                              Icon(
                                Icons.facebook,
                                size: 38,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Icon(
                                Icons.yard,
                                size: 38,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Icon(
                                Icons.deblur_rounded,
                                size: 38,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 50,
                          width: 240,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            color: Colors.white,
                          ),
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 84,
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const MyHomePage(),
                                    ),
                                  );
                                },
                                child: const Text(
                                  'Next',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              const Icon(
                                Icons.arrow_forward,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: 20,
                          width: 227,
                          child: Row(
                            children: [
                              const Text(
                                'Do not have an account?',
                                style: TextStyle(fontWeight: FontWeight.w800),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SignUp(),
                                      ));
                                },
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      color: Colors.blue[900]),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LogClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.lineTo(0, size.height * 0.35); // Start at the bottom-left corner
    path.cubicTo(size.width * 0.3, (size.height * 0.5), 3 * (size.width / 4),
        size.height * 0.35, size.width, size.height * 0.5); // Define the curve
    path.lineTo(size.width, 0); // End at the top-right corner
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
