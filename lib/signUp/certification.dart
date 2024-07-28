import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class CertificationInput extends StatelessWidget {
  const CertificationInput({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(23.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 100),
          const Text(
            '인증번호를 입력해주세요',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          const Text(
            '이메일 메일함을 확인해주세요!',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 100),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              6,
                  (index) => Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: TextField(
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white, fontSize: 24),
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    obscureText: true,
                    obscuringCharacter: '●',
                    decoration: const InputDecoration(
                      counterText: '',
                      border: InputBorder.none,
                    ),
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}