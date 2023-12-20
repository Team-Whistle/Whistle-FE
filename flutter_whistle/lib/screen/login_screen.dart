import 'package:flutter/material.dart';
import 'package:flutter_whistle/main.dart';
import '../authentication/kakao_login.dart';
import '../view_model/login_view_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final viewModel = LoginViewModel(KaKaoAuth());

  @override
  Widget build(BuildContext context) {
    MyAppState? main = context.findAncestorStateOfType<MyAppState>();

    return Scaffold(
      body: SafeArea(
        child: ElevatedButton(
          onPressed: () async {
            await viewModel.login();
            main?.setState(() {
              main.isLogined = true;
            });
            setState(() {});
            print(viewModel.user);
          },
          child: Text('카카오 로그인'),
        ),
      ),
    );
  }
}
