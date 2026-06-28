import 'dart:convert';

class UserModel {
  final int id;
  final String name;
  final String email;

  UserModel({required this.id, required this.name, required this.email});

  Map<String, dynamic> toJson() {
    return {'id': 101, 'name': "Un vira", 'email': "virakuhs123"};
  }

  // decoded
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(id: json['id'], name: json['name'], email: json['email']);
  }
}

void main() {
  // ===================================
  // Converting JsonEncoded to JsonDecoded
  // =====================================

  // Call user model
  UserModel model = UserModel(
    id: 101,
    name: "Un virak",
    email: "virakuhs123@gmail.com",
  );

  String decoded = jsonEncode(model.toJson());

  print("-----Result-------");
  print("Send to server : $decoded");

  // =========================================
  // Coverting JsonDecoded to JsonEncoded
  // =========================================

  String apiRespone =
      '{"id" : 101, "name" : "Un virak", "email" : "virakuhs123@gmail.com"}';

  Map<String, dynamic> json = jsonDecode(apiRespone);

  UserModel newJson = UserModel.fromJson(json);

  print("Call back to orginal map : $newJson");

}
