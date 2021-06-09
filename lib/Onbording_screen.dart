import 'dart:io';

import 'package:e_learning/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
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

  _storeOnBoardInfo() async {
    int isViewed = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance(); 
    await prefs.setInt('onBoard', isViewed);
  }

  @override
  Widget build(BuildContext context) {

    Future<bool> _onBackPressed(){
      exit(0);
    }

    return WillPopScope(
      onWillPop: () => _onBackPressed(),
          child: Scaffold(
          body: Container(
            height: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xFFFF5954),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 25),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    alignment: Alignment.centerRight,
                    child: FlatButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ));
                      },
                      child: Text(
                        _currentpage == _numpage - 1 ? " " : "Skip",
                        style: GoogleFonts.didactGothic(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Container(
                    height: 550,
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
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Center(
                                child: SvgPicture.asset('assets/connect.svg',
                                    height: 300, width: 300),
                              ),
                              SizedBox(height: 20.0),
                              Text(
                                'Connect people around the world',
                                style: GoogleFonts.didactGothic(
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                'This is online learning platform. Here you will learn diffrent courses and subject.',
                                style: GoogleFonts.didactGothic(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Center(
                                child: SvgPicture.asset('assets/queans.svg',
                                    height: 300, width: 300),
                              ),
                              SizedBox(height: 20.0),
                              Text(
                                'Q & A',
                                style: GoogleFonts.didactGothic(
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                'Most common topics on forums include questions, comparisons, polls of opinion, as well as debates.Here  people can do conversation about course related queries and doubts.',
                                style: GoogleFonts.didactGothic(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Center(
                                child: SvgPicture.asset('assets/enroll.svg',
                                    height: 300, width: 300),
                              ),
                              SizedBox(height: 20.0),
                              Text(
                                'Enroll in high quality courses',
                                style: GoogleFonts.didactGothic(
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                'Students can explore any course published on YouTube and they can enroll any courses they prefer.',
                                style: GoogleFonts.didactGothic(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _buildPageIndicator(),
                  ),
                  _currentpage != _numpage - 1
                      ? Expanded(
                          child: Align(
                          alignment: FractionalOffset.bottomRight,
                          child: FlatButton(
                            onPressed: () async {
                              await _storeOnBoardInfo();
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
                                  style: GoogleFonts.didactGothic(
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
              ? InkWell(
                  onTap: () async {
                    await _storeOnBoardInfo();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ));
                  },
                  child: Container(
                      padding: EdgeInsets.all(5),
                      height: 50,
                      width: double.infinity,
                      color: Colors.transparent,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Get started",
                              style: GoogleFonts.didactGothic(
                                  color: Color(0xFF2657CE),
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 10),
                            Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: Color(0xFF2657CE),
                            )
                          ],
                        ),
                      )),
                )
              : Text("")),
    );
  }
}
