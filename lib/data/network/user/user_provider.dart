import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:military1km/data/entity/vo_user.dart';

final asyncUserProvider =
    AsyncNotifierProvider<AsyncUserNotifier, UserData>(() {
  return AsyncUserNotifier();
});

class AsyncUserNotifier extends AsyncNotifier<UserData> {
  Future<UserData> initUser() async {
    await Future.delayed(const Duration(seconds: 1));
    return UserData(
      uid: 'uid',
      nickname: 'nickname',
      profileImage:
          'https://firebasestorage.googleapis.com/v0/b/sora-fff1d.appspot.com/o/profile.png?alt=media&token=150edc95-c647-4e12-80d0-327f01ca07d6',
      address: 'address',
    );
  }

  @override
  Future<UserData> build() async {
    return initUser();
  }

  Future<void> updateProfile(String name, String url) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      // 업데
      return initUser();
    });
  }
}
