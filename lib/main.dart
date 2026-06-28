// Learning about JsonEncode and JsonDecoded
import 'dart:convert';

void main() {
  // ==========================
  // JsonEncoded : converting object / map into Json String
  // ==========================
  Map<String, dynamic> users = {'id': 101, 'name': "Un vira", 'age': 38};

  // converting into JSON String
  // store data
  String data = jsonEncode(users);
  print("======Result=======");
  print(data);

  // =================================
  // JsonDecoded : Converting JSON String back to original items / Map / object / array
  // =================================

  // store data
  String responeFromServer = '{"id" : 101, "name" : "Un virak", "age" : 38}';

  // converting
  Map<String, dynamic> json = jsonDecode(responeFromServer);
  print("-----Result-----");

  print("name : ${json['name']}");
  print("age : ${json['age']}");
}
