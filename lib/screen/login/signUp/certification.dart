import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CertificationInput extends StatelessWidget {
  final ValueChanged<String> onCodeChanged;

  const CertificationInput({super.key, required this.onCodeChanged});
  @override
  Widget build(BuildContext context) {
    final List<TextEditingController> controllers =
        List.generate(6, (_) => TextEditingController());

    for (var controller in controllers) {
      controller.addListener(() {
        final code = controllers.map((e) => e.text).join();
        onCodeChanged(code);
      });
    }

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
                    controller: controllers[index],
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
