import 'package:flutter/material.dart';


class PasswordInput extends StatelessWidget {
  const PasswordInput({super.key});
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(23.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 100),
          Text(
            '비밀번호를 입력해주세요',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
          ),
          Text(
            '1번만 입력하니 신중하게 입력해주세요!',
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 100),
          TextField(
            decoration: InputDecoration(
              hintText: 'asdf1234@team.alpha',
              hintStyle: TextStyle(
                fontSize: 24,
                color: Colors.grey,
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}








