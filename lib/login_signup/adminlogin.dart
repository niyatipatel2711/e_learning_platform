
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:e_learning/admin/adminhomescreen.dart';
import 'package:e_learning/constants.dart';

import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';


class Adminlogin extends StatefulWidget {
  const Adminlogin({Key? key}) : super(key: key);

  @override
  _AdminloginState createState() => _AdminloginState();
}

class _AdminloginState extends State<Adminlogin> {
  final TextEditingController _adminid = TextEditingController();
  final TextEditingController _adminpass = TextEditingController();
  bool isLoading = false;
  bool hidePassword = true;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  loginAdmin() {
    FirebaseFirestore.instance.collection('admins').get().then((snapshot) {
      snapshot.docChanges.forEach((result) {
        if (result.doc["id"] != _adminid.text.trim()) {
          // Scaffold.of(context);
              // ignore: deprecated_member_use
              // .showSnackBar(SnackBar(content: Text(" ID is not correct ")));
          
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
                            crossAxisAlignment: CrossAxisAlignment.center,
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
                                'Login Failed!',
                                style: GoogleFonts.poppins(
                                  fontSize: 20,
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
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
        } else if (result.doc["pass"] != _adminpass.text.trim()) {
          // ignore: deprecated_member_use
          Scaffold.of(context).showSnackBar(
              SnackBar(content: Text(" password is not correct ")));
        } else {
          // ignore: deprecated_member_use
          // Scaffold.of(context).showSnackBar(
          //     SnackBar(content: Text("Welcome to ADMIN  part")));

              setState(() {
                _adminid.text= "" ;
                _adminpass.text ="";
              });

              Route route = MaterialPageRoute(builder: (e)=> AdminHomeScreen());
              Navigator.pushReplacement(context, route);

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
                            crossAxisAlignment: CrossAxisAlignment.center,
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
                                  fontWeight: FontWeight.bold,
                                ),
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
      });
    });
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
                'assets/adminlogin.svg',
                height: 250,
                width: 300,
              )),
              SizedBox(height: 20),
              Text(
                'Login(Admin)',
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
                      controller: _adminid,
                      style: GoogleFonts.poppins(color: blue),
                      decoration: InputDecoration(
                        filled: true,
                        hintText: 'ID',
                        fillColor: Colors.transparent,
                        hintStyle: GoogleFonts.poppins(color: Colors.blueGrey),
                        icon: Icon(
                          Icons.email,
                          color: Colors.blueGrey,
                        ),
                      ),
                      validator: MultiValidator([
                        RequiredValidator(errorText: "Required"),
                      ]),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: _adminpass,
                      obscureText: hidePassword,
                      style: GoogleFonts.poppins(color: blue),
                      decoration: InputDecoration(
                        filled: true,
                        hintText: 'Password',
                        // suffixText: 'Forgot?',
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
                        _adminid.text.isNotEmpty && _adminpass.text.isNotEmpty?
                        loginAdmin():

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
