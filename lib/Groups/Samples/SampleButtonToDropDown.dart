import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';

//dio
const List<String> list = <String>['좋아써','이거지','그래','잘했어'];


class SampleButtonToDropDown extends StatefulWidget {
  // List<String> items;
  String selected_value=list.first;



  @override
  State<SampleButtonToDropDown> createState() => _SampleButtonToDropDownState();
}

class _SampleButtonToDropDownState extends State<SampleButtonToDropDown> {

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      dropdownColor: Colors.indigoAccent,
      focusColor: Colors.redAccent,
      iconDisabledColor: Colors.orangeAccent,
      iconEnabledColor: Colors.purpleAccent,
      value: widget.selected_value,
      icon: const Icon(Icons.arrow_downward),
      // elevation: 16,
      elevation: 1,
      style: const TextStyle(color: Colors.lightBlueAccent),
      underline: Container(
        height: 1,
        color: Colors.amberAccent,
      ),
      onChanged: (String? value) {
        setState(() {
          FlutterClipboard.copy(value!).then((value) {});
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: TextStyle(fontSize: 10),
          ),
        );
      }).toList(),
    );
  }
}
