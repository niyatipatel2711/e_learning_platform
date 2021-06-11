import 'package:e_learning/Onbording_screen.dart';
import 'package:e_learning/constants.dart';
import 'package:e_learning/login_signup/methods.dart';
import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  
  const HomePage({ Key? key }) : super(key: key);

  @override
  
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: background,
        child: Center(
          child: ElevatedButton(
            child: Text('Sign out'),
            onPressed: (){
              logOut().whenComplete(() => Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => Onbording_screen(),), (route) => false));
            },
          ),
        ),
      ),
    );
  }
}