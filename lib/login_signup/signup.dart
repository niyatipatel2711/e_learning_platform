import 'package:e_learning/HomeScreen.dart';
import 'package:e_learning/constants.dart';
import 'package:e_learning/login_signup/login.dart';
import 'package:e_learning/login_signup/methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';

import '../homepage.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool isLoading = false;
  bool isLoggedIn = false;

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  void validate() {
    if (formkey.currentState!.validate()) {
      print('Validated');
    } else {
      print('Not validated');
    }
  }

  String validatePass(value) {
    if (value.isEmpty) {
      return "Required";
    } else if (value.length < 6) {
      return "Password must be alteast 6 characters long";
    } else if (value.length > 15) {
      return "Password must not be more than 15 characters";
    } else {
      return " ";
    }
  }

  String validateName(value) {
    if (value.isEmpty) {
      return "Required";
    } else {
      return " ";
    }
  }

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
                      GestureDetector(
                        onTap: () =>
                            signInWithGoogle().whenComplete(() => HomeScreen()),
                        child: Container(
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
                      ),
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
                  Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    key: formkey,
                    child: Column(
                      children: [
                        TextFormField(
                          validator: RequiredValidator(errorText: 'Required'),
                          controller: _name,
                          style: GoogleFonts.poppins(color: blue),
                          decoration: InputDecoration(
                            filled: true,
                            hintText: 'Full name',
                            fillColor: Colors.transparent,
                            hintStyle:
                                GoogleFonts.poppins(color: Colors.blueGrey),
                            icon: Icon(
                              Icons.person,
                              color: Colors.blueGrey,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: _email,
                          validator: MultiValidator([
                            RequiredValidator(errorText: "Required"),
                            EmailValidator(
                                errorText: "Enter valid email address"),
                          ]),
                          keyboardType: TextInputType.emailAddress,
                          style: GoogleFonts.poppins(color: blue),
                          decoration: InputDecoration(
                            filled: true,
                            hintText: 'Email',
                            fillColor: Colors.transparent,
                            hintStyle:
                                GoogleFonts.poppins(color: Colors.blueGrey),
                            icon: Icon(
                              Icons.email,
                              color: Colors.blueGrey,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: _password,
                          obscureText: true,
                          validator: MultiValidator([
                            RequiredValidator(errorText: "Required"),
                            MinLengthValidator(6,
                                errorText:
                                    'Should be atleast 6 characters long.'),
                            MaxLengthValidator(15,
                                errorText: 'Should not exceed 15 characters.')
                          ]),
                          style: GoogleFonts.poppins(color: blue),
                          decoration: InputDecoration(
                            filled: true,
                            hintText: 'Password',
                            suffixText: 'Forgot?',
                            fillColor: Colors.transparent,
                            hintStyle:
                                GoogleFonts.poppins(color: Colors.blueGrey),
                            icon: Icon(
                              Icons.password,
                              color: Colors.blueGrey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  GestureDetector(
                    onTap: () {
                      //SignUpUser(_name.text, _email.text, _password.text).whenComplete(() => HomePage());
                      if (_name.text.isNotEmpty &&
                          _email.text.isNotEmpty &&
                          _password.text.isNotEmpty) {
                        setState(() {
                          isLoggedIn= true;
                        });

                        SignUpUser(_name.text, _email.text, _password.text)
                            .then((user) async {
                          if (user != null) {
                            setState(() {
                              isLoading = false;
                            });
                            showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (BuildContext context) {
                                  return Dialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(32),
                                      ),
                                    ),
                                    elevation: 8,
                                    child: Container(
                                      height: 230,
                                      child: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Center(
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                  'assets/images/loginSuccess.png',
                                                  height: 40,
                                                  width: 40,
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Text(
                                                  'Sign up successful!',
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 20,
                                                    color: Colors.green,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                SizedBox(height: 20),
                                                ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                      Navigator.pushReplacement(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder:
                                                                (context) =>
                                                                    HomeScreen(),
                                                          ));
                                                    },
                                                    child: Text('Ok'))
                                              ]),
                                        ),
                                      ),
                                    ),
                                  );
                                });
                            //print("Sign up successful");
                          } else {
                            //print("Sign up failed");
                            setState(() {
                              isLoggedIn = false;
                            });
                            showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (BuildContext context) {
                                  return Dialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(32),
                                      ),
                                    ),
                                    elevation: 8,
                                    child: Container(
                                      height: 230,
                                      child: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Center(
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                  'assets/images/failed.png',
                                                  height: 40,
                                                  width: 40,
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Text(
                                                  'Sign up failed!',
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 20,
                                                    color: Colors.red,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                SizedBox(height: 20),
                                                ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Text('Retry'))
                                              ]),
                                        ),
                                      ),
                                    ),
                                  );
                                });
                          }
                        });
                      } else {
                        print("Please enter fields.");
                        showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (BuildContext context){
                              return Dialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(32),),
                                ),
                                elevation: 8,
                                child: Container(
                                  height: 200,
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Center(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          // Image.asset('assets/images/failed.png', height: 40, width: 40,),
                                          SizedBox(height: 20,),
                                          Text(
                                            'Please enter details correctly!',
                                            style: GoogleFonts.poppins(
                                              fontSize: 18,
                                              color: Colors.red,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(height: 20),
                                          ElevatedButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            }, 
                                            child: Text('Ok')
                                          )
                                      ]),
                                    ),
                                  ),
                                ),
                              );
                            });
                      }
                    },
                    child: Container(
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
