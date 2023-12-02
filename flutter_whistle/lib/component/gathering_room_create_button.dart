import 'package:flutter/material.dart';
import 'package:flutter_whistle/constant/color.dart';

class GatheringRoomCreateButton extends StatefulWidget {
  const GatheringRoomCreateButton({super.key});

  @override
  State<GatheringRoomCreateButton> createState() =>
      _GatheringRoomCreateButtonState();
}

class _GatheringRoomCreateButtonState extends State<GatheringRoomCreateButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: PRIMARY_COLOR,
        ),
        onPressed: () async {
          // Navigator.of(context).push(
          //   MaterialPageRoute(
          //     builder: (context) => CreateGatherRoom(),
          //   ),
          // );
        },
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '우리팀 모여라! 모임 만들기',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Text(
                  '우리 동네 응원 모임을 만들어요',
                  style: TextStyle(
                    fontSize: 10,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
