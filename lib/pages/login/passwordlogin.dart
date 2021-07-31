import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';

class PasswordLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Container(
            height: 350,
            width: 320,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Login With Password",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  CountryCodePicker(
                    initialSelection: "PK",
                    showCountryOnly: true,
                    showOnlyCountryWhenClosed: true,
                    favorite: ['+92', 'PK'],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: Container(
                      height: 30,
                      child: TextFormField(
                          decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        hintText: "Enter Email or password",
                        labelText: "Enter Email or password",
                        filled: true,
                        fillColor: Colors.white,
                        focusColor: Colors.green,
                      )),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: Container(
                      height: 50,
                      child: TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.vpn_key),
                          suffixIcon: Icon(Icons.visibility),
                          hintText: "password",
                          labelText: "password",
                          filled: true,
                          fillColor: Colors.white,
                          focusColor: Colors.green,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Center(
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
                          onPressed: () async {},
                          child: Text("Log In")),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
