import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import '../authentication/social_login.dart';

class LoginViewModel {
  final SocialLogin _socialLogin;
  String? accessToken;
  bool isLogined = false;
  User? user;
  LoginViewModel(this._socialLogin);

  Future login() async {
    isLogined = await _socialLogin.login() == true;
    if (isLogined) {
      user = await UserApi.instance.me();
      print(_socialLogin.login());
    }
  }

  Future logout() async {
    await _socialLogin.logout();
    isLogined = false;
    user = null;
    print('Logged out successfully');
  }
}
