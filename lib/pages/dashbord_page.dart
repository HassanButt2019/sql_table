import 'package:flutter/material.dart';
import 'package:flutter_sqllite_table_view/pages/calles/call_page.dart';
import 'package:flutter_sqllite_table_view/pages/chat/chat_page.dart';
import 'package:flutter_sqllite_table_view/pages/groups/group_page.dart';
import 'package:flutter_sqllite_table_view/pages/home/hompe_page.dart';
import 'package:flutter_sqllite_table_view/providers/dashboard_provider.dart';
import 'package:provider/provider.dart';

import 'column_slider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  double column=2;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
        title: Center(child: Text("EasySoft")),
    bottom: TabBar(
    tabs: [
    Tab(text: "Home",icon: Icon(Icons.add_to_home_screen),),
    Tab(text: "Chat",icon: Icon(Icons.chat),),
    Tab(text: "Groups",icon: Icon(Icons.group),),
    Tab(text: "Calls",icon: Icon(Icons.call),),
    ],
    ),
          actions: <Widget>[
            PopupMenuButton<int>(
                onSelected: (_){},
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
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text("Ashfaq"),
                accountEmail: Text("ashfaqroy2@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage:
                  AssetImage("assets/images/mypic.jpeg"),
                ),
              ),
              ListTile(
                leading: Icon(Icons.dashboard),
                title: Text("Dashboard"),
                onTap: (){},
              ),
              ListTile(
                leading: Icon(Icons.add),
                title: Text("Add"),
                onTap: (){},
              ),
              ListTile(
                onTap: () {},
                leading: Icon(Icons.chat),
                title: Text("Chat"),
              ),
              ListTile(
                  leading: Icon(Icons.call),
                  title: Text("Calls"),
                  onTap: () {}
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text("LogOut"),
                onTap: () {
                },
              ),
            ],
          ),
        ),
        endDrawer: Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text("Ashfaq"),
                accountEmail: Text("ashfaqroy2@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage:
                  AssetImage("assets/images/mypic.jpeg"),
                ),
              ),
              ListTile(
                leading: Icon(Icons.dashboard),
                title: Text("Dashboard"),
                onTap: (){},
              ),
              ListTile(
                leading: Icon(Icons.add),
                title: Text("Add"),
                onTap: (){},
              ),
              ListTile(
                onTap: () {},
                leading: Icon(Icons.chat),
                title: Text("Chat"),
              ),
              ListTile(
                  leading: Icon(Icons.call),
                  title: Text("Calls"),
                  onTap: () {}
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text("LogOut"),
                onTap: () {
                },
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            AppBar(
              title: Text("name"),
              actions: <Widget>[
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
                ),
              ],
            ),
            DashboardHomePage(itemcount:column.round()),
            ChatPage(),
            GroupPage(),
            CallPage(),
          ],
        ),
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
