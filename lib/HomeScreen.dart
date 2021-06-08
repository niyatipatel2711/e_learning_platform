import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  //  HomeScreen({ Key ? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff4f6fd),
      body: Padding(
        padding: EdgeInsets.only(left: 15, top: 60, right: 15),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Welcome to E-Learn",
                    style: TextStyle(
                        fontSize: 25,
                        fontFamily: "Times and Roman",
                        color: Colors.black),
                  ),
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://previews.123rf.com/images/robuart/robuart1804/robuart180401032/100049635-boy-avatar-in-round-web-button-isolated-on-white-brunet-handsome-guy-in-shirt-with-tie-smiling-schoo.jpg"))),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "What do you \nwant to \nlearn Today ?",
                style: TextStyle(
                    fontSize: 35, fontWeight: FontWeight.w800, height: 1.2),
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
                        width: MediaQuery.of(context).size.width * .4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(height: 20),
                            Courseswidget('MultiMedia', 'Aimation Course',
                                'img1', Color(0xffff6a65), Color(0xff753a88)),
                            SizedBox(height: 20),
                            Courseswidget('programming', 'Flutte Course',
                                'img2', Color(0xff753a88), Color(0xffff5954)),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * .4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // SizedBox(height: 100),
                            Courseswidget('graphic design', 'Autocade Course',
                                'img3', Color(0xff753a88), Color(0xffff5954)),
                            SizedBox(height: 20),
                            Courseswidget(
                                'stock market',
                                'Stock  beginner Course',
                                'img4',
                                Color(0xffff6a65),
                                Color(0xff753a88)),
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
                    onPressed: (){},
                    icon: Icon(
                      Icons.home_filled,
                      color: Color(0xffdc2430),
                      size: 40,
                    ),
                  ),
                  IconButton(
                    onPressed: (){},
                    icon: Icon(
                      Icons.play_circle_filled,
                      color: Color(0xffdc2430).withOpacity(0.5),
                      size: 40,
                    ),
                  ),
                  IconButton(
                    onPressed: (){},
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

  Container Courseswidget(String catagory, String title, String img,
      Color caragotycolor, Color bgColor) {
    return Container(
      padding: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 5),
      decoration: BoxDecoration(
          color: bgColor, borderRadius: BorderRadius.all(Radius.circular(20))),
      child: InkWell(
        onTap: () {
          openCoursePage('$img');
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(25)),
                color: caragotycolor,
              ),
              child: Text('$catagory',
                  style: TextStyle(
                      color: (caragotycolor == Color(0xffe9eefa)
                          ? Color(0xff2657ce)
                          : Colors.white))),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '$title',
              style: TextStyle(
                  fontSize: 20,
                  height: 1,
                  color: (bgColor == Color(0xffff5954)
                      ? Colors.white
                      : Colors.black)),
            ),
            SizedBox(
              height: 10,
            ),
            Hero(
              tag: '$img',
              child: Container(
                height: 80,
                decoration: BoxDecoration(
                    image:
                        DecorationImage(image: AssetImage('images/$img.png'))),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void openCoursePage(String img) {
    Navigator.pushNamed(context, '/CoursePage', arguments: {'img': '$img'});
  }
}
