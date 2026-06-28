import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:self_learn13/model/user.dart';

class ApiService {
  String url = "http://127.0.0.1:3000/users";

  // CRUD Users

  // CREATE -> POST DATA
  Future<void> createUser(int id, String name, String email) async {
    await http.post(
      Uri.parse(url),

      headers: {"Content-Type": "application/json"},

      body: jsonEncode({"id": id, "name": name, "email": email}),
    );
  }

  // READ -> GET DATA
  Future<List<User>> getUser() async {
    // return type have return
    final respone = await http.get(Uri.parse(url));

    if(respone.statusCode == 200){
        
        List data = jsonDecode(respone.body);

        return data.map((e)=> User.fromJson(e)).toList();
    }else{
      throw Exception("Load the error");
    }
  }

  // PUT DATA -> Update data

  Future<void> updateUser(int id, String name, String email) async {
    // store data
    // update by id
    await http.put(
      Uri.parse("$url/$id"),

      headers: {"Content-Type": "application/json"},

      body: jsonEncode({"name": name, "email": email}),
    );
  }

  // Delete

  Future<void> deleteUser(int id) async {
    // store data delete by id
    await http.delete(Uri.parse("$url/$id"));
  }
}
