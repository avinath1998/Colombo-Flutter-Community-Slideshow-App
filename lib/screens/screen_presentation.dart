import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cmb_meetup/code/presentation.dart';
import 'package:flutter_cmb_meetup/code/meetup.dart';

class ScreenPresentation extends StatefulWidget {

  Meetup meetup;

  ScreenPresentation({@required this.meetup});

  @override
  State<StatefulWidget> createState() {
    return _ScreenPresentationState();
  }
}

class _ScreenPresentationState extends State<ScreenPresentation> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Firestore.instance.collection("meetups").document(widget.meetup.id).collection("presentations").where("active",isEqualTo: true).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
        if(snapshot.hasData){
          if(snapshot.data.documents.length == 0){
            return Center(child: Text("Presentation hasn't started yet."));
          }else if(snapshot.data.documents.length > 1){
            return Center(child:Text("HomeScreen"));
          }else if(snapshot.data.documents.length == 1){
            Presentation presentation = Presentation.fromMap(snapshot.data.documents[0].data);
            return PresentationList(presentation: presentation);
          }
        }else{
          return Center(child: CircularProgressIndicator());
        }
        if(snapshot.hasError){
          return Center(
            child: Text("An error has occured retrieving data, sorry :("),
          );
        }
      },
    );
  }
}

class PresentationList extends StatefulWidget {

  Presentation presentation;

  PresentationList({@required this.presentation});

  @override
  State<StatefulWidget> createState() {
    return _PresentationListState();
  }
}

class _PresentationListState extends State<PresentationList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: widget.presentation.slideshowUrls.length,
        itemBuilder: (BuildContext context, int index){
          return Container(
            margin: const EdgeInsets.all(15.0),
              child: PresentationTile(imageUrl: widget.presentation.slideshowUrls[index].toString()));
        },
      ),
    );
  }
}

class PresentationTile extends StatefulWidget {
  String imageUrl;

  PresentationTile({this.imageUrl});

  @override
  State<StatefulWidget> createState() {
    return _PresentationTileState();
  }
}

class _PresentationTileState extends State<PresentationTile> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}