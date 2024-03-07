import 'package:flutter/material.dart';
import 'package:untitled3/cubit/cubit.dart';
import 'package:untitled3/home/home_screen.dart';
import 'package:untitled3/screens/flags_first.dart';

import '../components/components.dart';
import '../network/shared_preferencers.dart';
import 'mod.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key});

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
              delay: 0.5,
              child: Text(
                'Choose your country',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(height: 20),
            FadeIn(
              delay: 1.0,
              child: Container(
                width: 200,
                height: 50,
                color: Colors.blue,
                child: const Center(
                  child: FlagMenu(),
                ),
              ),
            ),
            const SizedBox(height: 20),
            FadeIn(
              delay: 1.5,
              child: const Text(
                'Choose your mood',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 20),
            FadeIn(
              delay: 2.0,
              child: Container(
                width: 200,
                height: 50,
                color: Colors.blue,
                child: const Mod(),
              ),
            ),
            const SizedBox(height: 70),
            FadeIn(
              delay: 2.5,
              child: ElevatedButton(
                onPressed: () {
                  if(cub.pathToImage == null){
                    showDialog(context: context, builder: (context)=>const AlertDialog(backgroundColor: Colors.white,content: Text('pleas'),));
                  }else{
                    Save.setBoolData('isFirstTime', true);
                  Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                  builder: (context) =>  HomeScreen(
                    cub ..getNewsSportData()
                      ..getNewsScienceData()
                      ..getNewsHealthData()
                      ..getNewsTechnologyData()
                      ..getNewsEntertainmentData()
                      ..getNewsBusinessData()
                      ..apis('1915e6109adc4f3a8e4e7246b07dd028', '39c145edf6cb4a608c058a17afe26e60', 'b9269ed1c6d8495c9fe0b8c701b51c6b',
                          '928a12e71c184dc8b8cfb085cb16e7ed', 'ffdf74f7a67a456b8d32cb7f6c87a171', '5167789e4b1745ba9062ab58aa152104'),
                  ),
                  ));

                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.blue, // Set the button background color to blue
                ),
                child: Icon(
                  Icons.arrow_circle_right,
                  size: 100,
                ),
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
      duration: Duration(milliseconds: 500),
      reverseDuration: Duration(milliseconds: 300),
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
