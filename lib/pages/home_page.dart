import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sqllite_table_view/config/screen_config.dart';
import 'package:flutter_sqllite_table_view/providers/database_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    ScreenConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Column(
        children: [
          ElevatedButton(onPressed: (){
            Navigator.pushNamed(context, '/table_view_page');
          }, child: Text("Table View Page")),
          ElevatedButton(onPressed: (){
            Provider.of<DatabaseProvider>(context,listen:false).getProjectMenuTable().then((value) {
              Navigator.pushNamed(context, '/project_menu_page');
    });

          }, child: Text("Project Menu Page")),

        ],
      ),
    );
  }
}
