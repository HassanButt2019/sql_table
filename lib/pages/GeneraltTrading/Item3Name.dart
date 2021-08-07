

import 'package:flutter/material.dart';
import 'package:flutter_sqllite_table_view/models/item3name.dart';
import 'package:flutter_sqllite_table_view/providers/sqlite_database_provider.dart';
import 'package:provider/provider.dart';

class Item3Name extends StatefulWidget {
  const Item3Name({ Key? key }) : super(key: key);

  @override
  _Item3NameState createState() => _Item3NameState();
}

class _Item3NameState extends State<Item3Name> {
  Item3NameModel i3n = Item3NameModel();

  final _formKey = GlobalKey<FormState>();
  final itemName = TextEditingController();
  final salePrice = TextEditingController();
  final itemCode = TextEditingController();
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

                    // FutureBuilder<List<AccountType>>(
                    //   future: Provider.of<DatabaseProvider>(context,listen: false).fetchAccountTypes(),
                    //   builder: (context , snapshot){
                    //     return DropdownButton<AccountType>(
                          
                    //       value: snapshot.data!.last,
                    //       items: snapshot.data!.map((item){
                            
                    //         return DropdownMenuItem<AccountType>(
                    //           child: Text(item.AcTypeName.toString()),
                    //           value: item,
                              
                    //           );
                    //       }).toList(),
                    //       onChanged: (value){
                    //         setState(() {
                    //           accountTypes = value!;
                    //           print(accountTypes.AcTypeName);
                    //         });
                    //       },

                    //       );
                    //   }),
                     Padding(
                      padding:
                      const EdgeInsets.only(top: 10, left: 20, right: 20),
                      child: Container(
                        height: 50,
                        child:TextFormField(
                          controller: itemName,
                          onChanged: (value){
                           // print(value);
                          },
                          onSaved: (value){

                            setState(() {
                              i3n.itemName = itemName.text;
                             // i2g.Item2GroupName = itemName.text;
                            //  account2groupModel.AcGroupName = groupName.text;

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
                      padding:
                      const EdgeInsets.only(top: 10, left: 20, right: 20),
                      child: Container(
                        height: 50,
                        child:TextFormField(
                          controller: salePrice,
                          onChanged: (value){
                           // print(value);
                          },
                          onSaved: (value){

                            setState(() {
                              i3n.salePrice = salePrice.text;
                            //  i2g.Item2GroupName = itemName.text;
                            //  account2groupModel.AcGroupName = groupName.text;

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
                              hintText: "Enter Sale Price",
                              labelText: "Sale Price",
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
                        child:TextFormField(
                          controller: itemCode,
                          onChanged: (value){
                           // print(value);
                          },
                          onSaved: (value){

                            setState(() {
                              i3n.itemCode = itemCode.text;
                             // i2g.Item2GroupName = itemName.text;
                            //  account2groupModel.AcGroupName = groupName.text;

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
                              hintText: "Enter Item Code",
                              labelText: "Item Code",
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
                              // print(groupName.text);
                              

                              //  print(account2groupModel.AcGroupName);

                                if(_formKey.currentState!.validate())
                                {

                                  _formKey.currentState!.save();

                                 Provider.of<DatabaseProvider>(context,listen: false).createItem3name(i3n);
                                 Provider.of<DatabaseProvider>(context,listen: false).getTable('Item3Name');
                                 
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