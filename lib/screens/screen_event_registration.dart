import 'package:flutter/material.dart';
import 'package:flutter_cmb_meetup/code/meetup.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:url_launcher/url_launcher.dart';

class ScreenEventRegistration extends StatefulWidget {

  Meetup meetup;

  ScreenEventRegistration({@required this.meetup});

  @override
  State<StatefulWidget> createState() {
    return new _ScreenEventRegistrationState();
  }
}

class _ScreenEventRegistrationState extends State<ScreenEventRegistration> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                    margin: const EdgeInsets.all(10.0),
                    child: CachedNetworkImage(
                      imageUrl: widget.meetup.eventLogoUrl,
                      placeholder: Center(
                          child:CircularProgressIndicator()),
                      fadeInCurve: Curves.easeIn,
                      fadeInDuration: Duration(milliseconds: 900),
                    )
                ),
                Container(
                    margin: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          child: Icon(Icons.schedule, color: Colors.blue,),
                          padding: const EdgeInsets.only(right: 4.0),
                        ),
                        Text(
                          widget.meetup.dateTime,
                          style: Theme
                              .of(context)
                              .textTheme
                              .subhead,
                        ),
                      ],
                    )
                ),
                Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          child: Icon(Icons.location_on, color: Colors.blue,),
                          padding: const EdgeInsets.only(right: 3.0),
                        ),
                        Text(
                          widget.meetup.locationName,
                          style: Theme
                              .of(context)
                              .textTheme
                              .subhead,
                        ),
                      ],
                    )
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Container(
                    margin: EdgeInsets.all(20.0),
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)),
                      padding: const EdgeInsets.only(
                          left: 40.0, right: 40.0, top: 20.0, bottom: 20.0),
                      child: Text("Register", style: Theme
                          .of(context)
                          .textTheme
                          .button,),
                      onPressed: () {},
                      color: Theme
                          .of(context)
                          .buttonColor,
                    )
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text("Already registered? Stay tuned for more.",
                          style: Theme
                              .of(context)
                              .textTheme
                              .subhead),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "P.S. keep this app installed for a reward later.",
                          style: Theme
                              .of(context)
                              .textTheme
                              .subtitle,),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Text(
                          "And yes this app was made with Flutter ;)",
                          style: TextStyle(fontSize: 12.0),),
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}