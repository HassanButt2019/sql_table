
import 'package:flutter/material.dart';
import 'package:flutter_sqllite_table_view/models/account2group.dart';
import 'package:flutter_sqllite_table_view/models/accountType.dart';
import 'package:flutter_sqllite_table_view/providers/sqlite_database_provider.dart';
import 'package:provider/provider.dart';

class Account2Group extends StatefulWidget {
  const Account2Group({Key? key}) : super(key: key);

  @override
  _Account2GroupState createState() => _Account2GroupState();
}

class _Account2GroupState extends State<Account2Group> {
  final _formKey = GlobalKey<FormState>();
  final groupName = TextEditingController();
  Account2GroupModel account2groupModel  = Account2GroupModel();
  AccountType accountTypes = AccountType();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Account 2 Group"),
        ),
        body: ListView(
          children: [
            Form(
                key: _formKey,
                child: Column(
                  children: [

                    FutureBuilder<List<AccountType>>(
                      future: Provider.of<DatabaseProvider>(context,listen: false).fetchAccountTypes(),
                      builder: (context , snapshot){
                        return DropdownButton<AccountType>(
                          
                          value: snapshot.data!.last,
                          items: snapshot.data!.map((item){
                            
                            return DropdownMenuItem<AccountType>(
                              child: Text(item.AcTypeName.toString()),
                              value: item,
                              
                              );
                          }).toList(),
                          onChanged: (value){
                            setState(() {
                              accountTypes = value!;
                              print(accountTypes.AcTypeName);
                            });
                          },

                          );
                      }),
                     Padding(
                      padding:
                      const EdgeInsets.only(top: 10, left: 20, right: 20),
                      child: Container(
                        height: 50,
                        child:TextFormField(
                          controller: groupName,
                          onChanged: (value){
                           // print(value);
                          },
                          onSaved: (value){

                            setState(() {
                              account2groupModel.AcGroupName = groupName.text;

                            });

                            print("HELLO");
                            print(value);

                          },
                          validator: (value){
                            if(value!.isEmpty) {
                              return 'Name cannot be empty';
                            }
                          },
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.supervisor_account),
                              hintText: "Enter Group Name",
                              labelText: "Account Group Name",
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
                              print(groupName.text);
                              

                                print(account2groupModel.AcGroupName);

                                if(_formKey.currentState!.validate())
                                {

                                  _formKey.currentState!.save();

                                 Provider.of<DatabaseProvider>(context,listen: false).createAccount2Group(account2groupModel);
                                 Provider.of<DatabaseProvider>(context,listen: false).fetchAccountTypes();
                                 groupName.clear();
                                }
                            },
                            child: Text("Insert")),
                      ),
                    ),
                  ],
                )),
          ],
        ));
  }
}
