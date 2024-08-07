import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:military1km/common/common.dart';
import 's_sign_up.dart';

class ChoiceInputPage extends ConsumerWidget {
  const ChoiceInputPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedMilitary = ref.watch(selectedMilitaryProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Height(20),
        const Text(
          '어디를 지키고 있나요?',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
        const Height(20),
        Center(
          child: GestureDetector(
            onTap: () {
              ref.read(selectedMilitaryProvider.notifier).state = '육군';
              },
    child : ArmyChoiceCard(
              text: '강한친구',
              military: ' 육군',
              image: 'assets/image/signUp/army.png',
              isSelected: selectedMilitary == '육군'),
        ),
    ),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
  onTap: () {
    ref.read(selectedMilitaryProvider.notifier).state = '해군';
  },
  child : ChoiceCard(
                text: '바다로, 세계로!',
                military: '\n해군',
                image: 'assets/image/signUp/navy.png',
      isSelected: selectedMilitary == '해군'),
  ),
            const SizedBox(
              width: 15,
            ),
            GestureDetector(
  onTap: (){
    ref.read(selectedMilitaryProvider.notifier).state = '공군';
  },
    child: ChoiceCard(
                text: '가장 높은 힘!',
                military: '\n공군',
                image: 'assets/image/signUp/air_force.png',
        isSelected: selectedMilitary == '공군'),
  ),
          ],
        ),
      ],
    ).p(23);
  }
}

class ChoiceCard extends StatelessWidget {
  final String text;
  final String military;
  final String image;
  final bool isSelected;

  const ChoiceCard(
      {super.key,
      required this.text,
      required this.military,
      required this.image,
      required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 167.5,
      height: 170,
      decoration: BoxDecoration(
        color: isSelected ? Colors.white : const Color(0xFF898A8D),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 20.0,
              ),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: text,
                      style: const TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    TextSpan(
                      text: military,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 2.0,
          ),
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
  final bool isSelected;

  const ArmyChoiceCard(
      {super.key,
      required this.text,
      required this.military,
      required this.image,
      required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 170,
      decoration: BoxDecoration(
        color: isSelected ? Colors.white : const Color(0xFF898A8D),
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
                      style: const TextStyle(color: Colors.black, fontSize: 32),
                    ),
                    TextSpan(
                      text: military,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 32,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 8.0,
          ),
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
