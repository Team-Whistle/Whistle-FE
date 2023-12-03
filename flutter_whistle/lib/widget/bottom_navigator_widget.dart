import 'package:flutter/material.dart';
import 'package:flutter_whistle/constant/color.dart';
import 'package:flutter_whistle/screen/feed_screen.dart';
import 'package:flutter_whistle/screen/home_screen.dart';

import '../constant/tabs.dart';

class BottomNavigatorWidget extends StatefulWidget {
  final Function(int) onItemSelected; // 수정된 부분: onItemSelected 콜백에 index를 전달

  const BottomNavigatorWidget({
    required this.onItemSelected,
    Key? key,
  }) : super(key: key);

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
      widget.onItemSelected(controller.index); // index를 onItemSelected로 전달
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Color(0xFFFAFAFA),
      selectedItemColor: DARK_BACK_COLOR,
      unselectedItemColor: Colors.grey[300],
      elevation: 0,
      currentIndex: controller.index,
      onTap: (index) {
        controller.animateTo(index);
        // widget.onItemSelected(index); // 이미 TabController의 listener에서 처리하므로 주석 처리
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
