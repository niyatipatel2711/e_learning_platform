import 'package:e_learning/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'HomeScreen.dart';

class AdminStart extends StatefulWidget {
  const AdminStart({ Key? key }) : super(key: key);

  @override
  _AdminStartState createState() => _AdminStartState();
}

class _AdminStartState extends State<AdminStart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: blue,),
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
          },
        ),
      ),
      body: SingleChildScrollView(
              child: Container(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                SvgPicture.asset('assets/tutor.svg', height: 280, width: 280),
                SizedBox(height: 30),
                Text(
                  'Start Tutoring',
                  style: GoogleFonts.poppins(
                    fontSize: 35,
                    fontWeight: FontWeight.w600,
                    height: 1.2,
                    color: darkBlue,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height:20),
                Text(
                  'Become an instructor and change lives - including your own.',
                  style: GoogleFonts.poppins(
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                    color: darkBlue
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 40),
                InkWell(
                  onTap: () {},
                                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                            ),
                            // ignore: deprecated_member_use
                            child: RaisedButton(
                              padding:
                                  EdgeInsets.only(left: 30, top: 10, right: 20, bottom: 10),
                              onPressed: () {},
                              color: Color(0xff2657ce),
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(15.0),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Continue",
                                    style: GoogleFonts.poppins(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  SizedBox(width: 5),
                                  Icon(Icons.arrow_forward_ios_outlined, color: Colors.white),
                                ],
                              ),
                            ),
                           
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}