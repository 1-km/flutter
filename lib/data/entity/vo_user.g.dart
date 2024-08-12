// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vo_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      uid: json['uid'] as String,
      nickname: json['nickname'] as String,
      profileImage: json['profileImage'] as String,
      address: json['address'] as String,
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'uid': instance.uid,
      'nickname': instance.nickname,
      'profileImage': instance.profileImage,
      'address': instance.address,
    };
