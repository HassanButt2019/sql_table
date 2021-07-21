import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VisibilityPage extends StatelessWidget {
  bool visibility=true;
  final String columnName;
  VisibilityPage({Key? key,required this.columnName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(columnName),
      content: Wrap(
        children: [
          ElevatedButton(onPressed: (){
            Navigator.pop(context, false);
          }, child: Text("Visible")),
          ElevatedButton(onPressed: (){
            Navigator.pop(context, true);
          }, child: Text("Hide"))
        ],
      ),
    );
  }
}
