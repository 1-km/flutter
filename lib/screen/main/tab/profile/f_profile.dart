import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:military1km/common/common.dart';
import 'package:military1km/screen/main/tab/profile/info/s_info.dart';
import 'package:military1km/screen/main/tab/profile/s_setting.dart';
import 'package:military1km/screen/main/tab/profile/w_profile_ui.dart';

class ProfileFragment extends StatelessWidget {
  const ProfileFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ProfileUiWidget(),
            const Height(40),
            // MENU
            ProfileMenuWidget(
              title: '설정',
              icon: FontAwesomeIcons.gear,
              onPress: () => Nav.push(const SettingScreen()),
            ),
            ProfileMenuWidget(
              title: '정보',
              icon: FontAwesomeIcons.info,
              onPress: () => Nav.push(const InfoScreen()),
            ),
            ProfileMenuWidget(
              title: '로그아웃',
              icon: FontAwesomeIcons.rightFromBracket,
              onPress: () {},
              endIcon: false,
              textColor: Colors.red,
            )
          ],
        ).p(30),
      ),
    );
  }
}

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
  });

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: context.appColors.seedColor.withOpacity(0.1),
        ),
        child: Icon(
          icon,
          color: context.appColors.seedColor,
        ),
      ),
      title: title.text.color(textColor).make(),
      trailing: endIcon
          ? Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.grey.withOpacity(0.1),
              ),
              child: const Icon(
                Icons.arrow_forward_ios_outlined,
                size: 18,
                color: Colors.grey,
              ),
            )
          : null,
    ).pSymmetric(v: 13);
  }
}
