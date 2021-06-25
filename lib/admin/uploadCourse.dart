import 'dart:io' show File;
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import 'package:file_picker/file_picker.dart';
import '../constants.dart';

class uploadCourse extends StatefulWidget {
  const uploadCourse({Key? key}) : super(key: key);

  @override
  _uploadCourseState createState() => _uploadCourseState();
}

class _uploadCourseState extends State<uploadCourse> {
  File? _video;
  VideoPlayerController? _videoPlayerController;

  _getVideo() async {
    // final picker = ImagePicker();
    FilePickerResult? pickedFile =
        await FilePicker.platform.pickFiles(allowMultiple: true,type: FileType.custom,allowedExtensions: ['mp4']);

      _video = pickedFile as File;
  //   if (pickedFile != null) {
  //     PlatformFile file = pickedFile.files.first;

  //     print(file.name);
  //  print(file.bytes);
  //  print(file.size);
  //  print(file.extension);
  //  print(file.path);

  //   Uint8List? fileBytes = pickedFile.files.first.bytes;
  //   String fileName = pickedFile.files.first.name;
  // }


    _videoPlayerController = VideoPlayerController.file(_video)
      ..initialize().then((_) {
        setState(() {});
        _videoPlayerController?.pause();
      }); // imageFile = File(pickedFile.path);
    // setState(() {
    //   _video = File(pickedFile.toString());
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tooLightBlue,
      appBar: AppBar(
        title: Text(
          "upload Course",
          style: GoogleFonts.poppins(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Form(
                  child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 6,
                              offset: Offset(0.0, 1.0),
                              color: Colors.grey,
                            )
                          ]),
                      child: Row(
                        children: [
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: TextFormField(
                                style: GoogleFonts.poppins(color: blue),
                                decoration: InputDecoration(
                                  filled: true,
                                  labelText: 'Course Title',
                                  fillColor: Colors.transparent,
                                  icon: Icon(Icons.title_rounded),
                                  hintStyle:
                                      GoogleFonts.poppins(color: darkBlue),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * .9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Column(
                      children: [
                        if (_video != null)
                          _videoPlayerController!.value.initialized
                              ? AspectRatio(
                                  aspectRatio:
                                      _videoPlayerController!.value.aspectRatio,
                                  child: VideoPlayer(_videoPlayerController),
                                )
                              : Container()
                        else
                          Text("select a video "),
                        FlatButton(
                          color: Colors.green,
                          onPressed: () {
                            _getVideo();
                          },
                          child: Text("Pick Video"),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: RaisedButton(
                        padding: EdgeInsets.only(
                            left: 50, top: 10, right: 50, bottom: 10),
                        onPressed: () {},
                        color: Color(0xff2657ce),
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(15.0),
                        ),
                        child: Text(
                          "Submit",
                          style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
