import 'package:flutter/material.dart';
import 'package:flutter_whistle/constant/color.dart';

import '../constant/tabs.dart';

class BottomNavigatorWidget extends StatefulWidget {
  const BottomNavigatorWidget({super.key});

  @override
  State<BottomNavigatorWidget> createState() => _BottomNavigatorWidgetState();
}

class _BottomNavigatorWidgetState extends State<BottomNavigatorWidget>
    with TickerProviderStateMixin {
  late final TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(
      length: TABS.length,
      vsync: this,
    );
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed, // 선택되지 않은 버튼에도 라벨 표시를 위해 fixed 타입 사용
      backgroundColor: Color(0xFFFAFAFA),
      selectedItemColor: DARK_BACK_COLOR,
      unselectedItemColor: Colors.grey[300],
      elevation: 0, // 경계를 없애려면 elevation을 0으로 설정
      currentIndex: controller.index,
      onTap: (index) {
        controller.animateTo(index);
      },
      items: TABS
          .map(
            (e) => BottomNavigationBarItem(
              icon: Icon(
                e.icon,
              ),
              label: e.label,
            ),
          )
          .toList(),
    );
  }
}
