import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_sqllite_table_view/api/api_constants.dart';
import 'package:flutter_sqllite_table_view/pages/material/Toast.dart';
import 'package:http/http.dart' as http;
class AuthProvider extends ChangeNotifier {
  createAccount(String name, String password, String email,
      String phoneNumber) async {
    print(name);
    print(password);
    print(email);
    print(phoneNumber);
    Uri url = Uri.parse('${ApiConstants.baseUrl}${ApiConstants.createAccount}');
    try {

      var response = await http.post(url, body: {
        'AcName':name,
        'AcGroupID':'5',
        'AcAddress':'Hardcoded',
        'AcContactNo':phoneNumber,
        'AcEmailAddress':email,
        'Salary':'0',
        'AcMobileNo':phoneNumber,
        'AcPassward':password,
        'SecurityRights':'0',
        'ClientID':'2',
        'DisplayImage':'not available',
        'UpdatedDate':'0',
        'SerialNo':'0',
        'AcDebitBal':'0',
        'AcCreditBal':'0',
        'ClientUserID':'1',
        'SysCode':'0',
        'NetCode':'0',
        'UserRights':'NotAllowLogin',
        'AccountPhoto':'Not Set Yet ',
      });
      if (response.statusCode == 200) {
        Map map=json.decode(response.body);
        print(map);
        if(map["success"]==1){
         Toast.buildErrorSnackBar(map['message']);
          print(map['message']);
        }else if(map["success"]==-3){
          Toast.buildErrorSnackBar(map['message']);
          print(map['message']);
        }
      } else {
        print("some error occur while calling apis");
      }
    } on Exception catch (e) {
      print(e.toString());
    }
  }
}