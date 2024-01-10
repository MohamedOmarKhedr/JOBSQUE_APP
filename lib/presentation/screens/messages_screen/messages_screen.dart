import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:job_finder/business_logic/messages_cubit/messages_cubit.dart';
import 'package:job_finder/presentation/views/messages_screen/message_text_field.dart';
import 'package:sizer/sizer.dart';

import '../../style/colors.dart';
import '../../views/messages_screen/chats_filter_sheet_button.dart';
import '../../views/messages_screen/chat_item.dart';
import '../../views/search_screen/search_text_field.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  late MessagesCubit messagesCubit;
  @override
  void didChangeDependencies() {
    messagesCubit = MessagesCubit.get(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
        'Messages',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
      )),
      body: Column(children: [
        Row(
          children: [
            const Expanded(
                child: SearchTextField(hintText: 'Search Messages...')),
            IconButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return const ChatFilterSheetButton();
                    },
                  );
                },
                icon: SvgPicture.asset('assets/images/home_layout/Filter.svg')),
          ],
        ),
        SizedBox(
          height: 3.h,
        ),
        Visibility(
          visible: messagesCubit.onlyUnreadChat,
          child: Container(
            height: 7.h,
            color: const Color(0xffF4F4F5),
            padding: EdgeInsets.symmetric(horizontal: 4.w,),
            child: Row(
              children: [
                Text(
                  'Unread',
                  style: TextStyle(fontSize: 12.sp, color: Colors.grey[600]),
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {
                      setState(() {
                        messagesCubit.onlyUnreadChat = false;
                      });
                    },
                    icon: Text(
                      'Read all messages',
                      style: TextStyle(fontSize: 10.sp, color: blue),
                    ))
              ],
            ),
          ),
        ),
        Visibility(
          visible: !messagesCubit.onlyUnreadChat,
          replacement: Expanded(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
            child: ListView.builder(
              itemCount: messagesCubit.chatsData.length,
              itemBuilder: (BuildContext context, int index) {
                return Visibility(
                  visible: !messagesCubit.chatsData[index]['isRead'],
                  child: ChatItem(
                    chatData: messagesCubit.chatsData[index],
                  ),
                );
              },
            ),
          )),
          child: Expanded(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
            child: ListView.builder(
              itemCount: messagesCubit.chatsData.length,
              itemBuilder: (BuildContext context, int index) {
                return ChatItem(
                  chatData: messagesCubit.chatsData[index],
                );
              },
            ),
          )),
        )
      ]),
    );
  }
}
