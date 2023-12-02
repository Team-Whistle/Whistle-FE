import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'social_login.dart';

class KaKaoAuth implements SocialLogin {
  @override
  Future<bool> login() async {
    try {
      bool isInstalled = await isKakaoTalkInstalled();
      if (isInstalled) {
        try {
          final kakaoToken = await UserApi.instance.loginWithKakaoTalk();
          print('1번 $kakaoToken');
          return true;
        } catch (e) {
          return false;
        }
      } else {
        try {
          final kakaoToken = await UserApi.instance.loginWithKakaoAccount();
          print('2번 $kakaoToken');
          return true;
        } catch (e) {
          return false;
        }
      }
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> logout() async {
    try {
      await UserApi.instance.unlink();
      return true;
    } catch (error) {
      return false;
    }
  }
}
