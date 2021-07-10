import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sqllite_table_view/pages/home_page.dart';
import 'package:flutter_sqllite_table_view/pages/table_detail_page.dart';
import 'package:flutter_sqllite_table_view/providers/database_provider.dart';
import 'package:provider/provider.dart';

import 'config/values.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<DatabaseProvider>(context,listen: false).init();
    return MaterialApp(
      title: 'Sqlite Db',
      navigatorKey: Values.navigatorKey,
      initialRoute: '/',
      home: HomePage(),
      routes: {
        '/table_detail_page':(context)=>TableDetailPage(),

      },


    );
  }
}
