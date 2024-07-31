import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:military1km/common/common.dart';
import 'package:military1km/data/network/user/user_provider.dart';
import 'package:military1km/screen/main/tab/profile/s_update_profile.dart';

class ProfileUiWidget extends ConsumerWidget {
  const ProfileUiWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncUserData = ref.watch(asyncUserProvider);

    return asyncUserData.when(
      data: (userData) {
        return Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 60,
                  height: 60,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: CachedNetworkImage(
                      imageUrl: userData.profileImage,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const Width(15),
                userData.nickname.text.size(21).bold.make(),
              ],
            ),
            height30,
            Tap(
              onTap: () => Nav.push(const UpdateProfileScreen()),
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 55,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: Color.fromARGB(255, 234, 235, 236),
                ),
                child: '프로필 수정'
                    .text
                    .color(const Color.fromARGB(255, 96, 99, 100))
                    .size(18)
                    .semiBold
                    .make(),
              ),
            ),
          ],
        );
      },
      error: (error, trace) {
        return ''.text.size(24).make().pOnly(top: 200);
      },
      loading: () => const CircularProgressIndicator().pOnly(top: 300),
    );
  }
}
