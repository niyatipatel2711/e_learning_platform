import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';

import 'constants.dart';

class AllVideos extends StatefulWidget {
  const AllVideos({Key? key}) : super(key: key);

  @override
  _AllVideosState createState() => _AllVideosState();
}

class _AllVideosState extends State<AllVideos> {
  CollectionReference ref = FirebaseFirestore.instance.collection('Course');
  // .doc()
  // .collection('digital');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tooLightBlue,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Text(
          "All Videos",
          style: GoogleFonts.poppins(
            color: darkBlue,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new_outlined),
          color: darkBlue,
        ),
      ),

      body: StreamBuilder(
        stream: ref.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            return ListView(
              children: snapshot.data!.docs.map((document) {
                return Column(
                  children: [
                   
                   Text(document['name'],
                  ),
                  // VideoPlayer(document['url']),
                  ]
                );
              }).toList(),
            );
          } else
            return Text('no data ');
        },
      ),

      // body: StreamBuilder(
      //   stream: ref.snapshots(),
      //   builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      //     if (snapshot.hasData) {
      //       return ListView.builder(
      //         itemCount: snapshot.data!.docs.length,
      //         itemBuilder: (context, index) {
      //           var doc = snapshot.data!.docs[index].data;
      //           return ListTile(
      //               title: Text(
      //             doc['name'],
      //             style: TextStyle(color: darkBlue),
      //           ));
      //         },
      //       );
      //     } else
      //       return Text(' ');
      //   },
      // )
    );
  }
}
