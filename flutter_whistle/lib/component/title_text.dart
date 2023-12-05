// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  String titleText;

  TitleText({
    Key? key,
    required this.titleText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
        ),
        Text(
          titleText,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}
