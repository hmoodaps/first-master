import 'package:flutter/material.dart';
import 'package:untitled3/cubit/cubit.dart';
import 'package:untitled3/home/home_screen.dart';
import 'package:untitled3/network/shared_preferencers.dart';
import 'package:untitled3/screens/flags_first.dart';
import 'package:untitled3/screens/secound_screen.dart';

import 'mod.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    CubitClass cub = CubitClass.get(context);
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeIn(
              delay: 2.0,
              child: const Text(
                'Welcome',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ),
            const SizedBox(height: 20),
            FadeIn(
              delay: 4,
              child: const Text(
                'The News APP',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 40,
                ),
              ),
            ),
            const SizedBox(height: 20),
            FadeIn(
              delay: 6,
              child: const Text('Thank you for your choice',style: TextStyle(fontSize: 20),)
            ),
            const SizedBox(height: 70),
            FadeIn(
              delay: 8,
              child: ElevatedButton(
                onPressed: () {
                  Save.setBoolData('isFirstPage', true);
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const SecondPage()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Set the button background color to blue
                ),
                child:  Icon(Icons.arrow_circle_right,size: 100,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FadeIn extends StatefulWidget {
  final Widget child;
  final double delay;

  FadeIn({Key? key, required this.child, required this.delay});

  @override
  _FadeInState createState() => _FadeInState();
}

class _FadeInState extends State<FadeIn> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
      reverseDuration: Duration(milliseconds: 700),
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    Future.delayed(Duration(milliseconds: (widget.delay * 1000).toInt()), () {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: widget.child,
    );
  }
}
