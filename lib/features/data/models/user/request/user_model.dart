

import 'package:agropecuariosapp/features/domain/entities/user/request/user.entity.dart';

class UserModel extends UserEntity{
  final String? uid;
  final String? username;
  final String? email;



   UserModel({
    this.uid,
    this.username,
    this.email,
  }) : super(
    uid: uid,
    username: username,
    email: email,

  );


  Map<String, dynamic> toJson() => {
    "uid": uid,
    "email": email,
    "username": username,
  };
  
}