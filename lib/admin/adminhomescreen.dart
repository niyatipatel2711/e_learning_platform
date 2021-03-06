import 'package:e_learning/admin/createCourse.dart';
import 'package:e_learning/login_signup/login.dart';
import 'package:e_learning/login_signup/methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'dart:ui';

import '../constants.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({Key? key}) : super(key: key);

  @override
  _AdminHomeScreenState createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {

  var coursetitle = TextEditingController();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tooLightBlue,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.menu,
            color: blue,
          ),
        ),
        actions: [
          // Padding(
          //   padding: EdgeInsets.only(right: 10.0, top: 10, bottom: 10),
          //   child: Container(
          //     height: 35,
          //     width: 100,
          //     // ignore: deprecated_member_use
          //     child: RaisedButton(
          //       textColor: Colors.white,
          //       color: Colors.red,
          //       onPressed: () {
          //         Route route = MaterialPageRoute(builder: (e) => Login());
          //         Navigator.pushReplacement(context, route);
          //       },
          //       child: Text("Logout"),
          //       shape: new RoundedRectangleBorder(
          //         borderRadius: new BorderRadius.circular(10.0),
          //       ),
          //     ),
          //   ),
          // ),
          IconButton(
              onPressed: () {
                
                logOut().whenComplete(
                    () => Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => Login(),
                        ),
                        (route) => false));
              },
              icon: Icon(
                Icons.logout,
                color: blue,
              )),
        ],
      ),
      body: 
      
      Padding(
        
        padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Text(
                "Hello, Admin !",
                style: GoogleFonts.poppins(
                    fontSize: 35,
                    fontWeight: FontWeight.w600,
                    height: 1.2,
                    color: Color(0xff0D1333)),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 6,
                        offset: Offset(0.0, 1.0),
                        color: Colors.blueGrey,
                      )
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        'assets/upload.svg',
                        height: MediaQuery.of(context).size.height * .15,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 30),
                      // ignore: deprecated_member_use
                      RaisedButton(
                        padding: EdgeInsets.only(
                            left: 30, top: 10, right: 20, bottom: 10),
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CreateCourse()));
                        },
                        color: pink,
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(15.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Create Your Course",
                              style: GoogleFonts.poppins(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Your courses",
                style: GoogleFonts.poppins(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    height: 1.2,
                    color: Color(0xff0D1333)),
              ),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              color:
                                  Color(0xff2657ce),
                                  //: Color(0xffd3defa),
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              )),
                          child: Icon(
                            Icons.play_arrow,
                            color:
                                Colors.white,
                                //: Color(0xff2657ce),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(

                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            
                            Text(
                              
                              'Coursetitle',
                              style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: darkBlue),
                            ),
                            Text(
                              'Info',
                              style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.blueGrey),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    Divider(
                      color: lightBlue,
                      thickness: 1,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
