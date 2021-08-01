import 'dart:convert';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class CreateAccount extends StatefulWidget {
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  DateTime selectedDate = DateTime.now();
  bool loading = false;
  String status = '';
  String base64Image = "";
  String fileName = "";
  File? _image = null;
  final picker = ImagePicker();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confPasswordController = TextEditingController();
  final addressController = TextEditingController();
  final birthController = TextEditingController();
  final numberController = TextEditingController();
  final programController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        "Create Account",
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.w500),
                      )),
                ),
                Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "Welcome to your Account",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: InkWell(
                    child: Container(
                      width: 100,
                      height: 100,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: (_image == null)
                            ? Image.asset(
                                "assets/images/easysoft_logo.jpg",
                                fit: BoxFit.fill,
                              )
                            : Image.file(
                                _image!,
                                fit: BoxFit.fill,
                              ),
                      ),
                    ),
                    onTap: () {
                      getImage().then((value) {
                        base64Image = base64Encode(_image!.readAsBytesSync());
                        //fileName=_image.path.split('/').last;
                      });
                    },
                  ),
                ),
                CountryCodePicker(
                  initialSelection: "PK",
                  showCountryOnly: true,
                  showOnlyCountryWhenClosed: true,
                  favorite: ['+92', 'PK'],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                  child: Container(
                    height: 50,
                    child: TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.supervisor_account),
                          hintText: "Full Name",
                          labelText: "Full Name",
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
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Container(
                    height: 50,
                    child: TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          hintText: "Email",
                          labelText: "Email",
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
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Container(
                    height: 50,
                    child: TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                          suffixIcon: Icon(Icons.visibility),
                          prefixIcon: Icon(Icons.lock_outline),
                          labelText: "Password",
                          hintText: "Password",
                          filled: true,
                          fillColor: Colors.white,
                          focusColor: Colors.green,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                  color: Colors.blue,
                                  width: 20,
                                  style: BorderStyle.solid))),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 20, left: 20, right: 20, bottom: 0),
                  child: Container(
                    height: 50,
                    child: TextField(
                      controller: confPasswordController,
                      decoration: InputDecoration(
                          suffixIcon: Icon(Icons.visibility),
                          prefixIcon: Icon(Icons.lock_outline),
                          hintText: "Confirm Password",
                          labelText: "Confirm Password",
                          filled: true,
                          fillColor: Colors.white,
                          focusColor: Colors.green,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                  color: Colors.blue,
                                  width: 20,
                                  style: BorderStyle.solid))),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 20, left: 20, right: 20, bottom: 30),
                  child: Container(
                    height: 50,
                    child: TextField(
                      controller: numberController,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.phone_android),
                          hintText: "Number",
                          labelText: "Number",
                          filled: true,
                          fillColor: Colors.white,
                          focusColor: Colors.green,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                  color: Colors.blue,
                                  width: 20,
                                  style: BorderStyle.solid))),
                    ),
                  ),
                ),
                Container(
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
                      onPressed: () async {},
                      child: Text("Sign Up")),
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }
}
