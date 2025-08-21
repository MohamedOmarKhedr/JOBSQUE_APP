import 'package:flutter/material.dart';
import 'package:job_finder/presentation/style/colors.dart';
import 'package:sizer/sizer.dart';

class MessageItem extends StatelessWidget {
  final String message;
  final String time;
  final bool isFromUser;

  const MessageItem({
    Key? key,
    required this.message,
    required this.time,
    required this.isFromUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment:
          isFromUser ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 1.h),
          padding: EdgeInsets.all(6.sp),
          decoration: BoxDecoration(
            color: isFromUser ? blue : grey,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(4.sp),
              bottomRight: Radius.circular(4.sp),
              topLeft: isFromUser ? Radius.circular(4.sp) : Radius.zero,
              topRight: isFromUser ? Radius.zero : Radius.circular(4.sp),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 70.w,
                      ),
                      child: Text(
                        message,
                        style: TextStyle(
                          color: isFromUser ? Colors.white : Colors.black,
                          fontSize: 10.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                time,
                textAlign: TextAlign.end,
                style: TextStyle(
                  color: isFromUser ? Colors.white : Colors.black,
                  fontSize: 10.sp,
                  overflow: TextOverflow.visible,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
