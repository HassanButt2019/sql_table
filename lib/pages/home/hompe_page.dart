import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_sqllite_table_view/config/screen_config.dart';
import 'package:flutter_sqllite_table_view/providers/dashboard_provider.dart';
import 'package:provider/provider.dart';

import '../column_slider.dart';
class DashboardHomePage extends StatefulWidget {
  int itemcount;
   DashboardHomePage({required this.itemcount});

  @override
  _DashboardHomePageState createState() => _DashboardHomePageState(itemcount: itemcount);
}

class _DashboardHomePageState extends State<DashboardHomePage> {
  int itemcount;
  _DashboardHomePageState({required this.itemcount});
  double column=2;
  @override
  Widget build(BuildContext context) {
    ScreenConfig().init(context);
    return Scaffold(
      body: FutureBuilder(

        future: Provider.of<DashboardProvider>(context, listen: false)
            .getProjectTable(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else {
            return SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Container(child:
                    ListTile(trailing: IconButton(
                      icon: Icon(Icons.ac_unit),onPressed: (){
                      PopupMenuButton<int>(
                          onSelected: (item)=>onSelected(context,item),
                          itemBuilder: (context)=>[
                            PopupMenuItem<int>(
                                value: 0,
                                child: Text('Print')),
                            PopupMenuItem<int>(
                                value: 1,
                                child: Text('Grid Layout')),
                            PopupMenuItem<int>(
                                value: 2,
                                child: Text('Slider')),
                            PopupMenuItem<int>(
                                value: 3,
                                child: Text('ColorPicker')),
                          ]
                      );
                    },
                    ),),),
                  GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: Provider.of<DashboardProvider>(context, listen: false)
                        .projectTableDetailList
                        .length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: itemcount,
                        childAspectRatio: 2 / 2.5,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20),
                    itemBuilder: (context, index) {
                      Map map = Provider.of<DashboardProvider>(context, listen: false)
                          .projectTableDetailList![index];
                      List list = map.values.toList();
                      List columnList = map.keys.toList();
                      Color randamColor =
                      Color(Random().nextInt(0xffffffff)).withAlpha(0xff);
                      return InkWell(
                        child: Container(
                            height: 400,
                            width: 100,
                            child: Card(
                              elevation: 15,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  side: BorderSide(color: randamColor, width: 0.5)),
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15)),
                                    child: Image(
                                      height: 150,
                                      fit: BoxFit.fill,
                                      image: AssetImage("assets/images/food.jpeg"),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Center(
                                    child: Text(
                                      list[2].toString(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                ],
                              ),
                            )),
                        onTap: () {
                          Provider.of<DashboardProvider>(context, listen: false)
                              .getProjectMenuById(map["ProjectID"])
                              .then((value) {
                            Navigator.pushNamed(
                                context, '/project_menu_dashboard_page');
                          });
                        },
                      );
                    },
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
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
  onSelected(BuildContext context, int item) {
    switch(item){
    // case 1:
    //   setState(() {
    //     layout=1;
    //   });
    //   break;
      case 2:
        _showTotalColumnPickerDialog();
        break;
    }
  }
}

