import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabInfo {
  final IconData icon;
  final String label;

  const TabInfo({
    required this.icon,
    required this.label,
  });
}

const TABS = [
  TabInfo(
    icon: Icons.home,
    label: '홈',
  ),
  TabInfo(
    icon: CupertinoIcons.square_list_fill,
    label: '피드',
  ),
  TabInfo(
    icon: CupertinoIcons.chat_bubble_fill,
    label: '채팅',
  ),
  TabInfo(
    icon: CupertinoIcons.person_fill,
    label: '프로필',
  ),
];
