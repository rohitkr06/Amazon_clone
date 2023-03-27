import 'dart:convert';

class User {
  final String name;
  final String token;
  final String email;
  final String password;
  final String id;
  final String address;
  final String type;

  User(
    this.name,
    this.token,
    this.email,
    this.password,
    this.id,
    this.address,
    this.type,
  );

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'token': token,
      'email': email,
      'password': password,
      'id': id,
      'address': address,
      'type': type,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      map['name'] ?? '',
      map['token'] ?? '',
      map['email'] ?? '',
      map['password'] ?? '',
      map['_id'] ?? '',
      map['address'] ?? '',
      map['type'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
