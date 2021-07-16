import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sqllite_table_view/menu_tile_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider extends ChangeNotifier{
  List? tableDetailList;
  List? tableColumnName;
  List<MenuTileModel> list=[];
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
  Future<void> getTable(String tableName)async{
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String databasePath = join(appDocDir.path, 'asset_EasySoftDataFile.db');
    var db = await openDatabase(databasePath);
    String query = '''
      SELECT * FROM $tableName;
      ''';
    tableDetailList=await db.rawQuery(query);
    Map map=tableDetailList![0];
    tableColumnName=map.keys as List;

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
}