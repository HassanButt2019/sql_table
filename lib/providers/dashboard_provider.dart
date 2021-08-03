import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
class DashboardProvider extends ChangeNotifier{
  List projectTableDetailList=[];
  List projectMenuTableDetailList=[];
  List<dynamic> projectTableColumnName=[];
  List<dynamic> projectMenuTableColumnName=[];
  Future<void> getProjectTable()async{
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String databasePath = join(appDocDir.path, 'asset_EasySoftDataFile.db');
    var db = await openDatabase(databasePath);
    String query = '''
      SELECT * FROM Project;
      ''';
    List list=await db.rawQuery(query);
    print(list);
    projectTableDetailList.clear();
    List listCopy=List.from(list);
    for(int i=0;i<listCopy.length;i++){
      if(listCopy[i]!=null){
        projectTableDetailList.add(listCopy[i]);
      }
    }
    projectTableColumnName.clear();
    Map map=projectTableDetailList[0];
    projectTableColumnName.clear();
    map.forEach((key, value) {projectTableColumnName.add(key);});
  }
  Future<void> getProjectMenuById(int id)async{
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String databasePath = join(appDocDir.path, 'asset_EasySoftDataFile.db');
    var db = await openDatabase(databasePath);
    String query = '''
      Select * from ProjectMenu WHERE ProjectID=${id.toString()};
      ''';
    projectMenuTableDetailList=await db.rawQuery(query);
    Map map=projectMenuTableDetailList[0];
    projectMenuTableColumnName.clear();
    map.forEach((key, value) {projectMenuTableColumnName.add(key);});
  }
}