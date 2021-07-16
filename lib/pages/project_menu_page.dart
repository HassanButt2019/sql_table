import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sqllite_table_view/pages/column_slider.dart';
class ProjectMenuPage extends StatefulWidget {
  const ProjectMenuPage({Key? key}) : super(key: key);

  @override
  _ProjectMenuPageState createState() => _ProjectMenuPageState();
}

class _ProjectMenuPageState extends State<ProjectMenuPage> {
  double column=2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Project Menu Page"),
        actions: [
          PopupMenuButton<int>(
              onSelected: (item)=>onSelected(context,item),
              itemBuilder: (context)=>[
                PopupMenuItem<int>(
                    value: 0,
                    child: Text('Slider'))
              ]),

        ],
      ),
      body:Container(),
    );
  }

  onSelected(BuildContext context, int item) {
    if(item==0){
      _showTotalColumnPickerDialog();
    }

  }
  void _showTotalColumnPickerDialog() async {
    // <-- note the async keyword here

    // this will contain the result from Navigator.pop(context, result)
    final selectedTotalColumns = await showDialog<double>(
      context: context,
      builder: (context) => ColumnSlider(totalColumns: column,),
    );

    // execution of this code continues when the dialog was closed (popped)

    // note that the result can also be null, so check it
    // (back button or pressed outside of the dialog)
    if (selectedTotalColumns != null) {
      print(selectedTotalColumns);
      setState(() {
        column = selectedTotalColumns;
      });
    }
  }
}
