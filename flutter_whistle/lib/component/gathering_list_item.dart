// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_whistle/constant/color.dart';

class GatheringListItem extends StatelessWidget {
  String titleData;
  String tag;
  String place;
  String date;
  String time;
  String joinedMember;
  String maxMember;

  GatheringListItem({
    Key? key,
    required this.titleData,
    required this.tag,
    required this.place,
    required this.date,
    required this.time,
    required this.joinedMember,
    required this.maxMember,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12,
      ),
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 12,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 4,
                        horizontal: 12,
                      ),
                      decoration: BoxDecoration(
                        color: LIGHT_BLUE,
                        borderRadius: BorderRadius.circular(
                          20,
                        ),
                      ),
                      child: Text(
                        tag,
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ],
                ),
                Text(
                  titleData,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.place,
                      size: 16,
                    ),
                    Text(place),
                    SizedBox(
                      width: 4,
                    ),
                    Text(date),
                    SizedBox(
                      width: 4,
                    ),
                    Text(time),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.person,
                      size: 16,
                    ),
                    Text(
                      '$joinedMember / $maxMember',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
