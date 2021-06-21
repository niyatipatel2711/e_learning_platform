import 'package:e_learning/login_signup/login.dart';
import 'package:e_learning/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'dart:ui';

import 'login_signup/methods.dart';

class DrawerHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Drawer(
      child: Column(
        children: [
          Container(
            height: 225,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50)),
              color: Color(0xFFFF5954),
            ),
            width: double.infinity,
            //padding: EdgeInsets.all(20),
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Container(
                      width: 80,
                      height: 80,
                      margin: EdgeInsets.only(top: 20),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(user!.photoURL.toString()),
                            fit: BoxFit.fill),
                      )),
                      
                  SizedBox(height:5),
                  Text(
                    user.displayName.toString(),
                    //auth.currentUser!.displayName.toString(),
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    user.email.toString(),
                    //auth.currentUser!.email.toString(),
                    // user.email,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text(
              "Profile",
              style: GoogleFonts.poppins(
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Profile()));
            },
          ),
          ListTile(
            leading: Icon(Icons.share),
            title: Text(
              "Share",
              style: GoogleFonts.poppins(
                fontSize: 18,
              ),
            ),
            onTap: () {
              // Share.share(
              //     "Listen this song https://www.youtube.com/watch?v=kJQP7kiw5Fk Most viewed song in the world",
              //     subject: "Despacito Song");
            },
          ),
          ListTile(
            leading: Icon(Icons.arrow_back),
            title: Text(
              "Logout",
              style: GoogleFonts.poppins(
                fontSize: 18,
              ),
            ),
            onTap: () {
              logOut()
                  .whenComplete(() => Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => Login(),
                      ),
                      (route) => false));
            },
          ),
        ],
      ),
    );
  }
}
