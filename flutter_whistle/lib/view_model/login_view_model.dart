import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import '../authentication/social_login.dart';

class LoginViewModel {
  final SocialLogin _socialLogin;
  bool isLogined = false;
  User? user;
  LoginViewModel(this._socialLogin);

  Future login() async {
    isLogined = await _socialLogin.login() == true;
    if (isLogined) {
      // final kakaoToken = await UserApi.instance.loginWithKakaoAccount();
      user = await UserApi.instance.me();
      print('Login success');
    }
  }

  Future logout() async {
    await _socialLogin.logout();
    isLogined = false;
    user = null;
    print('Logged out successfully');
  }
}
