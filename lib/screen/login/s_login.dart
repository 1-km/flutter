import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:military1km/common/common.dart';
import 'package:military1km/screen/login/signUp/s_sign_up.dart';
import 'package:military1km/screen/login/auth_service.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

Widget buildSocialLoginButton({
  required VoidCallback onTap,
  required Color buttonColor,
  required String imagePath,
  required String text,
  required Color textColor,
}) {
  return Tap(
    onTap: onTap,
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: buttonColor,
      ),
      width: 330,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            height: 50,
          ),
          width30,
          text.text.size(17).color(textColor).make(),
          width50,
        ],
      ),
    ),
  ).pSymmetric(v: 8);
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  late AuthService _authService;

  @override
  void initState() {
    super.initState();
    _authService = AuthService(ref);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Image.asset('assets/image/logo.png').centered(),
          Positioned(
            left: 0,
            right: 0,
            bottom: 50,
            child: Column(
              children: [
                buildSocialLoginButton(
                  onTap: () => _authService.signInWithGoogle(context),
                  buttonColor: const Color(0xFFFFFFFF),
                  imagePath: 'assets/image/socialLogin/google.png',
                  text: 'Sign in with google',
                  textColor: Colors.black,
                ),
                buildSocialLoginButton(
                  onTap: () => _authService.signInWithKaKao(context),
                  buttonColor: const Color(0xFFFEE500),
                  imagePath: 'assets/image/socialLogin/kakao.png',
                  text: 'Sign in with kakao',
                  textColor: Colors.black,
                ),
                buildSocialLoginButton(
                  onTap: () => _authService.signInWithNaver(context),
                  buttonColor: const Color(0xFF03C75A),
                  imagePath: 'assets/image/socialLogin/naver.png',
                  text: 'Sign in with Naver',
                  textColor: Colors.white,
                ),
                TextButton(
                  onPressed: () => Nav.push(const SignUpScreen()),
                  child: 'Sign in with Email'
                      .text
                      .size(15)
                      .color(context.appColors.veryBrightGrey)
                      .underline
                      .make(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
