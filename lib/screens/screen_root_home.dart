import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cmb_meetup/code/meetup.dart';
import 'package:flutter_cmb_meetup/screens/screen_presentation.dart';

class ScreenHomeRoot extends StatefulWidget {


  @override
  State<StatefulWidget> createState() {
    return new _ScreenHomeRoot();
  }
}

class _ScreenHomeRoot extends State<ScreenHomeRoot> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream:  Firestore.instance.collection("meetups").where(
          "isEventInProgress", isEqualTo: true).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
        if(snapshot.data!=null){
          if(snapshot.data.documents.length>1){
            return Center(child: Text("More than two events are on"));
          }else if (snapshot.data.documents.length==0){
            return Center(child: Text("HomeScreen"));
          } else if(snapshot.data.documents.length == 1){
            Meetup meetup = Meetup.fromMap(snapshot.data.documents[0].data, snapshot.data.documents[0].documentID);
            return ScreenPresentation(meetup: meetup);
          }
        }else{
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}