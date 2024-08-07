// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vo_signup.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserSignup _$UserSignupFromJson(Map<String, dynamic> json) => UserSignup(
      email: json['email'] as String,
      password: json['password'] as String,
      nickname: json['nickname'] as String,
      military: json['military'] as String,
      startdate: json['startdate'] as String,
      finishdate: json['finishdate'] as String,
    //  socialcode: json['socialcode'] as String,
    );

Map<String, dynamic> _$UserSignupToJson(UserSignup instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password' : instance.password,
      'nickname': instance.nickname,
      'military': instance.military,
      'startdate': instance.startdate,
      'finishdate': instance.finishdate,
      //'socialcode': instance.socialcode,
    };
