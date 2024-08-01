import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:nav/nav.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:flutter_naver_login/flutter_naver_login.dart';
import 'package:military1km/common/model/login_platform.dart';
import 'package:military1km/screen/login/signUp/s_sign_up.dart';
import 'package:military1km/screen/main/s_main.dart';

class AuthService {
  final WidgetRef ref;
  AuthService(this.ref);

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
    serverClientId: dotenv.get("SERVER_CLIENT_ID"),
  );

  Future<void> signInWithGoogle(BuildContext context) async {
    await _signIn(
      context: context,
      signInMethod: () async {
        final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
        if (googleUser == null) {
          throw Exception('Sign in cancelled by user');
        }
        final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
        return googleAuth.idToken;
      },
      authProvider: 'google',
      loginPlatform: LoginPlatform.google,
    );
  }

  Future<void> signInWithKaKao(BuildContext context) async {
    await _signIn(
      context: context,
      signInMethod: () async {
        OAuthToken token;
        if (await isKakaoTalkInstalled()) {
          try {
            token = await UserApi.instance.loginWithKakaoTalk();
          } catch (e) {
            token = await UserApi.instance.loginWithKakaoAccount(prompts: [Prompt.create]);
          }
        } else {
          token = await UserApi.instance.loginWithKakaoAccount();
        }
        return token.accessToken;
      },
      authProvider: 'kakao',
      loginPlatform: LoginPlatform.kakao,
    );
  }

  Future<void> signInWithNaver(BuildContext context) async {
    await _signIn(
      context: context,
      signInMethod: () async {
        final NaverLoginResult naverUser = await FlutterNaverLogin.logIn();
        final NaverAccessToken naverAccessToken = await FlutterNaverLogin.currentAccessToken;
        return naverAccessToken.accessToken;
      },
      authProvider: 'naver',
      loginPlatform: LoginPlatform.naver,
    );
  }

  Future<void> _signIn({
    required BuildContext context,
    required Future<String?> Function() signInMethod,
    required String authProvider,
    required LoginPlatform loginPlatform,
  }) async {
    const emulatorIp = '10.0.2.2:8080';
    const simulatorIp = '127.0.0.1:8080';

    final ip = Platform.isIOS ? simulatorIp : emulatorIp;

    try {
      final idToken = await signInMethod();
      if (idToken == null) {
        print('로그인 취소');
        return;
      }

      print('IdToken : $idToken');

      final response = await http.post(
        Uri.parse('http://$ip/api/auth/$authProvider'),
        headers: <String, String>{
          'Content-Type' : 'application/json',
        },
        body: jsonEncode(<String, String>{
          'idToken' : idToken,
        }),
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if(response.statusCode == 200) {
        //인증 성공
        final Map<String, dynamic> responseBody = jsonDecode(response.body);
        final String grantType = responseBody['grantType'];
        final String accessToken = responseBody['accessToken'];
        final String refreshToken = responseBody['refreshToken'];

        //Jwt 토큰 hive에 저장
        var box = Hive.box('tokens');
        await box.put('jwtGrantType', grantType);
        await box.put('jwtAccessToken', accessToken);
        await box.put('jwtRefreshToken', refreshToken);

        print('JWT Grant Type saved: $grantType');
        print('JWT Access Token saved: $accessToken');
        print('JWT Refresh Token saved: $refreshToken');

        Nav.push(MainScreen());
      } else if(response.statusCode == 401){
        ref.read(loginPlatformProvider.notifier).state = loginPlatform;
        //회원가입 페이지로 이동
        Nav.push(SignUpScreen());
      } else {
        print('에러 코드: ${response.statusCode}');
      }
    } catch (error) {
      print('login 에러: $error');
    }
  }

}