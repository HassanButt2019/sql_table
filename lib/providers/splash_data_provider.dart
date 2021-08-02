import 'dart:convert';
import 'dart:io';
import 'package:flutter_sqllite_table_view/api/api_constants.dart';
import 'package:http/http.dart' as http;
import 'package:archive/archive.dart';
import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
class SplashDataProvider extends ChangeNotifier {
  bool? _downloading;
  String? dir;
  final zipFlutterPath = 'https://www.easysoft.com.pk/PhpApi/ProjectImages.zip';
  String localZipFileName = 'ProjectImages.zip';
  List<String> tempImages = [];
  List<String> images = [];

  Future<void> downloadImageFile() async {
    print("downloading file ");
    _downloading = false;
    initDir();
    await _downloadZip();
    print("zip is downloaded successfully");
  }

  Future<void> _downloadZip() async {
    _downloading = true;
    tempImages.clear();
    images.clear();
    var zippedFile = await _downloadFile(zipFlutterPath, localZipFileName);
    await unarchiveAndSaveFile(zippedFile);
  }

  unarchiveAndSaveFile(File zippedFile) async {
    var bytes = zippedFile.readAsBytesSync();
    var archive = ZipDecoder().decodeBytes(bytes);
    for (var file in archive) {
      var fileName = '$dir/${file.name}';
      if (file.isFile) {
        var outFile = File(fileName);
        print('File ' + outFile.path);
        tempImages.add(outFile.path);
        outFile = await outFile.create(recursive: true);
        await outFile.writeAsBytes(file.content);
      }
    }
  }

  void initDir() async {
    if (dir == null) {
      dir = (await getApplicationDocumentsDirectory()).path;
    }
  }
  Future<void> callSplashApis()async{
    await getProject();
    await getProjectMenuSub();
    await getCountryCode();
    await getProjectMenu();
  }
  Future<File> _downloadFile(String url, String fileName) async {
    var req;
    try {
      req = await http.Client().get(Uri.parse(url));
    } on Exception catch (e, stackTrace) {
      print('error is' + e.toString() + stackTrace.toString());
    }
    var file = File('$dir/$fileName');
    return file.writeAsBytes(req.bodyBytes);
  }

  Future<void> getProjectMenu() async {
    String tableName = "ProjectMenu";
    Uri url = Uri.parse('${ApiConstants.baseUrl}${ApiConstants.projectMenu}');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        deleteTable(tableName);
        Map map = json.decode(response.body);
        List<Map<String, Object?>> list = List.from(map[tableName]);
        for (int i = 0; i < list.length; i++) {
          Map<String,dynamic> map = Map.from(list[i]);
          insertTable(tableName, map);
        }
      } else {
        print("some error occur while calling apis");
      }
    } on Exception catch (e) {
        print(e.toString());
    }
  }
  Future<void> getCountryCode() async {
    String tableName = "CountryCode";
    Uri url = Uri.parse('${ApiConstants.baseUrl}${ApiConstants.countryCode}');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        deleteTable(tableName);
        Map map = json.decode(response.body);
        List<Map<String, Object?>> list = List.from(map[tableName]);
        for (int i = 0; i < list.length; i++) {
          Map<String,dynamic> map = Map.from(list[i]);
          insertTable(tableName, map);
        }
      } else {
        print("some error occur while calling apis");
      }
    } on Exception catch (e) {
      print(e.toString());
    }
  }
  Future<void> getProjectMenuSub() async {
    String tableName = "ProjectMenuSub";
    Uri url = Uri.parse('${ApiConstants.baseUrl}${ApiConstants.projectMenuSub}');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        deleteTable(tableName);
        Map map = json.decode(response.body);
        List<Map<String, Object?>> list = List.from(map[tableName]);
        for (int i = 0; i < list.length; i++) {
          Map<String,dynamic> map = Map.from(list[i]);
          insertTable(tableName, map);
        }
      } else {
        print("some error occur while calling apis");
      }
    } on Exception catch (e) {
      print(e.toString());
    }
  }
  Future<void> getProject() async {
    String tableName = "Project";
    Uri url = Uri.parse('${ApiConstants.baseUrl}${ApiConstants.project}');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        deleteTable(tableName);
        Map map = json.decode(response.body);
        List<Map<String, Object?>> list = List.from(map['ProjectMenu']);
        for (int i = 0; i < list.length; i++) {
          Map<String,dynamic> map = Map.from(list[i]);
          insertTable(tableName, map);
        }
      } else {
        print("some error occur while calling apis");
      }
    } on Exception catch (e) {
      print(e.toString());
    }
  }
  Future<void> deleteTable(String tableName) async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String databasePath = join(appDocDir.path, 'asset_EasySoftDataFile.db');
    var db = await openDatabase(databasePath);
    // String query = '''
    //   DELETE from $tableName;
    //   ''';
    await db.delete(tableName);
  }
  Future<void> insertTable(String tableName,Map<String,dynamic> values) async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String databasePath = join(appDocDir.path, 'asset_EasySoftDataFile.db');
    var db = await openDatabase(databasePath);
    // String query = '''
    //   DELETE from $tableName;
    //   ''';
    await db.insert(tableName, values);
  } 
}