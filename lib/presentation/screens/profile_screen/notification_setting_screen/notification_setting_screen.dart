import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../style/colors.dart';
import '../../../views/back_arrow_button.dart';
import '../../../views/my_title.dart';
import '../../../views/profile_screen/notification_setting_item.dart';

class NotificationSettingScreen extends StatefulWidget {
  const NotificationSettingScreen({super.key});

  @override
  State<NotificationSettingScreen> createState() =>
      _NotificationSettingScreenState();
}

class _NotificationSettingScreenState extends State<NotificationSettingScreen> {
  List<Map> jobNotifications = [
    {'title': 'Your Job Search Alert', 'isEnable': true},
    {'title': 'Job Application Update', 'isEnable': true},
    {'title': 'Job Application Reminders', 'isEnable': false},
    {'title': 'Jobs You May Be Interested In', 'isEnable': true},
    {'title': 'Job Seeker Updates', 'isEnable': true},
  ];
  List<Map> otherNotifications = [
    {'title': 'Show Profile', 'isEnable': true},
    {'title': 'All Message', 'isEnable': true},
    {'title': 'Message Nudges', 'isEnable': true},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackArrowButton(context: context),
        centerTitle: true,
        title: Text(
          'Notification',
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        children: [
          const MyTitle(
            text: 'Job notification',
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w,),
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (context, index) {
                return Divider(
                  height: 1.5.h,
                  color: grey,
                  thickness: 1,
                );
              },
              itemCount: jobNotifications.length,
              itemBuilder: (context, index) {
                return NotificationSettingItem(
                  isEnable: jobNotifications[index]['isEnable'],
                  title: jobNotifications[index]['title'],
                );
              },
            ),
          ),
          const MyTitle(
            text: 'Other notification',
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w,),
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (context, index) {
                return Divider(
                  height: 1.5.h,
                  color: grey,
                  thickness: 1,
                );
              },
              itemCount: otherNotifications.length,
              itemBuilder: (context, index) {
                return NotificationSettingItem(
                  isEnable: otherNotifications[index]['isEnable'],
                  title: otherNotifications[index]['title'],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
