import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:job_finder/business_logic/messages_cubit/messages_cubit.dart';
import 'package:job_finder/core/screens.dart';
import 'package:sizer/sizer.dart';

class ChatFilterSheetButton extends StatefulWidget {

  const ChatFilterSheetButton({super.key,});

  @override
  State<ChatFilterSheetButton> createState() => _ChatFilterSheetButtonState();
}

class _ChatFilterSheetButtonState extends State<ChatFilterSheetButton> {
  late MessagesCubit messagesCubit;
  @override
  void didChangeDependencies() {
    messagesCubit=MessagesCubit.get(context);
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 2.h,horizontal: 4.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/images/home_layout/Vector 68.svg'),
          SizedBox(height: 2.h),
          InkWell(onTap:(){
            messagesCubit.onlyUnreadChat=true;
            Navigator.pushNamed(context, homeLayoutScreen,);
          },child: SvgPicture.asset('assets/images/home_layout/Unread.svg')),
          SizedBox(height: 2.h),
          InkWell(onTap:(){},child: SvgPicture.asset('assets/images/home_layout/Spam.svg')),
          SizedBox(height: 2.h),
          InkWell(onTap:(){
          },child: SvgPicture.asset('assets/images/home_layout/Archived.svg')),
          SizedBox(height: 2.h),




        ],

      ),
    );
  }
}
