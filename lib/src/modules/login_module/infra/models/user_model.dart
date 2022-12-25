// ignore_for_file: public_member_api_docs, sort_constructors_first, overridden_fields, annotate_overrides
import 'dart:convert';
import 'package:virtual_shop/src/modules/login_module/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  String? id;
  String? name;
  String? email;
  String? password;
  String? confirmPassword;
  String? adress;
  String? seccondName;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.password,
    this.confirmPassword,
    this.adress,
    this.seccondName,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,        
      'adress': adress,
      'seccondName': seccondName,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      confirmPassword: map['confirmPassword'] != null
          ? map['confirmPassword'] as String
          : null,
      adress: map['adress'] != null ? map['adress'] as String : null,
      seccondName:
          map['seccondName'] != null ? map['seccondName'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
