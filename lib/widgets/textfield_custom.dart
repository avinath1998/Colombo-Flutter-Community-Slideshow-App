import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TextFieldCustom extends StatefulWidget {

  String label;
  IconData icon;
  bool obsText;
  bool enabled;
  FormFieldValidator<String> validator;
  FormFieldSetter<String> onSaved;
  Color color;
  String defaultText;
  TextEditingController controller;

  TextFieldCustom(
      {
        Key key,
        this.icon,
        @required this.label,
        @required this.obsText,
        this.enabled,
        this.color,
        this.defaultText,
        this.controller,
        @required this.validator,
        @required this.onSaved,
      }) :super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new TextFieldCustomState();
  }
}

class TextFieldCustomState extends State<TextFieldCustom> {

  @override
  Widget build(BuildContext context) {
    return
      Container(
        margin: new EdgeInsets.fromLTRB(20.0, 0.0, 10.0, 10.0),
        padding: new EdgeInsets.only(
            left: 5.0, right: 5.0, top: 5.0, bottom: 5.0),
        child: TextFormField(
          style: Theme.of(context).textTheme.display4,
          controller: widget.controller == null ? new TextEditingController(text: widget.defaultText == null ? "": widget.defaultText):widget.controller,
          validator: widget.validator,
          onSaved: widget.onSaved,
          obscureText: widget.obsText,
          enabled: widget.enabled,
          decoration: InputDecoration(
            labelText: widget.label,
            errorStyle: TextStyle(color: Colors.red),
            border: InputBorder.none,
            contentPadding: new EdgeInsets.only(
                left: 10.0, right: 10.0, top: 10.0, bottom: 10.0),
            suffixIcon: Icon(widget.icon),
            hintStyle: TextStyle(
              fontWeight: FontWeight.w500,
              color: widget.color == null ? Colors.grey[300]: widget.color,
            ),
          ),
        ),
        decoration: new BoxDecoration(
            border: new Border.all(
                color: Colors.black,
                width: 0.5
            ),
            borderRadius: new BorderRadius.circular(10.0)
        ),
      );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}