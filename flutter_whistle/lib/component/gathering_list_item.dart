import 'package:flutter/material.dart';

class GatheringListItem extends StatelessWidget {
  const GatheringListItem({super.key});

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
        ],
      ),
    );
  }
}
