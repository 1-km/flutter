// 로그인 분기 처리
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum LoginPlatform {
  google,
  kakao,
  naver,
  apple,
  none, // logout
}

final loginPlatformProvider = StateProvider<LoginPlatform>((ref) {
  return LoginPlatform.none;
});