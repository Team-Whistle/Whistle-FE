import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'social_login.dart';

class KaKaoAuth implements SocialLogin {
  @override
  Future<String> login() async {
    // if (await isKakaoTalkInstalled()) {
    //   try {
    //     final oauthToken = await UserApi.instance.loginWithKakaoTalk();
    //     log("kakaoToken: ${oauthToken.accessToken}");
    //     return oauthToken.accessToken;
    //   } catch (error) {
    //     print('카카오톡으로 로그인 실패 $error');
    //     // 사용자가 카카오톡 설치 후 디바이스 권한 요청 화면에서 로그인을 취소한 경우,
    //     // 의도적인 로그인 취소로 보고 카카오계정으로 로그인 시도 없이 로그인 취소로 처리 (예: 뒤로 가기)
    //     if (error is PlatformException && error.code == 'CANCELED') {
    //       print('디바이스 권한 요청 화면에서 로그인을 취소한 경우');
    //       return '';
    //     }
    //     // 카카오톡에 연결된 카카오계정이 없는 경우, 카카오계정으로 로그인
    //     try {
    //       final kakaoToken = await UserApi.instance.loginWithKakaoAccount();
    //       log("kakaoToken: ${kakaoToken.accessToken}");
    //       return kakaoToken.accessToken.toString();
    //     } catch (error) {
    //       print('카카오계정으로 로그인 실패 $error');
    //       return "";
    //     }
    //   }
    // } else {
    //   try {
    //     print('카카오계정으로 로그인 성공');
    //     final kakaoToken = await UserApi.instance.loginWithKakaoAccount();
    //     return kakaoToken.accessToken.toString();
    //   } catch (error) {
    //     print('카카오계정으로 로그인 실패 $error');
    //     return "";
    //   }
    // }
    try {
      bool isInstalled = await isKakaoTalkInstalled();
      if (isInstalled) {
        try {
          await UserApi.instance.loginWithKakaoTalk();
          final oauthToken = await UserApi.instance.loginWithKakaoTalk();
          log("kakaoToken: ${oauthToken.accessToken}");
          return oauthToken.accessToken;
        } catch (e) {
          print('카카오톡으로 로그인 실패 $e');
          // 사용자가 카카오톡 설치 후 디바이스 권한 요청 화면에서 로그인을 취소한 경우,
          // 의도적인 로그인 취소로 보고 카카오계정으로 로그인 시도 없이 로그인 취소로 처리 (예: 뒤로 가기)
          if (e is PlatformException && e.code == 'CANCELED') {
            print('디바이스 권한 요청 화면에서 로그인을 취소한 경우');
            return '';
          }
          // 카카오톡에 연결된 카카오계정이 없는 경우, 카카오계정으로 로그인
          try {
            final kakaoToken = await UserApi.instance.loginWithKakaoAccount();
            log("kakaoToken: ${kakaoToken.accessToken}");
            return kakaoToken.accessToken.toString();
          } catch (error) {
            print('카카오계정으로 로그인 실패 $error');
            return "";
          }
        }
      } else {
        try {
          print('카카오계정으로 로그인 성공');
          final kakaoToken = await UserApi.instance.loginWithKakaoAccount();
          return kakaoToken.accessToken.toString();
        } catch (e) {
          print('카카오계정으로 로그인 실패 $e');
          return "";
        }
      }
    } catch (e) {
      return '';
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
