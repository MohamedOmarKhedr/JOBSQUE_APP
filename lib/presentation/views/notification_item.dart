import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../style/colors.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key, required this.notificationData, required this.isRead});
  final Map notificationData;
  final bool isRead;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          child: Image.asset(notificationData['imagePath']!),
        ),
        SizedBox(width: 3.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                    notificationData['name'] ?? '',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                                    ),
                  ),
                  if (!isRead)
                    SvgPicture.asset('assets/images/home_layout/Ellipse 12.svg'),
                  SizedBox(width: 1.w),
                  Text(
                    notificationData['time'] ?? '',
                    style: TextStyle(
                      fontSize: 10.sp,
                      color: Colors.grey[600],
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(width: 1.w),],
              ),
              SizedBox(height: 1.h),
              Text(
                notificationData['message'] ?? '',
                style: TextStyle(
                  fontSize: 8.sp,
                  color: Colors.grey[600],
                  overflow: TextOverflow.visible,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
