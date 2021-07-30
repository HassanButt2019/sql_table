

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:archive/archive.dart';
class DownloadImageFolderPage extends StatefulWidget {
  const DownloadImageFolderPage({Key? key}) : super(key: key);

  @override
  _DownloadImageFolderPageState createState() => _DownloadImageFolderPageState();
}

class _DownloadImageFolderPageState extends State<DownloadImageFolderPage> {
  bool? _downloading;
  String? dir;
  final zipFlutterPath='https://www.easysoft.com.pk/PhpApi/ProjectImages.zip';
  String localZipFileName='ProjectImages.zip';
  List<String> tempImages=[];
  List<String> images=[];
  @override
  void initState() {
    _downloading=false;
    initDir();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Download Image Folder"),
        actions: [
          _downloading!?progress():Container(),
          IconButton(onPressed: (){
            _downloadZip();
          }, icon: Icon(Icons.file_download))
        ],
      ),
      body: Text(images.toString()),
    );
  }

  void initDir()async {
    if(dir==null){
      dir=(await getApplicationDocumentsDirectory()).path;
    }
  }
  Future<File> _downloadFile(String url,String fileName)async{
      var req=await http.Client().get(Uri.parse(url));
      var file=File('$dir/$fileName');
      return file.writeAsBytes(req.bodyBytes);
  }
  Future<void> _downloadZip()async{
    setState(()  {
      _downloading=true;
    });
    tempImages.clear();
    images.clear();
    var zippedFile=await _downloadFile(zipFlutterPath, localZipFileName);
    await unarchiveAndSaveFile(zippedFile);
    setState(() {
      images.addAll(tempImages);
      _downloading=false;
    });
  }
  progress(){
    return Container(
        width: 25,
        height: 25,
        padding: EdgeInsets.fromLTRB(0.0, 20.0, 10.0, 20.0),
        child: CircularProgressIndicator(strokeWidth: 3.0,valueColor: AlwaysStoppedAnimation<Color>(Colors.white),),
    );
  }
  unarchiveAndSaveFile(File zippedFile) async{

    var bytes=zippedFile.readAsBytesSync();
    var archive=ZipDecoder().decodeBytes(bytes);
    for(var file in archive){
      var fileName='$dir/${file.name}';
      if(file.isFile){
        var outFile=File(fileName);
        print('File '+outFile.path);
        tempImages.add(outFile.path);
        outFile=await outFile.create(recursive: true);
        await outFile.writeAsBytes(file.content);
      }
    }
  }
}
