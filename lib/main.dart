import 'package:e_learning/Onbording_screen.dart';
import 'package:e_learning/homepage.dart';
import 'package:e_learning/signup.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login.dart';

int? isViewed;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isViewed = prefs.getInt('onBoard');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{

  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: Duration(seconds: 2));

    _animation = Tween(
      begin: 0.0,
      end: 1.0
    ).animate(_animationController);

    _animationController.forward();

    _animation.addStatusListener((status) {
      if(status == AnimationStatus.completed){
        isViewed!=0 ? Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Onbording_screen())) : 
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));
      }
      else if(status == AnimationStatus.dismissed){
        _animationController.forward();
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
    child: Center(
      child: FadeTransition(
        opacity: _animation,
        child: Image.asset('assets/images/logo1.png', height: 350, width: 350,),
      )
    ),
        ),
      );
  }
}