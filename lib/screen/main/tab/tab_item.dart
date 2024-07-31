import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:military1km/screen/main/tab/community/f_community.dart';
import 'package:military1km/screen/main/tab/home/f_home.dart';
import 'package:military1km/screen/main/tab/profile/f_profile.dart';
import 'package:military1km/screen/main/tab/ranking/f_ranking.dart';

enum TabItem {
  home(FontAwesomeIcons.house, '홈', HomeFragment()),
  rank(FontAwesomeIcons.rankingStar, '랭킹', RankingFragment()),
  community(FontAwesomeIcons.userGroup, '커뮤니티', CommunityFragment()),
  profile(FontAwesomeIcons.userLarge, '프로필', ProfileFragment()),
  ;

  final IconData activeIcon;
  final IconData inActiveIcon;
  final String tabName;
  final Widget firstPage;

  const TabItem(this.activeIcon, this.tabName, this.firstPage,
      {IconData? inActiveIcon})
      : inActiveIcon = inActiveIcon ?? activeIcon;

  BottomNavigationBarItem toNavigationBarItem(BuildContext context,
      {required bool isActivated}) {
    return BottomNavigationBarItem(
        icon: Icon(
          size: 25,
          key: ValueKey(tabName),
          isActivated ? activeIcon : inActiveIcon,
          color: isActivated ? Colors.white : Colors.grey,
        ),
        label: tabName);
  }
}
