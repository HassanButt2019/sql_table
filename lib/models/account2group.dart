


import 'dart:core';

class Account2GroupModel{
  int? ID;
  int? AcGroupId;
  int? AcTypeId;
  String? AcGroupName;
  int? ClientId;
  int? ClientUserId;
  String? NetCode;
  String? SysCode;
  String? UpdatedDate;

  Account2GroupModel({this.AcGroupId , this.AcGroupName , this.AcTypeId , });



  Account2GroupModel.fromMap(Map<String , dynamic> map){

    ID = map['Id'];
    AcGroupId = map['AcGroupId'];
    AcTypeId = map['AcTypeID'];
    AcGroupName = map['AcGruopName'];
    ClientId = map['ClientID'];
    ClientUserId = map['ClientUserID'];
    NetCode = map['NetCode'];
    SysCode = map['SysCode'];
    UpdatedDate = map['UpdatedDate'];
  }


  Map<String , dynamic> toMap(){
    var map = <String , dynamic>{
      'ID':ID,
      'AcGroupID':0,
      'AcTypeID':0,
      'AcGruopName':AcGroupName,
      'ClientID':0,
      'ClientUserID':0,
      'NetCode':'0',
      'SysCode':'0',
      'UpdatedDate':'0'
    };
    return map;
  }





}