import 'package:flutter/material.dart';
import 'package:military1km/common/common.dart';
import 'package:military1km/screen/main/tab/profile/info/s_policy.dart';
import 'package:military1km/screen/main/tab/profile/opensource/s_opensource.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: '정보'.text.make(),
      ),
      body: Column(
        children: [
          const Line(),
          ListTile(
            onTap: () async {
              Nav.push(const OpensourceScreen());
            },
            title: 'opensource'.tr().text.make(),
          ),
          const Line(),
          ListTile(
            onTap: () async {
              Nav.push(const PolicyScreen());
            },
            title: '약관 및 정책'.text.make(),
          ),
          const Line(),
        ],
      ),
    );
  }
}
