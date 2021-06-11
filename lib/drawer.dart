import 'package:e_learning/HomeScreen.dart';
import 'package:flutter/material.dart';

import 'dart:ui';

class DrawerHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50)),
              color: Color(0xFFFF5954),
            ),
            width: double.infinity,
            padding: EdgeInsets.all(20),
            child: Center(
              child: Column(
                children: [
                  Container(
                      width: 100,
                      height: 100,
                      margin: EdgeInsets.only(top: 25),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage("assets/images/logo1.png"),
                            fit: BoxFit.fill),
                      )),
                  Text(
                    "Raj Bhavani",
                    // _auth.currentUser.displayName,
                    // user.displayName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "Raj@gmail.com",
                    // _auth.currentUser.email,
                    // user.email,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.black,
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
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.share),
            title: Text(
              "Share",
              style: TextStyle(
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
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
