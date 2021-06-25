import 'package:e_learning/admin/AdminStart.dart';
import 'package:e_learning/HomeScreen.dart';
import 'package:e_learning/constants.dart';
import 'package:e_learning/login_signup/methods.dart';
import 'package:e_learning/login_signup/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:form_field_validator/form_field_validator.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool isLoading = false;
  bool hidePassword = true;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  void validate() {
    if (formkey.currentState!.validate()) {
      print('Validated');
    } else {
      print('Not validated');
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
                'assets/login.svg',
                height: 250,
                width: 300,
              )),
              SizedBox(height: 20),
              Text(
                'Login',
                style: GoogleFonts.poppins(
                  fontSize: 35,
                  color: darkBlue,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 10),
              Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: formkey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _email,
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
                      validator: MultiValidator([
                        RequiredValidator(errorText: "Required"),
                        EmailValidator(errorText: "Enter valid email address"),
                      ]),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: _password,
                      obscureText: hidePassword,
                      style: GoogleFonts.poppins(color: blue),
                      decoration: InputDecoration(
                        filled: true,
                        hintText: 'Password',
                        //suffixText: 'Forgot?',
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              hidePassword = !hidePassword;
                            });
                          },
                          icon: Icon(hidePassword
                              ? Icons.visibility_off
                              : Icons.visibility),
                          color: Colors.blueGrey[300],
                        ),
                        fillColor: Colors.transparent,
                        hintStyle: GoogleFonts.poppins(color: Colors.blueGrey),
                        icon: Icon(
                          Icons.password,
                          color: Colors.blueGrey,
                        ),
                      ),
                      validator: MultiValidator([
                        RequiredValidator(errorText: "Required"),
                        MinLengthValidator(6,
                            errorText: 'Should be atleast 6 characters long.'),
                        MaxLengthValidator(15,
                            errorText: 'Should not exceed 15 characters.')
                      ]),
                    ),
                    SizedBox(height: 40),
                    InkWell(
                      onTap: () {
                        //loginUser(_email.text, _password.text).whenComplete(() => HomePage());
                        if (_email.text.isNotEmpty &&
                            _password.text.isNotEmpty) {
                          setState(() {
                            isLoading = true;
                          });
                          loginUser(_email.text, _password.text).then((user) {
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
                                                    'Login successful!',
                                                    style: GoogleFonts.poppins(
                                                      fontSize: 20,
                                                      color: Colors.green,
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                                              builder: (context) =>
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
                              // print("Login successful");
                            } else {
                              //print("Login failed");
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
                                                    'assets/images/failed.png',
                                                    height: 40,
                                                    width: 40,
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Text(
                                                    'Login failed!',
                                                    style: GoogleFonts.poppins(
                                                      fontSize: 20,
                                                      color: Colors.red,
                                                      fontWeight:
                                                          FontWeight.bold,
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
                          print("Please enter details correctly.");
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
                                    height: 200,
                                    child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Center(
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              // Image.asset('assets/images/failed.png', height: 40, width: 40,),
                                              SizedBox(
                                                height: 20,
                                              ),
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
                                                  child: Text('Ok'))
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
                          'Login',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Text(
                      'Or, login with...',
                      style: GoogleFonts.poppins(
                        color: Colors.blueGrey,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            signInWithGoogle().then((user) {
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
                                          height: 220,
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
                                                      'Login successful!',
                                                      style:
                                                          GoogleFonts.poppins(
                                                        fontSize: 20,
                                                        color: Colors.green,
                                                        fontWeight:
                                                            FontWeight.bold,
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
                                // print("Login successful");
                              } else {
                                //print("Login failed");
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
                                          height: 220,
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
                                                      'Login failed!',
                                                      style:
                                                          GoogleFonts.poppins(
                                                        fontSize: 20,
                                                        color: Colors.red,
                                                        fontWeight:
                                                            FontWeight.bold,
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
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 100,
                                padding: const EdgeInsets.all(8),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(18)),
                                  border: Border.all(color: Colors.blueGrey),
                                ),
                                child: Image.asset(
                                  'assets/images/google.png',
                                  height: 40,
                                  width: 40,
                                ),
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              InkWell(
                                onTap: (){
                                  Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AdminStart()));
                                },
                                child: Container(
                                  width: 100,
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    "I Am Admin",
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      color: blue,
                                      fontWeight: FontWeight.bold,
                                    ),
                                                          
                                  ),
                                
                                ),
                              )
                            ],
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
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'New to e-learning?',
                          style: GoogleFonts.poppins(
                            color: Colors.blueGrey,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(width: 10),
                        InkWell(
                          onTap: () {
                            // Navigator.of(context).pop();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUp()));
                          },
                          child: Text(
                            'Register',
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
