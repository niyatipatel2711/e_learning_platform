import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_learning/admin/adminhomescreen.dart';
import 'package:e_learning/constants.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import 'dart:ui';

class CreateCourse extends StatefulWidget {
  const CreateCourse({Key? key}) : super(key: key);

  @override
  _CreateCourseState createState() => _CreateCourseState();
}

class _CreateCourseState extends State<CreateCourse> {
  late VideoPlayerController _videoPlayerController;

  var coursetitle = TextEditingController();
  var videoName = TextEditingController();

  bool isuploading = false;

  File? files;
  File? video;

  List<String?> videos = [];
  final firestoreInstance = FirebaseFirestore.instance;

  void _selectFiles() async {
    final result =
        await ImagePicker.platform.pickVideo(source: ImageSource.gallery);
    video = File(result!.path);
    videos.add(result.path);
    // _videos.add(video);
    // files = File(video!.path);
    _videoPlayerController = VideoPlayerController.file(video!)
      ..initialize().then((_) {
        setState(() {});
        _videoPlayerController.play();
      });
  }

  void handleSubmit() {
    // if (videoName.text.isNotEmpty && coursetitle.text.isNotEmpty) {
    setState(() {
      _videoPlayerController.pause();
      isuploading = true;
    });
    uploadFiles();
    // }
  }

  Future uploadFiles() async {
    try {
      if (videoName.text.isNotEmpty &&
          coursetitle.text.isNotEmpty &&
          video.toString().isNotEmpty) {

        String _coursetitle = coursetitle.text;
        String _videoName = videoName.text;

        // final Reference firebaseStorageRef =
        //     FirebaseStorage.instance.ref().child('$_coursetitle');
        // // var timekey = new DateTime.now();
        // final UploadTask task = firebaseStorageRef
        //     .child('$_videoName'.toString() + ".mp4")
        //     .putFile(video!);
        
        firestoreInstance
            .collection("Course")
            .doc()
            .collection('$_coursetitle')
            .add({
          "name": _videoName,
          "url": video.toString(),
        }).then((value) {
          print(value.id);
        });

        gotoAdmin();
      } else {
        Fluttertoast.showToast(
            msg: " Please , Fill all detail",
            // toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            // timeInSecForIosWeb: 1,
            backgroundColor: Colors.blue,
            textColor: Colors.white,
            fontSize: 15.0);

        setState(() {
          isuploading = false;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  void gotoAdmin() {
    Navigator.pop(context);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => AdminHomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tooLightBlue,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Image.asset(
          'assets/images/logo1.png',
          height: 40,
        ),
        actions: [

          // IconButton(
          //     onPressed: () {
                
          //     },
          //     icon: Icon(
          //       Icons.logout,
          //       color: blue,
          //     )),

        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          // height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'What\'s the name of your course?',
                    style: GoogleFonts.poppins(
                      color: darkBlue,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: coursetitle,
                    style: GoogleFonts.poppins(color: blue),
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      hintText: 'Enter the title of course',
                      hintStyle: GoogleFonts.poppins(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.w300,
                      ),
                      fillColor: Colors.transparent,
                    ),
                    validator: MultiValidator(
                        [RequiredValidator(errorText: "Required")]),
                  ),
                  SizedBox(height: 30),
                  Text(
                    'What\'s the name of your video?',
                    style: GoogleFonts.poppins(
                      color: darkBlue,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: videoName,
                    style: GoogleFonts.poppins(color: blue),
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      hintText: 'Enter the name of video',
                      hintStyle: GoogleFonts.poppins(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.w300,
                      ),
                      fillColor: Colors.transparent,
                    ),
                    validator: MultiValidator(
                        [RequiredValidator(errorText: "Required")]),
                  ),
                  SizedBox(height: 30),
                  Text(
                    'Now start adding videos!',
                    style: GoogleFonts.poppins(
                      color: darkBlue,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 30),
                  // ignore: deprecated_member_use
                  RaisedButton(
                    onPressed: () {
                      _selectFiles();
                    },
                    padding: const EdgeInsets.all(15),
                    color: blue,
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(15.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Select videos",
                          style: GoogleFonts.poppins(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        SizedBox(width: 10),
                        Icon(Icons.attach_file, color: Colors.white),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          if (_videoPlayerController.value.isPlaying) {
                            _videoPlayerController.pause();
                          } else {
                            _videoPlayerController.play();
                          }
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * .9,
                        child: Column(children: [
                          if (video != null)
                            _videoPlayerController.value.isInitialized
                                ? AspectRatio(
                                    aspectRatio: _videoPlayerController
                                        .value.aspectRatio,
                                    child: VideoPlayer(_videoPlayerController),
                                  )
                                : Container()
                          else
                            Text(
                              'No files selected',
                              style: GoogleFonts.poppins(
                                color: darkBlue,
                                fontSize: 18,
                              ),
                            ),
                        ]),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  isuploading ? LinearProgressIndicator() : Text(""),
                  // ignore: deprecated_member_use
                  RaisedButton(
                    onPressed: isuploading ? null : () => handleSubmit(),
                    padding: const EdgeInsets.all(15),
                    color: lightBlue,
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(15.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Upload videos",
                          style: GoogleFonts.poppins(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: blue),
                        ),
                        SizedBox(width: 10),
                        Icon(
                          Icons.upload,
                          color: blue,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
