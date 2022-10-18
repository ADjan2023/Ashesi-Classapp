import 'package:flutter/material.dart';

class SignUpModel {
  String? email;
  String? school_id;
  String? uid;

  SignUpModel({this.email, this.school_id, this.uid});

  factory SignUpModel.fromMap(map) {
    return SignUpModel(
        email: map['email'], school_id: map['school_id'], uid: map['uid']);
  }
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'school_id': school_id,
    };
  }
}
