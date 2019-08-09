import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_cmb_meetup/code/meetup.dart';
import 'package:flutter_cmb_meetup/screens/screen_event_registration.dart';
import 'package:flutter_cmb_meetup/screens/screen_root_home.dart';

class ScreenRoot extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _ScreenRootState();
  }
}

class _ScreenRootState extends State<ScreenRoot> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
          stream: Firestore.instance.collection("meetups").where(
              "isRegistrationOpen", isEqualTo: true).snapshots(),
          builder: (BuildContext context,
              AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.data != null) {
              if (snapshot.data.documents.length == 1) {
                print("1 Meetup is open for registration");
                //getting the first meetup as the registration meetup.
                Meetup meetup = Meetup.fromMap(
                    snapshot.data.documents[0].data, snapshot.data.documents[0].documentID);
                return ScreenEventRegistration(meetup: meetup);
              } else if (snapshot.data.documents.length > 1) {
                print("More than 1 meetups are open for registration");
                //In the event more than one meetup's registration is open, the user will be guided home.
                return Center(
                    child: Text("More Than One Registrations Open :("));
              } else if (snapshot.data.documents.length == 0) {
                print("No meetups are open for registration");
                //No registrations are open for any meetup, and thus the user will be guided home.
                return ScreenHomeRoot();
              }
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        )
    );
  }
}