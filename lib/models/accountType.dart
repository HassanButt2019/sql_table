class AccountType{



  int? AcTypeId;
  String? AcTypeName;


  AccountType({this.AcTypeId , this.AcTypeName});
  AccountType.fromMap(Map<dynamic , dynamic> map){

    AcTypeId = map['AcTypeID'];
    AcTypeName = map['AcTypeName'];
  }

  Map<dynamic , dynamic> toMap(){
    var map = <String , dynamic>{
      'AcTypeName':AcTypeName,
    } ;

    if(AcTypeId != null ){
      map['AcTypeID'] = AcTypeId;

    }

    return map;
  }










}