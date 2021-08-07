import 'package:connectivity_wall/connectivity_wall.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sqllite_table_view/pages/GeneraltTrading/Account2Group.dart';
import 'package:flutter_sqllite_table_view/pages/GeneraltTrading/Account3Name.dart';
import 'package:flutter_sqllite_table_view/pages/GeneraltTrading/CashBook.dart';
import 'package:flutter_sqllite_table_view/pages/GeneraltTrading/Item2Group.dart';
import 'package:flutter_sqllite_table_view/pages/GeneraltTrading/Item3Name.dart';
import 'package:flutter_sqllite_table_view/pages/column_slider.dart';
import 'package:flutter_sqllite_table_view/pages/download_image_folder.dart';
import 'package:flutter_sqllite_table_view/pages/group_by_page.dart';
import 'package:flutter_sqllite_table_view/pages/home/hompe_page.dart';
import 'package:flutter_sqllite_table_view/pages/home/project_menu_dashboard_page.dart';
import 'package:flutter_sqllite_table_view/pages/home_page.dart';
import 'package:flutter_sqllite_table_view/pages/login/create_account.dart';
import 'package:flutter_sqllite_table_view/pages/table_view_page.dart';
import 'package:flutter_sqllite_table_view/pages/pdf_preview_page.dart';
import 'package:flutter_sqllite_table_view/pages/sqlite_data_views/table_detail_page.dart';
import 'package:flutter_sqllite_table_view/providers/splash_data_provider.dart';
import 'package:flutter_sqllite_table_view/providers/sqlite_database_provider.dart';
import 'package:provider/provider.dart';
import 'config/values.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<DatabaseProvider>(context,listen: false).init();
    // Provider.of<SplashDataProvider>(context,listen: false).downloadImageFile().then((value) {
    //   Navigator.pushNamed(context, '/home_page');
    // });
    return FutureBuilder(
      // Replace the 3 second delay with your initialization code:
      //future: Future.delayed(Duration(seconds: 5)),
      future: Provider.of<SplashDataProvider>(context,listen: false).callSplashApis(),
      builder: (context, AsyncSnapshot snapshot) {
        // Show splash screen while waiting for app resources to load:
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(

              navigatorKey: Values.navigatorKey,
              home: Splash());
        } else {
          // Loading is done, return the app:

          return MaterialApp(
            title: 'Sqlite Db',
            navigatorKey: Values.navigatorKey,
            initialRoute: '/',
            home:  HomePage(),
            routes: {
              '/table_view_page':(context)=>TableViewPage(),
              '/table_detail_page':(context)=>TableDetailPage(),
              '/pdf_preview_page':(context)=>PdfPreviewPage(),
              '/column_slider':(context)=>ColumnSlider(totalColumns: 2,),
              '/group_by_page':(context)=>GroupByPage(),
              '/download_image_folder_page':(context)=>DownloadImageFolderPage(),
              '/account_to_group':(context)=>Account2Group(),
              '/account_3_name':(context)=>Account3Name(),
              '/item_2_group':(context)=>Item2Group(),
              '/item_3_name':(context)=>Item3Name(),
              '/cash_book':(context)=>CashBook(),
              //'/home_page':(context)=>HomePage(),
              //'/dashboard_home_page':(context)=>DashboardHomePage(),
              //'/dashboard_page':(context)=>DashboardPage(),
              '/project_menu_dashboard_page':(context)=>ProjectMenuDashboardPage(),
              '/create_account_page':(context)=>CreateAccount(),
            },


          );
        }
      },
    );
  }
  }
class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
class OfflineState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Center(
          child: Text("Not connected to internet"),
        ),
      ),
    );
  }
}
class Online extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return OnlineState();
  }

}

class OnlineState extends State<Online> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:Center(
        child: CircularProgressIndicator(),
      )
    );
  }
}
