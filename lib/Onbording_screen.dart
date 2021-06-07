import 'package:flutter/material.dart';

void Main() {
  runApp(Onbording_screen());
}

class Onbording_screen extends StatefulWidget {
  @override
  Onbording_screen_State createState() => Onbording_screen_State();
}

class Onbording_screen_State extends State<Onbording_screen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentpage = 0;
  final int _numpage = 3;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numpage; i++) {
      list.add(i == _currentpage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 25.0 : 10.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Color(0xFFABB2B9),
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.4, 0.8, 1, 0.9],
            colors: [
              Color(0xFFD35400),
              Color(0xFF4563DB),
              Color(0xFF5036D5),
              Color(0xFF5B16D0),
            ],
          )),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 45),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                    onPressed: () {},
                    child: Text(
                      "Skip",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
                Container(
                  height: 450,
                  child: PageView(
                    physics: ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentpage = page;
                      });
                    },
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Image(
                                image: AssetImage("images/onboarding1.png"),
                                height: 250,
                                width: 250,
                              ),
                            ),
                            SizedBox(height: 5.0),
                            Text('Connect people\naround the world',
                                style: TextStyle(
                                    fontFamily: 'CM Sans Serif',
                                    fontSize: 25,
                                    height: 1.2,
                                    color: Colors.white)),
                            SizedBox(height: 8.0),
                            Text(
                              'This is online learning platform. Here you are learn diffrent Courses and subject.',
                              style: TextStyle(
                                  fontFamily: 'CM Sans Serif',
                                  fontSize: 18,
                                  height: 1,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Image(
                                image: AssetImage("images/onboarding3.png"),
                                height: 250,
                                width: 250,
                              ),
                            ),
                            SizedBox(height: 30.0),
                            Text('Quation and Answer',
                                style: TextStyle(
                                    fontFamily: 'CM Sans Serif',
                                    fontSize: 25,
                                    height: 1.2,
                                    color: Colors.white)),
                            SizedBox(height: 15.0),
                            Text(
                              'Most common topics on forums include questions, comparisons, polls of opinion, as well as debates.Here  people can do conversation about course related query and doubt.',
                              style: TextStyle(
                                  fontFamily: 'CM Sans Serif',
                                  fontSize: 18,
                                  height: 1,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Image(
                                image: AssetImage("images/onboarding4.png"),
                                height: 250,
                                width: 250,
                              ),
                            ),
                            SizedBox(height: 30.0),
                            Text('Connect people\naround the world',
                                style: TextStyle(
                                    fontFamily: 'CM Sans Serif',
                                    fontSize: 25,
                                    height: 1.2,
                                    color: Colors.white)),
                            SizedBox(height: 15.0),
                            Text(
                              'This is online learning platform. Here you are learn diffrent Courses and subject.',
                              style: TextStyle(
                                  fontFamily: 'CM Sans Serif',
                                  fontSize: 18,
                                  height: 1,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(),
                ),
                _currentpage != _numpage - 1
                    ? Expanded(
                        child: Align(
                        alignment: FractionalOffset.bottomRight,
                        child: FlatButton(
                          onPressed: () {
                            _pageController.nextPage(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.ease);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Next',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 22.0),
                              ),
                              SizedBox(width: 10),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ))
                    : Text(""),
              ],
            ),
          ),
        ),
        bottomSheet: _currentpage == _numpage - 1
            ? Container(
                height: 70,
                width: double.infinity,
                color: Colors.white,
                child: GestureDetector(
                  onTap: (){ Navigator.push(
                        context, MaterialPageRoute(builder: (context) => Onbording_screen()));},
                    child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text(
                      "Let's Start ",
                      style: TextStyle(
                          color: Colors.purple,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )))
            : Text(""));
  }
}
