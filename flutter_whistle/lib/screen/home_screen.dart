import 'package:flutter/material.dart';
import 'package:flutter_whistle/component/gathering_list_item.dart';
import 'package:flutter_whistle/component/gathering_room_create_button.dart';

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
              children: [
                GatheringRoomCreateButton(),
                GatheringListItem(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
