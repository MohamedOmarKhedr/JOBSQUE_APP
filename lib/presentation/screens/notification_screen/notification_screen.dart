import 'package:flutter/material.dart';
import 'package:job_finder/presentation/style/colors.dart';
import 'package:sizer/sizer.dart';

import '../../views/back_arrow_button.dart';
import '../../views/notification_item.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<Map<String, String>> notificationNew = [
    {
      'imagePath': 'assets/images/home_layout/Dana Logo.png',
      'name': 'Dana',
      'message': 'Posted new design jobs',
      'time': '10.00AM',
    },
    {
      'imagePath': 'assets/images/home_layout/Shoope Logo.png',
      'name': 'Shoope',
      'message': 'Posted new design jobs',
      'time': '10.00AM',
    },
    {
      'imagePath': 'assets/images/home_layout/Slack Logo.png',
      'name': 'Slack',
      'message': 'Posted new design jobs',
      'time': '10.00AM',
    },
    {
      'imagePath': 'assets/images/home_layout/Facebook Logo.png',
      'name': 'Facebook',
      'message': 'Posted new design jobs',
      'time': '10.00AM',
    },
  ];

  List<Map<String, String>> notificationOld = [
    {
      'imagePath': 'assets/images/home_layout/Email.png',
      'name': 'Email setup successful',
      'message':
      'Your email setup was successful with the following details: Your new email is rafifdianganz@gmail.com.',
      'time': '10.00AM',
    },
    {
      'imagePath': 'assets/images/home_layout/Jobsque Logo.png',
      'name': 'Welcome to Jobsque',
      'message':
      'Hello Rafif Dian Axelingga, thank you for registering Jobsque. Enjoy the various features that....',
      'time': '06.00AM',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackArrowButton(context: context),
        title: Text(
          'Notification',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          if (index == 0) {
            return SectionContainer(
              title: 'New',
              notifications: notificationNew,
              isRead: false,
            );
          } else if (index == 1) {
            return SectionContainer(
              title: 'Yesterday',
              notifications: notificationOld,
              isRead: true,
            );
          }
        },
      ),
    );
  }
}

class SectionContainer extends StatelessWidget {
  final String title;
  final List<Map<String, String>> notifications;
  final bool isRead;

  const SectionContainer({
    Key? key,
    required this.title,
    required this.notifications,
    required this.isRead,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 7.h,
          width: double.infinity,
          color: const Color(0xffF4F4F5),
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
          child: Text(
            title,
            style: TextStyle(fontSize: 12.sp, color: Colors.grey[600]),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: notifications.length,
            itemBuilder: (context, index) {
              return NotificationItem(
                notificationData: notifications[index],
                isRead: isRead,
              );
            }, separatorBuilder: (BuildContext context, int index) { return Divider(height: 2.h, thickness: .5.sp,color: grey,); },
          ),
        ),
      ],
    );
  }
}
