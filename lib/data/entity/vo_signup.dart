import 'package:freezed_annotation/freezed_annotation.dart';
part 'vo_signup.g.dart';

@JsonSerializable()
class UserSignup {
  final String email;
  final String nickname;
  // final String email;
  final String military;
  final String startdate;
  final String finishdate;
  final String socialcode;

  UserSignup({
    required this.email,
    required this.nickname,
    // required this.email,
    required this.military,
    required this.startdate,
    required this.finishdate,
    required this.socialcode,

  });
  factory UserSignup.fromJson(Map<String, dynamic> json) =>
      _$UserSignupFromJson(json);
  Map<String, dynamic> toJson() => _$UserSignupToJson(this);
}
