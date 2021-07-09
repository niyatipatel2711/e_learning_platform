import 'package:e_learning/constants.dart';
import 'package:e_learning/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';
import 'AllVideos.dart';
import 'Drawer.dart';

class HomeScreen extends StatefulWidget {
  //  HomeScreen({ Key ? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String profileURI =
    'https://raw.githubusercontent.com/niyatipatel2711/e_learning_platform/master/assets/images/user.png';

  final user = FirebaseAuth.instance.currentUser;

  _checkForProfile() {
    if (FirebaseAuth.instance.currentUser!.photoURL != null) {
      return true;
    } else {
      return false;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tooLightBlue,
      appBar: AppBar(
        title: Text(
          "Welcome to E-Learning",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            color: blue,
          ),
        ),
        iconTheme: IconThemeData(color: blue),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10.0, top: 10, bottom: 10),
            child: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: _checkForProfile()
                    ? NetworkImage(user!.photoURL.toString())
                    : NetworkImage(profileURI),
                ),
              ),
            ),
          )
        ],
      ),
      drawer: DrawerHome(),
      body: Padding(
        padding: EdgeInsets.only(left: 20, top: 10, right: 20),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                "What do you \nwant to \nlearn Today ?",
                style: GoogleFonts.poppins(
                    fontSize: 35,
                    fontWeight: FontWeight.w600,
                    height: 1.2,
                    color: Color(0xff0D1333)),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * .42,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(height: 20),
                            Courseswidget(
                              'Multimedia', 'Animation Course', 'img1', 
                              Colors.white.withOpacity(0.3),
                              pink),
                            SizedBox(height: 20),
                            Courseswidget('Programming', 'Flutter Course',
                                'img2', transparentGrey.withOpacity(0.3), Colors.white),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * .42,
                        // height: MediaQuery.of(context).size.height*.65,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // SizedBox(height: 100),
                            Courseswidget('Graphic design', 'Autocade Course',
                                'img3', transparentGrey.withOpacity(0.3), Colors.white),
                            SizedBox(height: 20),
                            Courseswidget(
                                'Stock market',
                                'Stock  beginner Course',
                                'img4',
                                transparentGrey.withOpacity(0.3),
                                lightBlue),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.home_filled,
                        color: Color(0xffdc2430),
                        size: 40,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>AllVideos()));

                      },
                      icon: Icon(
                        Icons.play_circle_filled,
                        color: Color(0xffdc2430).withOpacity(0.5),
                        size: 40,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Profile()));
                      },
                      icon: Icon(
                        Icons.account_circle,
                        color: Color(0xffdc2430).withOpacity(0.5),
                        size: 40,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Container Courseswidget(String catagory, String title, String img,
      Color categorycolor, Color bgColor) {
    return Container(
      
      padding: EdgeInsets.only(top:5, left: 5, right: 5, bottom:2.5),
      decoration: BoxDecoration(
          color: bgColor, borderRadius: BorderRadius.all(Radius.circular(20))),
      child: InkWell(
        onTap: () {
          openCoursePage('$img', '$title');
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  color: categorycolor,
                ),
                child: Text('$catagory',
                    style: GoogleFonts.poppins(
                        color: (categorycolor == Colors.white.withOpacity(0.3)
                            ? Colors.white
                            : blue)
                    )
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '$title',
                style: GoogleFonts.poppins(
                    fontSize: 20,
                    height: 1,
                    color: (bgColor == Color(0xffff5954)
                        ? Colors.white
                        : Color(0xff0D1333)),
                    fontWeight: FontWeight.w500,
                )
              ),
              SizedBox(
                height: 10,
              ),
              Hero(
                tag: '$img',
                child: Container(
                  height: 80,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/$img.png'))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void openCoursePage(String img, String title) {
    Navigator.pushNamed(context, '/CoursePage',
        arguments: {'img': '$img', 'title': '$title'});
  }
}
