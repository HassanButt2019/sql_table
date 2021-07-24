
import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sqllite_table_view/menu_tile_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider extends ChangeNotifier{
  List tableDetailList=[];
  List<dynamic> tableColumnName=[];
  List<MenuTileModel> list=[];
  List groupSetList=[];
  init()async{
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'asset_EasySoftDataFile.db');
    if (FileSystemEntity.typeSync(path) == FileSystemEntityType.notFound){
      print("File not found");
      //ByteData data = await rootBundle.load(join('assets/database', 'test.db'));
      ByteData data = await rootBundle.load(join('assets/database/EasySoftDataFile.db'));
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Save copied asset to documents
      await new File(path).writeAsBytes(bytes);

    }
  }
  Future<List> readTableName()async{
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String databasePath = join(appDocDir.path, 'asset_EasySoftDataFile.db');
    var db = await openDatabase(databasePath);
    String query = '''
      SELECT name FROM sqlite_master
      ''';
    List<dynamic> list=await db.rawQuery(query);
    return list;
  }
  Future<void> removeColumn(String columnName)async {
    if(tableColumnName.isNotEmpty)
    tableColumnName!..remove(columnName);
    for(int i=0;i<tableDetailList!.length;i++){
      //Map map=tableDetailList![i];
     // print(map..remove(columnName));
    }
    }
    groupBy(String columnName){
    Set groupSet=Set();
    groupSet.clear();
   for(int i=0;i<tableDetailList.length;i++){
     groupSet.add(tableDetailList[i][columnName]);
   }
   //Set sortSet=SplayTreeSet.from(groupSet,(a, b) => a.compareTo(b) );
   groupSetList=groupSet.toList();
   groupSetList.sort();
    print(groupSetList);
    }
  Future<void> getTable(String tableName)async{
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String databasePath = join(appDocDir.path, 'asset_EasySoftDataFile.db');
    var db = await openDatabase(databasePath);
    String query = '''
      SELECT * FROM $tableName;
      ''';
    tableDetailList.clear();
    List list=await db.rawQuery(query);
    List listCopy=List.from(list);
    for(int i=0;i<listCopy.length;i++){
      if(listCopy[i]!=null){
        tableDetailList.add(listCopy[i]);
      }
    }
    tableColumnName.clear();
    Map map=tableDetailList![0];
   map.forEach((key, value) {tableColumnName.add(key);});
  }
  Future<void> getProjectMenuTable()async{
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String databasePath = join(appDocDir.path, 'asset_EasySoftDataFile.db');
    var db = await openDatabase(databasePath);
    String query = '''
      SELECT * FROM ProjectMenu;
      ''';
   List list=await db.rawQuery(query);
   for(int i=0;i<list.length;i++){

   }
  }
  getSumOfColumn(dynamic columnName,int columnPosition){
    if(tableDetailList[0][columnName].runtimeType==int) {

     num sum=0;
      for(int i=0;i<tableDetailList.length;i++){
        sum+=tableDetailList[i][columnName];
      }
      return sum;
    }else{
      print('column data is not in numbers');
    }
    //  print(int.tryParse(tableDetailList[0][columnName]));
    // for(int i=0;i<tableDetailList.length;i++){
    //   tableDetailList[i][columnName];
    // }
  }
  getMinValue(dynamic columnName){
    if(tableDetailList[0][columnName].runtimeType==int){
      print(columnName);
      List cList=[];
      for(int i=0;i<tableDetailList.length;i++){
        cList.add(tableDetailList[i][columnName]);
      }
      cList.sort();
      return cList[0];
    }else{
      print('column data is not in numbers');
    }
  }
}