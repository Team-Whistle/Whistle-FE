import 'package:flutter/material.dart';
import 'package:flutter_whistle/component/gathering_list_item.dart';
import 'package:flutter_whistle/component/gathering_room_create_button.dart';
import 'package:flutter_whistle/component/title_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GatheringRoomCreateButton(),
                TitleText(titleText: '응원 모임방'),
                GatheringListItem(
                  tag: '첼시',
                  titleData: 'Title',
                  place: '마포구',
                  date: '12월 3일',
                  time: '오후 11:30',
                  joinedMember: '2',
                  maxMember: '20',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
