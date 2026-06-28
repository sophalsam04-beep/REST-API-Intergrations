// REST API

// Import headle file
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

// CRUD
// GET DATA

Future<void> getUser() async {
  // store data
  final respone = await http.get(Uri.parse("http://localhost:3000/users"));

  // checking status code === 200 OK Server succesfully

  if (respone.statusCode == 200) {
    print(respone.body);
  }
}

// POST Request -> Update Server
Future<void> createUser() async {
  // store data
  final respone = await http.post(
    Uri.parse("http://localhost:3000/users"),
    headers: {
      // content Type
      "Content-Type": "application/json",
    },

    // Json Encoded
    body: jsonEncode({'username': "Un vira", 'password': "virakuhs123"}),
  );

  print(respone.body);
}

// PUT Request -> Update data
Future<void> updateUser() async {
  // store data
  final respone = await http.put(
    Uri.parse("http://localhost:3000/users"),
    headers: {"Content-Type": "application/json"},

    body: jsonEncode({"username": "Sam sophal"}),
  );
}

// Delete Request -> deleta data
Future<void> deleteUser() async {
  // store data
  final respone = await http.delete(Uri.parse("http://localhost:3000/users"));
}



          // Json Decoded

          
      