import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:nav/nav.dart';
import 'package:military1km/common/common.dart';
import 'package:military1km/screen/login/s_login.dart';
import 'package:military1km/common/model/login_platform.dart';

import 'choice_army_screen.dart';
import 'certification.dart';
import 'password_input.dart';
import 'input_screen.dart';
import 'military_service_dates.dart';

final emailProvider = StateProvider<String>((ref) => '');
final codeProvider = StateProvider<String>((ref) => '');

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  int _currentIndex = 0;
  bool _isLoading = false;

  final List<Widget> _pages = [];

  final List<Widget> _oauth2LoginPages = [];

  void _nextPage() async {
    setState(() {
      _isLoading = true;
    });
    if (_currentIndex == 0 && _isEmailLogin()) {
      await _sendEmail(ref.read(emailProvider));
      setState(() {
        _isLoading = false;
      });
    } else if (_currentIndex == 2 && _isEmailLogin()) {
      await _verifyCode(ref.read(emailProvider), ref.read(codeProvider));
    }
    setState(() {
      _isLoading = false;
      if (_currentIndex <
          (_isEmailLogin() ? _pages.length : _oauth2LoginPages.length) - 1) {
        _currentIndex++;
      } else {
        ref.read(loginPlatformProvider.notifier).state = LoginPlatform.none;
        Nav.push(const LoginScreen());
      }
    });
  }

  void _previousPage() {
    setState(() {
      if (_currentIndex > 0) {
        _currentIndex--;
      }
    });
  }

  int _getIndicatorIndex() {
    if (_isEmailLogin()) {
      if (_currentIndex < 4) {
        return 0;
      } else if (_currentIndex == 4) {
        return 1;
      } else if (_currentIndex == 5) {
        return 2;
      } else {
        return 3;
      }
    } else {
      int totalSteps = _oauth2LoginPages.length;
      if (_currentIndex < totalSteps) {
        return _currentIndex;
      } else {
        return totalSteps - 1;
      }
    }
  }

  bool _isEmailLogin() {
    final loginPlatform = ref.read(loginPlatformProvider);
    return loginPlatform == LoginPlatform.none;
  }

  void _goToLoginPage() {
    ref.read(loginPlatformProvider.notifier).state = LoginPlatform.none;
    Navigator.pop(context); // 로그인 페이지로 이동
  }

  Future<void> _sendEmail(String email) async {
    const emulatorIp = '10.0.2.2:8080';
    const simulatorIp = '127.0.0.1:8080';

    final ip = Platform.isIOS ? simulatorIp : emulatorIp;

    try {
      final response = await http.post(
        Uri.parse('http://$ip/api/email/send'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': email,
        }),
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('이메일 인증을 위해 이메일 ${email} 로 인증번호가 발송 되었습니다. ')),
        );
      } else {
        SnackBar(content: Text('이메일 발송이 실패 하였습니다.'));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('이메일 발송이 실패하였습니다 이유 : $e')),
      );
      print(e);
    }
  }

  Future<void> _verifyCode(String email, String code) async {
    const emulatorIp = '10.0.2.2:8080';
    const simulatorIp = '127.0.0.1:8080';

    final ip = Platform.isIOS ? simulatorIp : emulatorIp;

    print("email= $email");
    print("code= $code");

    try {
      final response = await http.get(
        Uri.parse(
            'http://$ip/api/email/verify?email=$email&certificationNumber=$code'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('이메일 인증이 완료되었습니다.')),
        );
      } else {
        SnackBar(content: Text('이메일 인증에 실패 하였습니다.'));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('이메일 인증에 실패 하였습니다 이유 : $e')),
      );
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    _pages.addAll([
      InputScreen(
        title: '이메일 알려주세요:)',
        hintText: 'asdf1234@team.alpha',
        onEmailChanged: (String email) {
          ref.read(emailProvider.notifier).state = email;
        },
      ),
      const PasswordInput(),
      CertificationInput(
        onCodeChanged: (String code) {
          ref.read(codeProvider.notifier).state = code;
        },
      ),
      InputScreen(
        title: '닉네임을 알려주세요:)',
        hintText: '동해지킴이',
        onEmailChanged: (String text) {},
      ),
      const ChoiceInputPage(),
      InputScreen(
        title: '현재 소속되어 있는\n부대를 알려주세요.',
        hintText: '알파부대',
        onEmailChanged: (String text) {},
      ),
      const ServiceDateScreen(),
    ]);

    _oauth2LoginPages.addAll([
      InputScreen(
          title: '닉네임을 알려주세요:)',
          hintText: '동해지킴이',
          onEmailChanged: (String text) {}),
      ChoiceInputPage(),
      InputScreen(
          title: '현재 소속되어 있는\n부대를 알려주세요.',
          hintText: '알파부대',
          onEmailChanged: (String text) {}),
      ServiceDateScreen(),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: _getIndicatorIndex() != 0
              ? const Icon(Icons.arrow_back, color: Colors.white)
              : const Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 40,
                ),
          onPressed: _getIndicatorIndex() != 0 ? _previousPage : _goToLoginPage,
        ),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(4, (index) {
            return Row(
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: _getIndicatorIndex() == index
                          ? Colors.white
                          : const Color(0xFFD9D9D9).withOpacity(0.5),
                      width: 2,
                    ),
                    color: Colors.transparent,
                  ),
                  child: '${index + 1}'.text.size(14).make().centered(),
                ),
                if (index != 3)
                  Container(
                    width: 18,
                    height: 2,
                    color: const Color(0xFFD9D9D9).withOpacity(0.5),
                  ),
              ],
            );
          }),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: _isEmailLogin()
                    ? _pages[_currentIndex]
                    : _oauth2LoginPages[_currentIndex]),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: _isLoading ? null : _nextPage,
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFC2FF49),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    fixedSize: const Size(400, 50)),
                child: _isLoading
                    ? CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      )
                    : Text(
                        _currentIndex ==
                                (_isEmailLogin()
                                        ? _pages.length
                                        : _oauth2LoginPages.length) -
                                    1
                            ? '완료'
                            : '다음',
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.black)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
