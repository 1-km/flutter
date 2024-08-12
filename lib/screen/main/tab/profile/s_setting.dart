import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:military1km/common/common.dart';
import 'package:military1km/screen/dialog/d_message.dart';
import 'package:military1km/screen/login/signUp/s_sign_up.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

void deleteUserData() async {}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: '설정'.text.make(),
      ),
      body: Column(
        children: [
          const Line(),
          ListTile(
            onTap: () async {
              final manager = DefaultCacheManager();
              await manager.emptyCache();
              if (mounted) {
                MessageDialog('캐시 삭제완료'.tr()).show();
              }
            },
            title: '캐시 삭제'.tr().text.make(),
          ),
          const Line(),
          ListTile(
            onTap: () {
              launchUrl(Uri.parse("https://open.kakao.com/o/s6wDvVbg"));
            },
            title: '고객 문의'.text.make(),
          ),
          const Line(),
          ListTile(
            onTap: () {
              showDialog(
                context: context,
                barrierDismissible: false, // 다이얼로그 이외의 바탕 눌러도 안꺼지도록 설정
                builder: (BuildContext context) {
                  return CupertinoAlertDialog(
                    title: const Text(
                      '계정을 삭제하시겠습니까?',
                    ),
                    actions: [
                      TextButton(
                        child: const Text('확인'),
                        onPressed: () {
                          // 계정 삭제 함수
                          deleteUserData();
                          Nav.push(const SignUpScreen());
                        },
                      ),
                      TextButton(
                        child: const Text('취소'),
                        onPressed: () {
                          Nav.pop(context);
                        },
                      ),
                    ],
                  );
                },
              );
            },
            title: '계정 삭제'.text.color(Colors.red).make(),
          ),
          const Line(),
        ],
      ),
    );
  }
}
