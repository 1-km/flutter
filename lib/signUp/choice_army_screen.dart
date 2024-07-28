import 'package:flutter/material.dart';


class ChoiceInputPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(23.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 100),
          Text(
            '어디를 지키고 있나요?',
            style: const TextStyle(
                color: Colors.white,
                fontSize: 30,
            ),
          ),
          const SizedBox(height: 100),
          Center(

              child: ArmyChoiceCard(text: '강한친구', military: ' 육군', image: 'assets/image/signUp/army.png'),

          ),
          SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ChoiceCard(text: '바다로, 세계로!', military: '\n해군', image: 'assets/image/signUp/navy.png'),
              SizedBox(width: 15,),
              ChoiceCard(text: '가장 높은 힘!', military: '\n공군', image: 'assets/image/signUp/air_force.png'),
            ],
          ),
        ],
      ),
    );
  }
}

class ChoiceCard extends StatelessWidget {
  final String text;
  final String military;
  final String image;

  ChoiceCard({required this.text, required this.military, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 167.5,
      height: 170,
      decoration: BoxDecoration(
        color: Color(0xFF898A8D),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0,),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: text,
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    TextSpan(
                      text: military,
                      style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),

          SizedBox(width: 2.0,),
          Expanded(
            child: Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Image.asset(
                  image,
                  width: 100, // 이미지의 너비 설정
                  height: 500, // 이미지의 높이 설정
                  fit: BoxFit.cover, // 이미지의 크기 조정 방식 설정
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ArmyChoiceCard extends StatelessWidget {
  final String text;
  final String military;
  final String image;

  ArmyChoiceCard({required this.text, required this.military, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 170,
      decoration: BoxDecoration(
        color: Color(0xFF898A8D),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 32.0, left: 30.0),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: text,
                        style: TextStyle(color: Colors.black, fontSize: 32),
                      ),
                      TextSpan(
                        text: military,
                        style: TextStyle(color: Colors.black, fontSize: 32, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),

          SizedBox(width: 8.0,),
          Image.asset(
            image,
            width: 100, // 이미지의 너비 설정
            height: 150, // 이미지의 높이 설정
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}