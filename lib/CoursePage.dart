import 'package:flutter/material.dart';

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
      // backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xDDff5954),
        title: Text(
          '$courseTitle',
          style: TextStyle(color: Color(0xff0D1333)),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          color: Color(0xff0D1333),
        ),
      ),

      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                color: Color(0xffFFC341),
              ),
              child: Hero(
                  tag: '$courseImg',
                  child: Container(
                    height: 150,
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                      child: Text(
                        " Free of Cost! ",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                            color: Colors.black),
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      image: DecorationImage(
                          image: AssetImage("assets/images/$courseImg.png")),
                    ),
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Course",
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
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
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "5 Hours, 07 Min",
                        style: TextStyle(color: Colors.black.withOpacity(0.6)),
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: SingleChildScrollView(
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
            SizedBox(
              height: 2,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                color: Colors.black,
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
                  style: TextStyle(
                      fontSize: 25,
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
                    Radius.circular(30),
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
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Text(
                  '$info',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            )
          ],
        ),
        Center(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            width: MediaQuery.of(context).size.width * .70,
            height: 0.7,
            color: Color(0xff2657CE),
          ),
        )
      ],
    );
  }
}
