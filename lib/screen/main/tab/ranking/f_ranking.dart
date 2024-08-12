import 'package:flutter/material.dart';

class RankingFragment extends StatelessWidget {
  const RankingFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Ranking'), automaticallyImplyLeading: false),
    );
  }
}
