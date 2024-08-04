import 'dart:io';
import 'package:flutter/material.dart';

class InputScreen extends StatelessWidget {
  final String title;
  final String hintText;
  final ValueChanged<String> onEmailChanged;

  const InputScreen(
      {super.key,
      required this.title,
      required this.hintText,
      required this.onEmailChanged});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();

    _controller.addListener(() {
      onEmailChanged(_controller.text);
    });

    return Padding(
      padding: const EdgeInsets.all(23.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 100),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
          ),
          const SizedBox(height: 100),
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(
                fontSize: 24,
                color: Colors.grey,
              ),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
