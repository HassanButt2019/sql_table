


class CashBookModel{
    String? cId;
    String? CashBookID;
    String? CBDate;
    String? DebitAccount;
    String? CreditAccount;
    String? CBRemarks;
    String? Amount;
    String? ClientID;
    String? ClientUserID;
    String? NetCode;
    String? SysCode;
    String? UpdatedDate;
    String? TableID;
    String? SerialNo;
    String? TableName;
    String? BusinessDetails;
    /////////////////////////Other Then TAble Paramneter
    // String? DebitAccountName;
    // String? CreditAccountName;
    // String? UserName;
    // String? ReferanceEntry;



    CashBookModel({this.cId , this.Amount , this.CBDate , this.CBRemarks , this.CashBookID , this.ClientID , this.ClientUserID , this.CreditAccount , this.DebitAccount , this.NetCode , this.SerialNo , this.SysCode , this.TableID , this.TableName , this.UpdatedDate});


    CashBookModel.fromMap(Map<String ,dynamic> map ){
      cId = map['ID'];
      CashBookID = map['CashBookID'];
      CBDate = map['CBDate'];
      DebitAccount = map['DebitAccount'];
      CreditAccount= map['CreditAccount'];
      CBRemarks= map['CBRemarks'];
      Amount= map['Amount'];
      ClientID= map['ClientID'];
      ClientUserID= map['ClientUserID'];
      NetCode= map['NetCode'];
      SysCode= map['SysCode'];
      UpdatedDate= map['UpdatedDate'];
      TableID= map['TableID'];
      SerialNo= map['SerialNo'];
      TableName= map['TableName'];
    }


    Map<String , dynamic> toMap(){
      var map = <String ,dynamic>{
       'ID':cId,
      'CashBookID':'0',
      'CBDate':'0',
      'DebitAccount':'0',
      'CreditAccount':'0',
      'CBRemarks':'0',
      'Amount':Amount,
      'ClientID':'0',
      'ClientUserID':'0',
      'NetCode':'0',
      'SysCode':'0',
      'UpdatedDate':'0',
      'TableID':'0',
      'SerialNo':'0',
      'TableName':'0',
      };
      return map;





    }
}