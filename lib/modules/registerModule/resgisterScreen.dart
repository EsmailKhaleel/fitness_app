// ignore_for_file: sized_box_for_whitespace, use_key_in_widget_constructors, must_be_immutable, prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegisterScreen extends StatelessWidget {
  Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': '*/*',
  };
  final signinMsg = {"email": "esmail@gmail.com", "password": "12345678"};

  final Map<String, dynamic> regitserMsg = {
    "confirmPassword": "123456789",
    "email": "esmailkhaleel@gmail.com",
    "firstName": "esmail",
    "lastName": "khaleel",
    "password": "123456789",
    "id": 9999,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Regiser Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                child: Text('Sign In Now'),
                onPressed: () {
                  var response = http
                      .post(
                        Uri.parse("http://192.168.1.11:8080/api/login"),
                        body: jsonEncode(signinMsg),
                        headers: headers,
                      )
                      .then((value) => print(value.body.toString()))
                      .catchError((onError) {
                    print(onError.toString());
                  });
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                child: Text('Regiser Now'),
                onPressed: () {
                  var response = http
                      .post(
                        Uri.parse("http://192.168.1.11:8080/api/register"),
                        body: jsonEncode(regitserMsg),
                        headers: headers,
                      )
                      .then((value) => print(value.body.toString()))
                      .catchError((onError) {
                    print(onError.toString());
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
