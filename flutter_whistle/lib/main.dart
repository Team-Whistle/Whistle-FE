import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_whistle/screen/home_screen.dart';
import 'package:flutter_whistle/screen/login_screen.dart';
import 'package:flutter_whistle/widget/bottom_navigator_widget.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

import 'screen/chat_screen.dart';
import 'screen/feed_screen.dart';
import 'screen/profile_screen.dart';
import 'widget/appbar_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  KakaoSdk.init(nativeAppKey: dotenv.env["NATIVE_APP_KEY"]);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  bool isLogined = false;
  late Widget selectedScreen = LoginScreen();
  int currentIndex = 0; // currentIndex를 상태로 유지
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppbarWidget(),
        body: isLogined ? HomeScreen() : selectedScreen,
        bottomNavigationBar: BottomNavigatorWidget(
          onItemSelected: (index) {
            setState(() {
              currentIndex = index;
              selectedScreen = _buildSelectedScreen(); // 수정된 부분
            });
          },
        ),
      ),
    );
  }

  Widget _buildSelectedScreen() {
    switch (currentIndex) {
      case 0:
        return HomeScreen();
      case 1:
        return FeedScreen();
      case 2:
        return ChatScreen();
      case 3:
        return ProfileScreen();
      default:
        return HomeScreen();
    }
  }
}
