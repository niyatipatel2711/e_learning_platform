import 'package:e_learning/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CoursePage extends StatefulWidget {
  @override
  _CoursePageState createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  late String courseImg;
  late String courseTitle;
  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    courseImg = arguments["img"];
    courseTitle = arguments["title"];
    return Scaffold(
      backgroundColor: tooLightBlue,
      appBar: AppBar(
        //backgroundColor: Color(0xDDff5954),
        title: Text(
          '$courseTitle',
          style: GoogleFonts.poppins(
            color: blue,
            fontWeight: FontWeight.w500
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new_outlined),
          color: blue,
        ),
      ),

      body: Container(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                color: Color(0xffFFC341),
                boxShadow: [
                        BoxShadow(
                          color: yellow,
                          offset: Offset(0.0, 1.0),
                          blurRadius: 6.0,
                        ),
                      ]
              ),
              child: Hero(
                  tag: '$courseImg',
                  child: Container(
                    height: 150,
                    margin: EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                      // child: Text(
                      //   " Free of Cost! ",
                      //   style: TextStyle(
                      //       fontSize: 20,
                      //       fontWeight: FontWeight.w300,
                      //       color: Colors.black),
                      // ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      image: DecorationImage(
                          image: AssetImage("assets/images/$courseImg.png"),
                      ),
                      
                    ),
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Course details",
                    style: GoogleFonts.poppins(fontSize: 23, fontWeight: FontWeight.w600),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10,),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Color(0xffd3defa),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 35,
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.timer),
                            color: blue,
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          "5 Hours, 07 Min",
                          style: GoogleFonts.poppins(color: blue),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      productListing(
                          'Introduction', 'Introduction of the course', 'active'),
                          
                      productListing('Language of Color',
                          'Learn about the language of..', 'inactive'),
                     
                      productListing('Psychology of Color',
                          'Learn about the psychology of..', 'inactive'),
                      
                      productListing('Language of Color',
                          'Learn about the language of..', 'inactive')
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              // ignore: deprecated_member_use
              child: RaisedButton(
                padding:
                    EdgeInsets.only(left: 50, top: 10, right: 50, bottom: 10),
                onPressed: () {},
                color: Color(0xff2657ce),
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(15.0),
                ),
                child: Text(
                  "Continue",
                  style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Column productListing(String title, String info, String activeOrnot) {
    return Column(
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
                  color: activeOrnot == "active"
                      ? Color(0xff2657ce)
                      : Color(0xffd3defa),
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  )),
              child: Icon(
                Icons.play_arrow,
                color: (activeOrnot == "active")
                    ? Colors.white
                    : Color(0xff2657ce),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$title',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: darkBlue
                  ),
                ),
                Text(
                  '$info',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.blueGrey
                  ),
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
    );
  }
}
