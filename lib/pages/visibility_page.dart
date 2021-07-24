import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class VisibilityPage extends StatefulWidget{
  final columnName;

  const VisibilityPage({Key? key, this.columnName}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return  _VisibilityPage();
  }

}
class _VisibilityPage extends State<VisibilityPage> {
  bool visibility=true;
  String dropdownValue = 'SUM';
  //VisibilityPage({Key? key,required this.columnName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.columnName),
      content: Column(
        children: [
          ElevatedButton(onPressed: (){
            Navigator.pop(context, 2);
          }, child: Text('GROUPBY')),
          ElevatedButton(onPressed: (){
            Navigator.pop(context, 1);
          }, child: Text('HIDE')),
    DropdownButton<String>(
    value: dropdownValue,
    icon: const Icon(Icons.arrow_downward),
    iconSize: 24,
    elevation: 16,
    style: const TextStyle(color: Colors.deepPurple),
    underline: Container(
    height: 2,
    color: Colors.deepPurpleAccent,
    ),
    onChanged: (String? newValue) {
    setState(() {
    dropdownValue = newValue!;
    });
    },
    items: <String>['SUM','MIN','MAX','COUNT']
        .map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
    value: value,
    child: Text(value),
    );
    }).toList(),
    ),

          ElevatedButton(onPressed: (){
            if(dropdownValue=='SUM'){
              Navigator.pop(context, 3);
            }else if(dropdownValue=='MIN'){
              Navigator.pop(context, 4);
            }else if(dropdownValue=='MAX'){
              Navigator.pop(context, 5);
            }else if(dropdownValue=='COUNT'){
              Navigator.pop(context, 6);
            }
          }, child: Text("OK")),
        ],
      ),
    );
  }
}
