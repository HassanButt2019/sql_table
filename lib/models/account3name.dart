class Account3NameModel {
  int? id;
  String? AcNameID;
  String? AcName;
  String? AcGroupID;
  String? AcAddress;
  String? AcMobileNo;
  String? AcContactNo;
  String? AcEmailAddress;
  String? AcDebitBal;
  String? AcCreditBal;
  String? AcPassward;
  String? ClientID;
  String? ClientUserID;
  String? SysCode;
  String? NetCode;
  String? UpdatedDate;
  int? SerialNo;
  String? UserRights;
  String? SecurityRights;
  String? Salary;
  //String? AccountPhoto;
  String? NameOfPerson;
  String? Remarks;

  Account3NameModel(
      {this.AcNameID,
      this.AcName,
      this.AcGroupID,
      this.AcAddress,
      this.AcMobileNo,
      this.AcContactNo,
      this.AcEmailAddress,
      this.AcDebitBal,
      this.AcCreditBal,
      this.AcPassward,
      this.ClientID,
      this.ClientUserID,
      this.SysCode,
      this.NetCode,
      this.UpdatedDate,
      this.SerialNo,
      this.UserRights,
      this.SecurityRights,
      this.Salary});

  Account3NameModel.fromMap(Map<String, dynamic> map) {
    id = map['ID'];
    AcNameID = map['AcNameID'];
    AcName = map['AcName'];
    AcGroupID = map['AcGroupID'];
    AcAddress = map['AcAddress'];
    AcMobileNo = map['AcMobileNo'];
    AcContactNo = map['AcContactNo'];
    AcEmailAddress = map['AcEmailAddress'];
    AcDebitBal = map['AcDebitBal'];
    AcCreditBal = map['AcCreditBal'];
    AcPassward = map['AcPassward'];
    ClientID = map['ClientID'];
    SysCode = map['SysCode'];
    NetCode = map[' NetCode'];
    UpdatedDate = map['UpdatedDate'];
    SerialNo = map['SerialNo'];
    UserRights = map['UserRights'];
    SecurityRights = map['SecurityRights'];
    Salary = map['Salary'];
//    AccountPhoto = map['AccountPhoto'];
    NameOfPerson = map['NameOfPerson'];
    Remarks = map['Remarks'];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'ID': id,
      'AcNameID': AcNameID,
      'AcName': AcName,
      'AcGroupID': AcGroupID,
      'AcAddress': AcAddress,
      'AcMobileNo': AcMobileNo,
      'AcContactNo': AcContactNo,
      'AcEmailAddress': AcEmailAddress,
      'AcDebitBal': AcDebitBal,
      'AcCreditBal': AcCreditBal,
      'AcPassward': AcPassward,
      'ClientID': ClientID,
      'SysCode': SysCode,
      'NetCode': NetCode,
      'UpdatedDate': UpdatedDate,
      'SerialNo': SerialNo,
      'UserRights': UserRights,
      'SecurityRights': SecurityRights,
      'Salary': Salary,
    //  'AccountPhoto': AccountPhoto,
      'NameOfPerson': NameOfPerson,
      'Remarks': Remarks,
    };

    return map;
  }
}
