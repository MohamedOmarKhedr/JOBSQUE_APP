import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../style/colors.dart';

class JobPeopleItem extends StatelessWidget {
  final Map<String, String> personData;
  const JobPeopleItem({super.key, required this.personData});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          child: Image.asset(personData['imagePath']!),
        ),
        SizedBox(width: 3.w,),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              personData['name'] ?? '',
              style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis),
            ),
            Text(
              personData['job'] ?? '',
              style: TextStyle(
                  fontSize: 10.sp,
                  color: Colors.grey[600],
                  overflow: TextOverflow.ellipsis),
            ),
          ],
        )),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Work during',
              style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.grey[600],
                  overflow: TextOverflow.ellipsis),
            ),
            Text(
              personData['years'] ?? '',
              style: TextStyle(
                  fontSize: 10.sp,
                  color: blue,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis),
            ),
          ],
        )
      ],
    );
  }
}
