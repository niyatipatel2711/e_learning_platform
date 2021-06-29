
import 'dart:io';

import 'package:e_learning/constants.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
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

  File? files;
  File? video;
  List _videos = [];
  _selectFiles() async {
    // final result = await FilePicker.platform.pickFiles(allowMultiple: true, type: FileType.video);
    // if(result != null) {
    //   List<File> file = result.paths.map((path) => File(path!)).toList();
    //   setState(() {
    //     files =  file as File?;
    //   });

    // } else {
    //   // User canceled the pickerr
    // }

    final result = await ImagePicker.platform.pickVideo(source: ImageSource.gallery);
      
      video = File(result!.path);
      // _videos.add(video);
      
    
    

    // files = File(video!.path);
    _videoPlayerController = VideoPlayerController.file(video )
      ..initialize().then((_) {
        setState(() {});
        _videoPlayerController.play();
      });
  }

  Future uploadFiles() async {}

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
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.logout,
                color: blue,
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
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
                  ),
                  SizedBox(height: 30),
                  Text(
                    'What category best fits the course?',
                    style: GoogleFonts.poppins(
                      color: darkBlue,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    style: GoogleFonts.poppins(color: blue),
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      hintText: 'Enter the category of course',
                      hintStyle: GoogleFonts.poppins(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.w300,
                      ),
                      fillColor: Colors.transparent,
                    ),
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
                        // height:250,
                        width: MediaQuery.of(context).size.width * .9,
                        child: Column(children: [
                          if (video != null)

                              _videoPlayerController.value.initialized
                                  ? AspectRatio(
                                      aspectRatio:
                                          _videoPlayerController.value.aspectRatio,
                                      child: VideoPlayer(_videoPlayerController),
                                    )
                                  : Container()
                          // file != null
                          //   // _videoPlayerController.value.initialized
                          //       ? GridView.count(
                          //           crossAxisCount:2,
                          //           children:
                          //               List.generate(file.length, (index) {
                          //             var vid = _videos[index];
                          //             return Container(
                          //               child:Image.file(vid),
                          //                );
                          //           }),
                          //         )
                          //       : Container()
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
                  // ignore: deprecated_member_use
                  RaisedButton(
                    onPressed: () {},
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
