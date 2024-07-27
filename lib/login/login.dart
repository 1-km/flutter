import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Widget buildElevatedButton(String imagePath, String text, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          fixedSize: Size(400, 60),
          backgroundColor: Color(0xFFF0F0F0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath),
            SizedBox(width: 10,),
            Text(
              text,
              style: TextStyle(
                fontSize: 20,
                color: Color(0xFF334155),
              ),
            ),
          ],
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(
            child: Image.asset('assets/image/logo.png'),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 50,
            child: Column(
              children: [
                buildElevatedButton(
                    'assets/image/socialLogin/google.png',
                    'Sign in with Google',
                     (){},
                ),
                buildElevatedButton(
                    'assets/image/socialLogin/naver.png',
                    'Sign in with Naver',
                    (){},
                ),
                buildElevatedButton(
                    'assets/image/socialLogin/kakao.png',
                    'Sign in with KaKao',
                    (){},
                ),
                TextButton(
                    onPressed: (){},
                    child: Text(
                      'Sign in with Email',
                      style: TextStyle(
                        color: Color(0xFFD9D9D9),
                        decoration: TextDecoration.underline,
                        decorationColor: Color(0xFFD9D9D9), // 밑줄 색상 설정
                        decorationThickness: 1.5, // 밑줄 두께 설정
                      ),
                    ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
