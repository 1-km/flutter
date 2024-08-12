import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nav/nav.dart';

export 'dart:async';

export 'package:easy_localization/easy_localization.dart';
export 'package:flutter_svg/flutter_svg.dart';
export 'package:nav/nav.dart';
export 'package:quiver/strings.dart';
export 'package:velocity_x/velocity_x.dart';

export '../common/dart/extension/animation_controller_extension.dart';
export '../common/dart/extension/collection_extension.dart';
export '../common/dart/extension/context_extension.dart';
export '../common/dart/extension/num_extension.dart';
export '../common/dart/extension/velocityx_extension.dart';
export '../common/dart/kotlin_style/kotlin_extension.dart';
export 'constants.dart';
export 'dart/extension/snackbar_context_extension.dart';
export 'theme/color/abs_theme_colors.dart';
export 'theme/shadows/abs_theme_shadows.dart';
export 'util/async/flutter_async.dart';
export 'widget/w_empty_expanded.dart';
export 'widget/w_height_and_width.dart';
export 'widget/w_line.dart';
export 'widget/w_tap.dart';
export 'package:fluttertoast/fluttertoast.dart';

const defaultFontStyle = GoogleFonts.ptSerif;

// 다이어로그 토스트
void showOkDialog(BuildContext context, String title) {
  showDialog(
      context: context,
      barrierDismissible: false, // 다이얼로그 이외의 바탕 눌러도 안꺼지도록 설정
      builder: (BuildContext context) {
        return Platform.isIOS
            ? CupertinoAlertDialog(
                title: Text(
                  title,
                ),
                actions: [
                  TextButton(
                    child: const Text('확인'),
                    onPressed: () {
                      Nav.pop(context);
                    },
                  ),
                ],
              )
            : AlertDialog(
                title: Text(
                  title,
                ),
                actions: [
                  TextButton(
                    child: const Text('확인'),
                    onPressed: () {
                      Nav.pop(context);
                    },
                  ),
                ],
              );
      });
}

// 에러 토스트
void showErrorToast({
  String msg = '에러가 발생했습니다.',
  ToastGravity toastGravity = ToastGravity.BOTTOM,
}) {
  Fluttertoast.showToast(
    msg: msg, // 메시지 내용
    toastLength: Toast.LENGTH_SHORT, // 메시지 시간 - 안드로이드
    gravity: toastGravity, // 메시지 위치
    timeInSecForIosWeb: 1, // 메시지 시간 - iOS 및 웹
    backgroundColor: Colors.red.shade600, // 배경
    textColor: Colors.white, // 글자
    fontSize: 18.0,
  );
}

String randomNickname() {
  List animals = ['강아지', '토끼', '악어', '고양이', '호랑이'];
  String randomAnimal = animals[Random().nextInt(animals.length)];
  String randomNum = Random().nextInt(1000).toString().padLeft(4, "0");
  String nickName = '$randomAnimal$randomNum';
  return nickName;
}
