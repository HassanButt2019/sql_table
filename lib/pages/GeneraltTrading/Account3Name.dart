import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sqllite_table_view/models/account3name.dart';
import 'package:flutter_sqllite_table_view/providers/sqlite_database_provider.dart';
import 'package:provider/provider.dart';

class Account3Name extends StatefulWidget {
  const Account3Name({Key? key}) : super(key: key);

  @override
  _Account3NameState createState() => _Account3NameState();
}

class _Account3NameState extends State<Account3Name> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController numberController = TextEditingController();
   TextEditingController numberController1 = TextEditingController();
  CountryCode? countryCode;
  Account3NameModel account3nameModel = Account3NameModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Account 3 Name"),
      ),
      body: ListView(
        children: [
          Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 20, right: 20),
                    child: Container(
                      height: 50,
                      child: TextFormField(
                          controller: nameController,
                        onChanged: (value) {
                          // print(value);
                        },
                        onSaved: (value) {
                          setState(() {
                            account3nameModel.NameOfPerson = nameController.text;
                          });
                          print("HELLO");
                          print(value);
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Name cannot be empty';
                          }
                        },
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.supervisor_account),
                            hintText: "Enter Your Name",
                            labelText: "Your Name",
                            filled: true,
                            fillColor: Colors.white,
                            focusColor: Colors.green,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 2.0),
                            )),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 20, right: 20),
                    child: Container(
                      height: 50,
                      child: TextFormField(
                          controller: addressController,
                        onChanged: (value) {
                          // print(value);
                        },
                        onSaved: (value) {
                          setState(() {

                            account3nameModel.AcAddress = addressController.text;
                          });
                          print("HELLO");
                          print(value);
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Name cannot be empty';
                          }
                        },
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.supervisor_account),
                            hintText: "Enter Your Address",
                            labelText: "Your Address",
                            filled: true,
                            fillColor: Colors.white,
                            focusColor: Colors.green,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 2.0),
                            )),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 20, right: 20),
                    child: Container(
                      height: 50,
                      child: TextFormField(
                        controller: numberController,
                        onChanged: (value) {
                          // print(value);
                        },
                        onSaved: (value) {
                          setState(() {
                            account3nameModel.AcMobileNo = numberController.text;
                          });
                          print("HELLO");
                          print(value);
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Name cannot be empty';
                          }
                        },
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.supervisor_account),
                            hintText: "Enter Your Mobile Number",
                            labelText: "Your Mobile Number",
                            filled: true,
                            fillColor: Colors.white,
                            focusColor: Colors.green,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 2.0),
                            )),
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                  Center(
                    child: Text("Login Information",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 20, right: 20),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          border: Border.all(color: Colors.grey)),
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      child: CountryCodePicker(
                        initialSelection: "PK",
                        showCountryOnly: true,
                        showOnlyCountryWhenClosed: true,
                        favorite: ['+92', 'PK'],
                        onChanged: (CountryCode countryCod) {
                          countryCode = countryCod;
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 20, right: 20),
                    child: Container(
                      height: 50,
                      child: TextFormField(
                          controller: numberController1,
                        onChanged: (value) {
                          // print(value);
                        },
                        onSaved: (value) {
                          setState(() {
                            account3nameModel.AcContactNo = numberController1.text;
                          });
                          print("HELLO");
                          print(value);
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Name cannot be empty';
                          }
                        },
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.supervisor_account),
                            hintText: "Enter Your Mobile Number",
                            labelText: "Your Mobile Number",
                            filled: true,
                            fillColor: Colors.white,
                            focusColor: Colors.green,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 2.0),
                            )),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width / 1.5,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.black, // background
                              onPrimary: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ) // foreground
                              ),
                          onPressed: () async {
                            print("HELLO");
                            //  print(groupName.text);

                            // print(account2groupModel.AcGroupName);

                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                           Provider.of<DatabaseProvider>(context,listen: false).createAccount3Name(account3nameModel);
                          Provider.of<DatabaseProvider>(context,listen: false).getTable('Account3Name');

                            }
                          },
                          child: Text("Insert")),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
