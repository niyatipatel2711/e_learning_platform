import 'package:e_learning/constants.dart';
import 'package:e_learning/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBlue,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 40),
              Center(
                  child: SvgPicture.asset(
                'assets/signup.svg',
                height: 250,
                width: 300,
              )),
              SizedBox(height: 10),
              Text(
                'Sign up',
                style: GoogleFonts.poppins(
                  fontSize: 35,
                  color: darkBlue,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 30),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        width: 100,
                        padding: const EdgeInsets.all(8),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(18)),
                          border: Border.all(color: Colors.blueGrey),
                        ),
                        child: Image.asset(
                          'assets/images/google.png',
                          height: 40,
                          width: 40,
                        ),
                      ),
                      // Container(
                      //   width: 100,
                      //   padding: const EdgeInsets.all(8),
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.all(Radius.circular(18)),
                      //     border: Border.all(color: Colors.blueGrey),
                      //   ),
                      //   child: Image.asset('assets/images/facebook.png',
                      //       height: 40, width: 40),
                      // ),
                      // Container(
                      //   width: 100,
                      //   padding: const EdgeInsets.all(8),
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.all(Radius.circular(18)),
                      //     border: Border.all(color: Colors.blueGrey),
                      //   ),
                      //   child: Image.asset('assets/images/apple.png',
                      //       height: 40, width: 40),
                      // ),
                    ],
                  ),
                  SizedBox(height: 25),
                  Text(
                    'Or, register with email...',
                    style: GoogleFonts.poppins(
                      color: Colors.blueGrey,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 25),
                  TextField(
                    style: GoogleFonts.poppins(color: blue),
                    decoration: InputDecoration(
                      filled: true,
                      hintText: 'Email',
                      fillColor: Colors.transparent,
                      hintStyle: GoogleFonts.poppins(color: Colors.blueGrey),
                      icon: Icon(
                        Icons.email,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    style: GoogleFonts.poppins(color: blue),
                    decoration: InputDecoration(
                      filled: true,
                      hintText: 'Password',
                      suffixText: 'Forgot?',
                      fillColor: Colors.transparent,
                      hintStyle: GoogleFonts.poppins(color: Colors.blueGrey),
                      icon: Icon(
                        Icons.password,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    style: GoogleFonts.poppins(color: blue),
                    decoration: InputDecoration(
                      filled: true,
                      hintText: 'Full name',
                      fillColor: Colors.transparent,
                      hintStyle: GoogleFonts.poppins(color: Colors.blueGrey),
                      icon: Icon(
                        Icons.person,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    style: GoogleFonts.poppins(color: blue),
                    decoration: InputDecoration(
                      filled: true,
                      hintText: 'Company name',
                      fillColor: Colors.transparent,
                      hintStyle: GoogleFonts.poppins(color: Colors.blueGrey),
                      icon: Icon(
                        Icons.home_work,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    height: 50,
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: blue,
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    child: Text(
                      'Sign up',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: GoogleFonts.poppins(
                          color: Colors.blueGrey,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(width: 10),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) => Login()));
                        },
                        child: Text(
                          'Login',
                          style: GoogleFonts.poppins(
                              color: blue,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
