
import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sqllite_table_view/menu_tile_model.dart';
import 'package:flutter_sqllite_table_view/models/account2group.dart';
import 'package:flutter_sqllite_table_view/models/account3name.dart';
import 'package:flutter_sqllite_table_view/models/accountType.dart';
import 'package:flutter_sqllite_table_view/models/cashbook.dart';
import 'package:flutter_sqllite_table_view/models/item2group.dart';
import 'package:flutter_sqllite_table_view/models/item3name.dart';
import 'package:flutter_sqllite_table_view/pages/GeneraltTrading/Account2Group.dart';
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
    tableColumnName..remove(columnName);
    for(int i=0;i<tableDetailList.length;i++){
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

  Future<List<AccountType>> fetchAccountTypes() async{
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String databasePath = join(appDocDir.path, 'asset_EasySoftDataFile.db');
    var db = await openDatabase(databasePath);

    List<Map> types = await db.query('Account1Type');
   // print(types);
    return types.length == 0 ? [] : types.map((e) => AccountType.fromMap(e)).toList();
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
    print(list);
    for(int i=0;i<listCopy.length;i++){
      if(listCopy[i]!=null){
        tableDetailList.add(listCopy[i]);
      }
    }
    tableColumnName.clear();
    Map map=tableDetailList[0];
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

  Future<int> createItem3name(Item3NameModel i3n) async{
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String databasePath = join(appDocDir.path, 'asset_EasySoftDataFile.db');
    var db = await openDatabase(databasePath);
    print("hello in item name");
    print(i3n);
    return await db.insert('Item3Name', i3n.toMap());


  }

  Future<int> creatCashBook(CashBookModel cb) async{

    Directory appDocDir = await getApplicationDocumentsDirectory();
    String databasePath = join(appDocDir.path, 'asset_EasySoftDataFile.db');
    var db = await openDatabase(databasePath);

    print(cb);
    return await db.insert('CashBook', cb.toMap());

  }

  Future<int> createAccount2Group(Account2GroupModel a2g) async{
     Directory appDocDir = await getApplicationDocumentsDirectory();
    String databasePath = join(appDocDir.path, 'asset_EasySoftDataFile.db');
    var db = await openDatabase(databasePath);
    print("hello in a2g");
    print(a2g);

    return await db.insert('Account2Group', a2g.toMap());
    
  }

  Future<int> createItem2Group( Item2GroupModel i2g)async{
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String databasePath = join(appDocDir.path, 'asset_EasySoftDataFile.db');
    var db = await openDatabase(databasePath);
    print(i2g);
    return await db.insert('Item2Group', i2g.toMap());
  }


  Future<int> createAccount3Name(Account3NameModel a3g)async{
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String databasePath = join(appDocDir.path, 'asset_EasySoftDataFile.db');
    var db = await openDatabase(databasePath);
    print(a3g);
    return await db.insert('Account3Name', a3g.toMap());
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
  getMaxValue(dynamic columnName){
    if(tableDetailList[0][columnName].runtimeType==int){
      print(columnName);
      List cList=[];
      for(int i=0;i<tableDetailList.length;i++){
        cList.add(tableDetailList[i][columnName]);
      }
      cList.sort();
      return cList[cList.length-1];
    }else{
      print('column data is not in numbers');
    }
  }
  getColumnCount(dynamic columnName){
    if(tableDetailList[0][columnName].runtimeType==int){
      print(columnName);
      List cList=[];
      for(int i=0;i<tableDetailList.length;i++){
        cList.add(tableDetailList[i][columnName]);
      }
      cList.sort();
      return cList.length;
    }else{
      print('column data is not in numbers');
    }
  }
  getSearchList(String searchValue,String columnName){
    Set set=Set();
    List searchList=[];
    set.clear();
    searchList.clear();
    for(int i=0;i<tableDetailList.length;i++){
      set.add(tableDetailList[i][columnName]);
    }
    List cList=set.toList();
    cList.forEach((element) {
      if(element.toString().toLowerCase().contains(searchValue)) {
        searchList.add(element);
      }

    });
    return searchList;
    //print(cList.contains(int.parse(searchValue)));
    // cList.forEach((element) {
    //   if(element.toString().contains(element)){
    //     print("element is in list");
    //   }
    // });
  }
  getSearchTable(String columnName,int columnIndex,List searchList){
    List tableDetailListCopy=tableDetailList;
    tableDetailList=[];
    tableDetailList.clear();
    for(int i=0;i<tableDetailListCopy.length;i++){
      Map map=tableDetailListCopy[i];
      if(searchList.contains(map[columnName])){
        tableDetailList.add(map);
      }
    }
    print(tableDetailList);
  }
  runningSum(String columName){
    tableDetailList=List.from(tableDetailList);
      List cList = [];
      List tableRunningDetailList=[];
      for (int i = 0; i < tableDetailList.length; i++) {
        cList.add(tableDetailList[i][columName].toString());
      }
      if(int.tryParse(cList[0])!=null){
        int sum=0;
        tableRunningDetailList.clear();
        Map map=Map.from(tableDetailList[0]);
        map["Running Average"]=int.parse(cList[0]);
        sum=int.parse(cList[0]);
        tableRunningDetailList.add(map);
        print(tableRunningDetailList);
        tableColumnName.add("Running Average");
        for(int j=1;j<tableDetailList.length;j++){
          Map map=Map.from(tableDetailList[j]);
          map["Running Average"]=sum+int.parse(cList[j]);
          sum=map["Running Average"];
          tableRunningDetailList.add(map);
        }
        print(tableRunningDetailList);
        tableDetailList=tableRunningDetailList;
      }else{
        print("column contains string");
      }

  }
}