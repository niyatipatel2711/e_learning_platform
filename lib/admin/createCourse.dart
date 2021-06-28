import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_learning/constants.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateCourse extends StatefulWidget {
  const CreateCourse({Key? key}) : super(key: key);

  @override
  _CreateCourseState createState() => _CreateCourseState();
}

class _CreateCourseState extends State<CreateCourse> {

  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  List<UploadTask> uploadedTask = List.empty();

  List<File> selectedFiles = List.empty();

  uploadFiles(File file){
    UploadTask task = _firebaseStorage.ref().child("videos/${DateTime.now().toString()}").putFile(file); 
    return task;
  } 

  writeVideoUrlToFirebaseStorage(videoUrl){
    _firebaseFirestore.collection("videos").add({"url": videoUrl}).whenComplete(() => print("$videoUrl is saved in firestore."));
  }

  saveVideoUrlToFirebase(UploadTask task){
    task.snapshotEvents.listen((snapShot) { 
      if(snapShot.state == TaskState.success){
        snapShot.ref.getDownloadURL().then((videoUrl) => writeVideoUrlToFirebaseStorage(videoUrl));
      }
    });
  }

  Future<void> retrieveLostData() async {
    
  }

  Future selectFiles() async{
    try{
      FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: true, type: FileType.video);

      if(result!=null){
        selectedFiles.clear();
        result.files.forEach((selectedFile) {
          File file = File('${selectedFile.path}');
          selectedFiles.add(file);
          // PlatformFile file = PlatformFile(name: selectedFile.name, path: selectedFile.path, size: selectedFile.size);
          // selectedFiles.add(file);
        });

        selectedFiles.forEach((file) {
          final UploadTask task  = uploadFiles(file);
          saveVideoUrlToFirebase(task);
          setState(() {
            uploadedTask.add(task);  
          });
         });

      }else{
        print('User has cancelled the selection!');
      }
    }
    catch(e){

    }
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
                    onPressed: () => selectFiles().whenComplete(() => CreateCourse()),
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
                  Center( 
                    child: uploadedTask.length == 0 ? 
                    Text(
                      'No files selected',
                      style: GoogleFonts.poppins(
                        color: darkBlue, 
                        fontSize: 18,
                      ),
                    ) : 
                    ListView.separated(
                      itemBuilder: (context, index) {
                        return StreamBuilder<TaskSnapshot>(
                          builder: (context, snapShot) {
                            return snapShot.connectionState == ConnectionState.waiting ? CircularProgressIndicator() : 
                              snapShot.hasError ? Text('There is some error uploading file.') : snapShot.hasData ? 
                                ListTile(
                                  title: Text("${snapShot.data!.bytesTransferred}/${snapShot.data!.totalBytes} ${snapShot.data!.state == TaskState.success ? 'Completed' : snapShot.data!.state == TaskState.running ? 'In progress' : 'Error'}"),
                                ) : Container();
                          },
                          stream: uploadedTask[index].snapshotEvents,
                        );
                      }, 
                      separatorBuilder: (context, index) => Divider(), 
                      itemCount: uploadedTask.length
                    ),
                  ),
                  SizedBox(height: 30),
                  // ignore: deprecated_member_use
                  RaisedButton(
                    onPressed: () {

                    },
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
