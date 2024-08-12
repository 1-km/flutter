import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:military1km/common/common.dart';
import 'package:nav/dialog/dialog.dart';
import 'package:permission_handler/permission_handler.dart';

class SelectImageSourceDialog extends DialogWidget<ImageSource> {
  SelectImageSourceDialog({super.key});

  @override
  DialogState<SelectImageSourceDialog> createState() =>
      _SelectImageSourceDialogState();
}

class _SelectImageSourceDialogState
    extends DialogState<SelectImageSourceDialog> {
  getPermission() async {
    var status = await Permission.camera.status;
    if (status.isDenied) {
      // 사진 동의 거절시 작업
      AlertDialog(title: '거절됨'.text.make());
      Permission.contacts.request();
    }
  }

  @override
  void initState() {
    getPermission();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Container(
          constraints: const BoxConstraints(
            maxWidth: 300,
          ),
          decoration: BoxDecoration(
            color: context.backgroundColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Tap(
                onTap: () {
                  widget.hide(ImageSource.camera);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.camera_alt_outlined),
                    '카메라'.text.make(),
                  ],
                ).p(30),
              ),
              const Line().pSymmetric(h: 20),
              Tap(
                onTap: () {
                  widget.hide(ImageSource.gallery);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.photo_outlined),
                    '갤러리'.text.make(),
                  ],
                ).p(30),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
