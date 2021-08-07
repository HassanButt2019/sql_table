import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sqllite_table_view/config/screen_config.dart';
import 'package:flutter_sqllite_table_view/providers/sqlite_database_provider.dart';
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
          ElevatedButton(onPressed:(){
            Navigator.pushNamed(context, '/download_image_folder_page');
          }, child: Text("Download image folder")),
          ElevatedButton(onPressed:(){
            Navigator.pushNamed(context, '/dashboard_page');
          }, child: Text("Dashboard")),
          ElevatedButton(onPressed: (){
            Navigator.pushNamed(context, '/create_account_page');
          }, child: Text('Create Account')),
          ElevatedButton(onPressed: (){
            Navigator.pushNamed(context, '/account_to_group');
          }, child: Text('Account 2 Group')),
           ElevatedButton(onPressed: (){
            Navigator.pushNamed(context, '/account_3_name');
          }, child: Text('Account 3 Group')),
           ElevatedButton(onPressed: (){
            Navigator.pushNamed(context, '/item_2_group');
          }, child: Text('Item 2 Group')),
           ElevatedButton(onPressed: (){
            Navigator.pushNamed(context, '/item_3_name');
          }, child: Text('Item 3 Name')),
          ElevatedButton(onPressed: (){
            Navigator.pushNamed(context, '/cash_book');
          }, child: Text('Cash Book')),

          

        ],
      ),
    );
  }
}
