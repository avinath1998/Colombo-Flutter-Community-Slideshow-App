class Meetup{
  String _title;
  String _dateTime;
  String _description;
  String _locationLat;
  String _locationLong;
  String _locationName;
  bool _isRegistrationsOpen;
  bool _isEventInProgress;
  String _eventLogoUrl;
  String _id;


  String get id => _id;

  set id(String value) {
    _id = value;
  }

  String get eventLogoUrl => _eventLogoUrl;

  set eventLogoUrl(String value) {
    _eventLogoUrl = value;
  }

  bool get isRegistrationsOpen => _isRegistrationsOpen;

  set isRegistrationsOpen(bool value) {
    _isRegistrationsOpen = value;
  }

  String get title => _title;

  set title(String value) {
    _title = value;
  }

  String get dateTime => _dateTime;

  String get locationName => _locationName;

  set locationName(String value) {
    _locationName = value;
  }

  String get locationLong => _locationLong;

  set locationLong(String value) {
    _locationLong = value;
  }

  String get locationLat => _locationLat;

  set locationLat(String value) {
    _locationLat = value;
  }

  String get description => _description;

  set description(String value) {
    _description = value;
  }

  set dateTime(String value) {
    _dateTime = value;
  }

  static Meetup fromMap(Map<String, dynamic> map, String id){
    Meetup meetup = new Meetup();
    meetup.title = map['title'];
    meetup.description = map['description'];
    meetup.dateTime = map['dateTime'];
    meetup.locationLat = map['locationLat'];
    meetup.locationLong = map['locationLong'];
    meetup.locationName = map['locationName'];
    meetup.isEventInProgress = map['isEventInProgress'];
    meetup.isRegistrationsOpen = map['isRegistrationOpen'];
    meetup.eventLogoUrl = map['eventLogoUrl'];
    meetup.id = id;
    return meetup;
  }

  bool get isEventInProgress => _isEventInProgress;

  set isEventInProgress(bool value) {
    _isEventInProgress = value;
  }


}