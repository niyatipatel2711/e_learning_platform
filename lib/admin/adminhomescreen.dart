import 'package:e_learning/login_signup/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';

import '../constants.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({Key? key}) : super(key: key);

  @override
  _AdminHomeScreenState createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tooLightBlue,
      appBar: AppBar(
        title: Text("Admin Home",style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            color: blue,
          ),),
          // backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10.0, top: 10, bottom: 10),
            child: Container(
              height: 35,
              width: 100,
              child: RaisedButton(
                textColor: Colors.white,
                  color: Colors.red,
                onPressed: () {Route route = MaterialPageRoute(builder: (e)=> Login());
              Navigator.pushReplacement(context, route);},
                child: Text("Logout"),
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
