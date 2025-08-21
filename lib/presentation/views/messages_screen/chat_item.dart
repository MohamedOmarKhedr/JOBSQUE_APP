import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../core/screens.dart';
import '../../style/colors.dart';

class ChatItem extends StatelessWidget {
  final Map<String,dynamic> chatData;
  const ChatItem({super.key, required this.chatData});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Map<String,dynamic> compData={
          'compName':chatData['compName'],
          'imagePath':chatData['logo'],
          'isNetworkImage':false
        };
        Navigator.pushNamed(context, chatScreen,arguments: compData);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 35.sp,
            width: 35.sp,
            child: Stack(
              children: [
                Container(
                  height: 35.sp,
                  width: 35.sp,
                  decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(50.sp),
                    image: DecorationImage(
                      image: AssetImage(chatData['logo']!), // Replace with your image asset
                      fit: BoxFit.cover,
                    ),),
                ),
                Visibility(
                  visible: !chatData['isRead'],
                  child: SvgPicture.asset('assets/images/home_layout/1.svg'),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 2.w,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        chatData['compName']! ,
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis),
                      ),
                    ),
                    Text(
                      chatData['time']!,
                      style: TextStyle(
                          fontSize: 10.sp,
                          color: Colors.grey[600]),
                    ),
                  ],
                ),
                SizedBox(height: 1.h,),
                Text(
                  chatData['lastMessage']!,
                  style: TextStyle(
                      fontSize: 10.sp,
                      color: Colors.grey[600],
                      overflow: TextOverflow.ellipsis),),
                Divider(height: 4.h,thickness: .5.sp,color: grey,)
              ],
            ),
          ),


        ],
      ),
    );
  }
}
