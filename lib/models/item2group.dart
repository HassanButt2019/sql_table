

class Item2GroupModel{
     int? ID;
    String? Item2GroupID,Item1TypeID, ClientID,ClientUserID;
    String? Item2GroupName ,NetCode,SysCode ,UpdatedDate;


    Item2GroupModel({this.ID , this.ClientID , this.ClientUserID , this.Item1TypeID , this.Item2GroupID , this.Item2GroupName , this.NetCode , this.SysCode , this.UpdatedDate});


    Item2GroupModel.fromMap(Map<String , dynamic> map){
      ID = map['ID'];
      Item2GroupID = map['Item2GroupID'];
      Item1TypeID = map['Item1TypeID'];
      ClientID = map['ClientID'];
      ClientUserID = map['ClientUserID'];
      Item2GroupName = map['Item2GroupName'];
      NetCode = map['NetCode'];
      SysCode = map['SysCode'];
      UpdatedDate = map['UpdatedDate'];
    }

    Map<String , dynamic> toMap(){
      var map = <String , dynamic>{
        'ID':ID,
        'Item2GroupID':Item2GroupID,
        'Item1TypeID':Item1TypeID,
        'ClientID':0,
        'ClientUserID':0,
        'Item2GroupName':Item2GroupName,
        'NetCode':'0',
        'SysCode':'0',
        'UpdatedDate':'0',

      };

      return map;
      
      
          }
}