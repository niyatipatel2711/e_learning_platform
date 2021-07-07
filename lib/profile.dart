import 'package:e_learning/admin/adminhomescreen.dart';
import 'package:e_learning/login_signup/adminlogin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';

import 'admin/AdminStart.dart';
import 'HomeScreen.dart';
import 'constants.dart';
import 'main.dart';

//final user = FirebaseAuth.instance.currentUser;
//https://firebase.google.com/docs/auth/unity/manage-users

String profileURI =
    'https://raw.githubusercontent.com/niyatipatel2711/e_learning_platform/master/assets/images/user.png';

String? email;
String? photoURL;

_checkForProfile() {
  if (FirebaseAuth.instance.currentUser!.photoURL != null) {
    return true;
  } else {
    return false;
  }
}

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController _name = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _confirmPassword = TextEditingController();
  bool hidePassword = true;
  bool hidePassword1 = true;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  // var email = FirebaseAuth.instance.currentUser!.email.toString();
  // var photoURL = FirebaseAuth.instance.currentUser!.photoURL.toString();

  String dispalyName =
      FirebaseAuth.instance.currentUser!.displayName.toString();
  //String _email = user!.email.toString();

  _onBackPressed() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomeScreen()));
  }

  @override
  void initState() {
    email = FirebaseAuth.instance.currentUser!.email.toString();
    photoURL = FirebaseAuth.instance.currentUser!.photoURL.toString();

    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onBackPressed(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Profile',
            style: GoogleFonts.poppins(
              color: blue,
            ),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: blue,
            ),
            onPressed: () => _onBackPressed(),
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: formkey,
            child: Column(
              children: [
                ProfilePic(),
                SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    if (hasViewed != 0) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AdminStart()));
                    } else {
                      if (FirebaseAuth.instance.currentUser == null) {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Adminlogin()),
                            (route) => false);
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AdminHomeScreen()));
                      }
                    }
                  },
                  child: Text(
                    'Become an instructor',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      color: blue,
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0),
                  child: Container(
                    height: 100,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(22)),
                        color: lightBlue,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 6,
                            offset: Offset(0.0, 1.0),
                            color: lightBlue,
                          )
                        ]),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/username.png',
                          height: 30,
                          width: 30,
                        ),
                        SizedBox(width: 20),
                        Flexible(
                          child: TextFormField(
                            controller: _name,
                            validator: RequiredValidator(errorText: 'Required'),
                            // initialValue: user!.displayName.toString(),
                            style: GoogleFonts.poppins(color: blue),
                            decoration: InputDecoration(
                              filled: true,
                              hintText: 'Username',
                              fillColor: Colors.transparent,
                              hintStyle: GoogleFonts.poppins(color: darkBlue),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0),
                  child: Container(
                    height: 80,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(22)),
                        color: lightBlue,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 6,
                            offset: Offset(0.0, 1.0),
                            color: lightBlue,
                          )
                        ]),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/email.png',
                          height: 30,
                          width: 30,
                        ),
                        SizedBox(width: 20),
                        Flexible(
                          child: TextFormField(
                            readOnly: true,
                            initialValue: email,
                            style: GoogleFonts.poppins(color: blue),
                            decoration: InputDecoration(
                              filled: true,
                              hintText: 'Email',
                              fillColor: Colors.transparent,
                              hintStyle: GoogleFonts.poppins(color: darkBlue),
                            ),
                            validator: MultiValidator([
                              RequiredValidator(errorText: "Required"),
                              EmailValidator(
                                  errorText: "Enter valid email address"),
                            ]),
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0),
                  child: Container(
                    height: 100,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(22)),
                        color: lightBlue,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 6,
                            offset: Offset(0.0, 1.0),
                            color: lightBlue,
                          )
                        ]),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/pass.png',
                          height: 30,
                          width: 30,
                        ),
                        SizedBox(width: 20),
                        Flexible(
                          child: TextFormField(
                            controller: _password,
                            obscureText: hidePassword,
                            style: GoogleFonts.poppins(color: blue),
                            decoration: InputDecoration(
                              filled: true,
                              hintText: 'New password',
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    hidePassword = !hidePassword;
                                  });
                                },
                                icon: Icon(hidePassword
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                                color: pink.withOpacity(0.5),
                              ),
                              fillColor: Colors.transparent,
                              hintStyle: GoogleFonts.poppins(color: darkBlue),
                            ),
                            validator: MultiValidator([
                              RequiredValidator(errorText: "Required"),
                              MinLengthValidator(6,
                                  errorText:
                                      'Should be atleast 6 characters long.'),
                              MaxLengthValidator(15,
                                  errorText:
                                      'Should not exceed 15 characters.'),
                              PatternValidator(r'(?=.*?[#?!@$%^&*-])',
                                  errorText:
                                      'passwords must have at least one special character'),
                            ]),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0),
                  child: Container(
                    height: 100,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(22)),
                        color: lightBlue,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 6,
                            offset: Offset(0.0, 1.0),
                            color: lightBlue,
                          )
                        ]),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/confirmpass.png',
                          height: 30,
                          width: 30,
                        ),
                        SizedBox(width: 20),
                        Flexible(
                          child: TextFormField(
                            controller: _confirmPassword,
                            obscureText: hidePassword1,
                            style: GoogleFonts.poppins(color: blue),
                            decoration: InputDecoration(
                              filled: true,
                              hintText: 'Confirm password',
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    hidePassword1 = !hidePassword1;
                                  });
                                },
                                icon: Icon(hidePassword1
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                                color: pink.withOpacity(0.5),
                              ),
                              fillColor: Colors.transparent,
                              hintStyle: GoogleFonts.poppins(color: darkBlue),
                            ),
                            validator: (val) => MatchValidator(
                                    errorText: 'Passwords do not match')
                                .validateMatch(
                                    _confirmPassword.text, _password.text),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ConstrainedBox(
                    constraints:
                        BoxConstraints.tightFor(width: 200, height: 50),
                    child: ElevatedButton(
                        onPressed: () {
                          if (_name.text.trim() != dispalyName ||
                              _confirmPassword.text.trim().isNotEmpty) {
                            FirebaseAuth.instance.currentUser!
                                .updateDisplayName(_name.text);
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
                                      height: 240,
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
                                                  'User profile has been updated!',
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 20,
                                                    color: Colors.green,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                                SizedBox(height: 20),
                                                ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                      FirebaseAuth
                                                          .instance.currentUser!
                                                          .reload();
                                                      setState(() {
                                                        // _name.text = FirebaseAuth.instance.currentUser!.displayName.toString();
                                                        photoURL = FirebaseAuth
                                                            .instance
                                                            .currentUser!
                                                            .photoURL
                                                            .toString();
                                                        email = FirebaseAuth
                                                            .instance
                                                            .currentUser!
                                                            .email
                                                            .toString();
                                                      });
                                                    },
                                                    child: Text('Ok'))
                                              ]),
                                        ),
                                      ),
                                    ),
                                  );
                                });
                          }
                          else if(_confirmPassword.text.trim().isNotEmpty){
                            FirebaseAuth.instance.currentUser!
                                .updatePassword(_confirmPassword.text);
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
                                      height: 240,
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
                                                  'User profile has been updated!',
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 20,
                                                    color: Colors.green,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                                SizedBox(height: 20),
                                                ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                      FirebaseAuth
                                                          .instance.currentUser!
                                                          .reload();
                                                      setState(() {
                                                        // _name.text = FirebaseAuth.instance.currentUser!.displayName.toString();
                                                        photoURL = FirebaseAuth
                                                            .instance
                                                            .currentUser!
                                                            .photoURL
                                                            .toString();
                                                        email = FirebaseAuth
                                                            .instance
                                                            .currentUser!
                                                            .email
                                                            .toString();
                                                      });
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
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(blue),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          )),
                        ),
                        child: Text(
                          'Update',
                          style: GoogleFonts.poppins(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125,
      width: 125,
      child: Stack(clipBehavior: Clip.none, fit: StackFit.expand, children: [
        CircleAvatar(
          //backgroundImage: NetworkImage(user!.photoURL.toString(),),
          backgroundImage: _checkForProfile()
              ? NetworkImage(photoURL!)
              : NetworkImage(profileURI),
          backgroundColor: Colors.transparent,
        ),
      ]),
    );
  }
}
