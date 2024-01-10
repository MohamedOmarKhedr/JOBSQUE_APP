import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class NotificationSettingItem extends StatefulWidget {
  final String title;
  bool isEnable;
  NotificationSettingItem({super.key, required this.isEnable, required this.title});

  @override
  State<NotificationSettingItem> createState() =>
      _NotificationSettingItemState();
}

class _NotificationSettingItemState extends State<NotificationSettingItem> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          widget.title,
          style: TextStyle(
            fontSize: 12.sp,
          ),
        ),
        const Spacer(),
        Visibility(
          visible: widget.isEnable,
            replacement: IconButton(
              onPressed: () {
                setState(() {
                  widget.isEnable=true;
                });
              },
              icon: SvgPicture.asset('assets/images/home_layout/Toggle.svg'),
            ),
            child: IconButton(
          onPressed: () {
            setState(() {
              widget.isEnable=false;
            });
          },
          icon: SvgPicture.asset('assets/images/home_layout/Toggle2.svg'),
        ))
      ],
    );
  }
}
