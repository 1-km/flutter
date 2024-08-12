import 'package:freezed_annotation/freezed_annotation.dart';
part 'vo_user.g.dart';

@JsonSerializable()
class UserData {
  final String uid;
  final String nickname;
  // final String email;
  final String profileImage;
  final String address;

  UserData({
    required this.uid,
    required this.nickname,
    // required this.email,
    required this.profileImage,
    required this.address,
  });
  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}
