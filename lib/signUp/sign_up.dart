import 'package:flutter/material.dart';

import 'choice_army_screen.dart';
import 'certification.dart';
import 'password_input.dart';
import 'input_screen.dart';
import 'military_service_dates.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    InputScreen(title: '이메일 알려주세요:)', hintText: 'asdf1234@team.alpha'),
    PasswordInput(),
    CertificationInput(),
    InputScreen(title: '닉네임을 알려주세요:)', hintText: '동해지킴이'),
    ChoiceInputPage(),
    InputScreen(title: '현재 소속되어 있는\n부대를 알려주세요.', hintText: '알파부대'),
    ServiceDateScreen(),
  ];

  void _nextPage() {
    setState(() {
      if (_currentIndex < _pages.length - 1) {
        _currentIndex++;
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
    if (_currentIndex < 4) {
      return 0;
    } else if( _currentIndex == 4 ) {
      return 1;
    } else if( _currentIndex == 5 ) {
      return 2;
    }else {
      return 3;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: _getIndicatorIndex() != 0 ? Icon(Icons.arrow_back, color: Colors.white) :
                Icon(Icons.close, color: Colors.white, size: 40,),
                onPressed: _getIndicatorIndex() == 1 ? _previousPage : _previousPage,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(top: 12.0), // 여기에 패딩을 추가하여 위치를 아래로 조정
                child: Row(
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
                              color: _getIndicatorIndex() == index ? Colors.white : Color(0xFFD9D9D9).withOpacity(0.5),
                              width: 2,
                            ),
                            color: Colors.transparent,
                          ),
                          child: Center(
                            child: Text(
                              '${index + 1}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                        if (index != 3)
                          Container(
                            width: 18,
                            height: 2,
                            color: Color(0xFFD9D9D9).withOpacity(0.5),
                          ),
                      ],
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: _pages[_currentIndex]),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: _nextPage,
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFC2FF49),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  fixedSize: Size(400, 50)
              ),
              child: Text(
                  _getIndicatorIndex() == 3 ? '완료' : '다음',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black
                  )
              ),
            ),
          ),
        ],
      ),
    );
  }
}