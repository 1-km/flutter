import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:military1km/common/common.dart';
import 'package:military1km/common/widget/w_round_button.dart';
import 'package:military1km/data/network/user/user_provider.dart';
import 'package:military1km/screen/dialog/d_message.dart';
import 'package:military1km/screen/main/tab/profile/d_select_image_source.dart';

class UpdateProfileScreen extends ConsumerStatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TestPageState();
}

class _TestPageState extends ConsumerState<UpdateProfileScreen> {
  String? imageUrl;
  final List<String> imageList = [];
  Future<String?> uploadImageToFirebaseStorage(String imagePath) async {
    try {
      File imageFile = File(imagePath); // 파일 객체 생성
      setState(() {
        imageList.add(imageFile.path);
      });

      // 이미지 업로드 처리
    } catch (e) {
      // 에러 처리
      return null;
    }
    return null;
  }

  Future<void> pickAndUploadImage() async {
    final selectedSource = await SelectImageSourceDialog().show();
    if (selectedSource == null) {
      return;
    }
    try {
      final file = await ImagePicker().pickImage(
        source: selectedSource,
        maxHeight: 800,
        maxWidth: 800,
        imageQuality: 100,
      );
      if (file == null) {
        return;
      }
      // 비동기적으로 이미지 업로드를 수행하고 URL을 가져옵니다.
      String? newImageUrl = await uploadImageToFirebaseStorage(file.path);
      // setState 내부에서는 await를 사용하지 않습니다.
      setState(() {
        imageUrl = newImageUrl; // 새로운 이미지 URL로 업데이트합니다.
      });
    } on PlatformException catch (e) {
      switch (e.code) {
        case 'invalid_image':
          MessageDialog('지원하지 않는 이미지 형식입니다.').show();
          break;
      }
    } catch (e) {
      // 에러 처리
    }
  }

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final asyncUserData = ref.watch(asyncUserProvider);

    return asyncUserData.when(
      data: (userData) {
        void validateNickName(String value) async {
          String pattern = r'[!@#$%^&*(),.?":{}|<>]';
          RegExp regExp = RegExp(pattern);

          if (value.isEmpty) {
            showErrorToast(
              msg: '닉네임을 입력하세요',
              toastGravity: ToastGravity.BOTTOM,
            );
          } else if (regExp.hasMatch(value)) {
            showErrorToast(
              msg: '특수문자는 닉네임에 포함할 수 없습니다.',
              toastGravity: ToastGravity.BOTTOM,
            );
          } else if (value.length < 2) {
            showErrorToast(
              msg: '두글자 이상 입력해주세요.',
              toastGravity: ToastGravity.BOTTOM,
            );
          } else {
            await ref.read(asyncUserProvider.notifier).updateProfile(
                  nameController.text,
                  imageUrl ?? userData.profileImage,
                );
            setState(() {});
            // ignore: use_build_context_synchronously
            Nav.pop(context);
          }
        }

        return Scaffold(
          appBar: AppBar(
            title: '프로필 수정'.text.semiBold.make(),
          ),
          body: Column(
            children: [
              Stack(
                children: [
                  ImageSelectWidget(
                    imageUrl,
                    userData.profileImage,
                    imageList,
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Tap(
                      onTap: () async {
                        await pickAndUploadImage();
                      },
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: context.appColors.seedColor),
                        child: Icon(
                          FontAwesomeIcons.camera,
                          size: 20,
                          color: context.appColors.secondColor,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              height50,
              Form(
                  child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    controller: nameController,
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        label: '이름'.text.make(),
                        prefixIcon: const Icon(FontAwesomeIcons.user)),
                  ),
                  height50,
                  RoundButton(
                    text: '수정하기',
                    onTap: () => validateNickName(nameController.text),
                    bgColor: const Color(0xFFC2FF49),
                    textColor: Colors.black,
                    isFullWidth: true,
                    borderRadius: 10,
                    fontSize: 18,
                  ),
                ],
              ))
            ],
          ).p(30),
        );
      },
      error: (error, trace) =>
          error.toString().text.size(24).make().pOnly(top: 300),
      loading: () => const CircularProgressIndicator().pOnly(top: 300),
    );
  }
}

class ImageSelectWidget extends StatelessWidget {
  final String? imageUrl;
  final String userImage;
  final List<String> imageList;

  const ImageSelectWidget(
    this.imageUrl,
    this.userImage,
    this.imageList, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      height: 120,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: imageUrl == null
              ? CachedNetworkImage(
                  imageUrl: userImage,
                  fit: BoxFit.fill,
                )
              : Image.file(
                  File(imageList[0]),
                  fit: BoxFit.fill,
                )),
    );
  }
}
