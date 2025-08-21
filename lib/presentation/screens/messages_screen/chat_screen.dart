import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:job_finder/presentation/style/colors.dart';
import 'package:job_finder/presentation/views/back_arrow_button.dart';
import 'package:job_finder/presentation/views/messages_screen/message_item.dart';
import 'package:job_finder/presentation/views/messages_screen/message_text_field.dart';
import 'package:sizer/sizer.dart';

import '../../views/messages_screen/chat_more_sheet_button.dart';

class ChatScreen extends StatefulWidget {
  final Map<String, dynamic> compData;
  const ChatScreen({super.key, required this.compData});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackArrowButton(context: context),
        actions: [
          SizedBox(
            width: 90.w,
            child: Row(
              children: [
                SizedBox(
                  width: 4.w,
                ),
                ClipOval(
                  child: widget.compData['isNetworkImage']
                      ? Image.network(
                          widget.compData['imagePath'] as String,
                          fit: BoxFit.cover,
                          height: 30.sp,
                          width: 30.sp,
                        )
                      : Image.asset(
                          widget.compData['imagePath'] as String,
                          fit: BoxFit.cover,
                          height: 30.sp,
                          width: 30.sp,
                        ),
                ),
                SizedBox(
                  width: 3.w,
                ),
                Expanded(
                    child: Text(
                  widget.compData['compName'],
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis),
                )),
                IconButton(
                    onPressed: () {
                      showModalBottomSheet(context: context, builder: (context) {
                        return const ChatMoreSheetButton();
                      },);
                    },
                    icon:
                        SvgPicture.asset('assets/images/home_layout/more.svg'))
              ],
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                    child: Divider(
                  color: grey,
                  height: 1.h,
                )),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: Text(
                    'Today, Nov 13',
                    style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.grey[600],
                        overflow: TextOverflow.visible),
                  ),
                ),
                Expanded(
                    child: Divider(
                  color: grey,
                  height: 1.h,
                )),
              ],
            ),
            Expanded(
              child: ListView(
                children: const [
                  MessageItem(
                    message:
                        "Hi Rafif!, I'm Melan the selection team from Twitter. Thank you for applying for a job at our company. We have announced that you are eligible for the interview stage.",
                    time: '10:18',
                    isFromUser: false,
                  ),
                  MessageItem(
                    message:
                        "Hi Melan, thank you for considering me, this is good news for me.",
                    time: '10:18',
                    isFromUser: true,
                  ),
                  MessageItem(
                    message:
                        "Can we have an interview via google meet call today at 3pm?",
                    time: '10:18',
                    isFromUser: false,
                  ),
                  MessageItem(
                    message: "Of course, I can!",
                    time: '10:18',
                    isFromUser: true,
                  ),
                  MessageItem(
                    message:
                        "Ok, here I put the google meet link for later this afternoon. I ask for the timeliness, thank you! https://meet.google.com/dis-sxdu-ave",
                    time: '10:18',
                    isFromUser: false,
                  ),
                ],
              ),
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                        'assets/images/home_layout/paperclip.svg')),
                const Expanded(child: MessageTextField(hintText: 'Write a message...',)),
                IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                        'assets/images/home_layout/Microphone.svg')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
