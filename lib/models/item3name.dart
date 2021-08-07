


class Item3NameModel{
     int? iD;
     int? item3NameID;
     int? item2GroupID;
     String? itemName;
     int? clientID;
     int? clientUserID;
     String? netCode;
     String? sysCode;
     String? updatedDate;
     String? salePrice;
     String? itemCode;
     String? stock;



     Item3NameModel({this.iD , this.item3NameID , this.item2GroupID , this.itemName ,this.clientID , this.clientUserID , this.netCode , this.itemCode ,this.salePrice , this.stock , this.sysCode ,this.updatedDate});



     Item3NameModel.fromMap(Map<String , dynamic> map){
       iD = map['ID'];
       item3NameID = map['Item3NameID'] ;
       item2GroupID = map['Item2GroupID'];
       itemName = map['ItemName'];
       clientID = map['ClientID'];
       clientUserID = map['ClientUserID'];
       netCode = map['NetCode'];
       sysCode = map['SysCode'];
       updatedDate = map['UpdatedDate'];
       salePrice = map['SalePrice'];
       itemCode = map['ItemCode'];
       stock =map['Stock'];

     }


     Map<String , dynamic> toMap(){
       var map = <String, dynamic>{
         'ID':iD,
         'Item3NameID':item3NameID,
         'Item2GroupID':0,
         'ItemName':itemName,
         'ClientID':0,
         'ClientUserID':0,
         'NetCode':'0',
         'SysCode':'0',
         'UpdatedDate':'0',
         'SalePrice':salePrice,
         'ItemCode':itemCode,
         'Stock':'0'

         
         




       };

       return map;
     }
}