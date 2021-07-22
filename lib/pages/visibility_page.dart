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
      content: Column(
        children: [
          ElevatedButton(onPressed: (){
            Navigator.pop(context, 2);
          }, child: Text("Group By")),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: (){
                Navigator.pop(context, 0);
              }, child: Text("Visible")),
              ElevatedButton(onPressed: (){
                Navigator.pop(context, 1);
              }, child: Text("Hide"))
            ],
          ),
        ],
      ),
    );
  }
}
