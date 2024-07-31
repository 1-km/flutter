import 'package:flutter/material.dart';
import 'package:military1km/common/common.dart';

class PasswordInput extends StatelessWidget {
  const PasswordInput({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Height(100),
        '비밀번호를 입력해주세요'.text.size(30).make(),
        '1번만 입력하니 신중하게 입력해주세요!'
            .text
            .size(14)
            .color(context.appColors.hintText)
            .make(),
        const SizedBox(height: 100),
        TextField(
          decoration: InputDecoration(
            hintText: 'asdf1234@team.alpha',
            hintStyle: TextStyle(
              fontSize: 24,
              color: context.appColors.hintText,
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: context.appColors.hintText),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
        ),
      ],
    ).p(23);
  }
}
