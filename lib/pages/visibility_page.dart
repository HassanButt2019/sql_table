import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sqllite_table_view/config/screen_config.dart';
import 'package:flutter_sqllite_table_view/providers/database_provider.dart';
import 'package:provider/provider.dart';
class VisibilityPage extends StatefulWidget{
  final columnName;
  final columnIndex;
  const VisibilityPage({Key? key,required this.columnName,required this.columnIndex}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return  _VisibilityPage();
  }

}
class _VisibilityPage extends State<VisibilityPage> {
  bool visibility=true;
  String dropdownValue = 'SUM';
  final _formKey = GlobalKey<FormState>();
  TextEditingController _searchController = TextEditingController();
  //VisibilityPage({Key? key,required this.columnName}) : super(key: key);
 List searchList=[];
  @override
  Widget build(BuildContext context) {
    ScreenConfig().init(context);
    return AlertDialog(
      title: Text(widget.columnName),
      content: Column(
        children: [
          Row(
            children: [
              Expanded(child: Form(
            key: _formKey,
            child: TextFormField(
              controller: _searchController,
              validator: (value) {
              },
              onChanged: (value){
                searchList=Provider.of<DatabaseProvider>(context,listen: false).getSearchList(value, widget.columnName);
                if(value.length==0){
                  print("value is zero");
                }
                setState(() {

                });
              },),
          )),
              IconButton(onPressed: (){
                Navigator.pop(context, searchList);
              }, icon: Icon(Icons.search))
            ],),
          Expanded(
            child: SizedBox(
              width: ScreenConfig.screenWidth,
              height: ScreenConfig.blockHeight*30,
              child: ListView.builder(
                  itemCount: searchList.length,
                  itemBuilder: (context,index){
                return Text(searchList[index].toString());
              }),
            ),
          ),
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
              print("list lendth "+searchList.length.toString());
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
