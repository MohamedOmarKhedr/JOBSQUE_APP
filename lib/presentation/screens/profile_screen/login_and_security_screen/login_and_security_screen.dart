import 'package:flutter/material.dart';
import 'package:job_finder/core/my_cache_keys.dart';
import 'package:job_finder/data/local_data/my_cache.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/screens.dart';
import '../../../style/colors.dart';
import '../../../views/back_arrow_button.dart';
import '../../../views/my_title.dart';
import '../../../views/profile_screen/login_and_security_item.dart';

class LoginAndSecurityScreen extends StatelessWidget {
  LoginAndSecurityScreen({super.key});

  final List<Map> itemsData = [
    {
      'title': 'Email address',
      'content': MyCache.getString(key: MyCacheKeys.email)
    },
    {
      'title': 'Phone number',
      'content': MyCache.getString(key: MyCacheKeys.profilePhoneNumber)
    },
    {
      'title': 'Change password',
      'content': '*' * MyCache.getString(key: MyCacheKeys.password).length
    },
    {'title': 'Two-step verification', 'content': MyCache.getBool(key: MyCacheKeys.isTwoStepVerify)?'Non active':'Active'},
    {'title': 'Face ID', 'content': ''},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackArrowButton(context: context),
        centerTitle: true,
        title: Text(
          'Login and security',
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        children: [
          const MyTitle(
            text: 'Account access',
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 4.w,
            ),
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
              itemCount: itemsData.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                    if(index==0){
                      Navigator.pushNamed(context, emailAddressScreen);
                    } else if(index==1){
                      Navigator.pushNamed(context, phoneNumberScreen);
                    } else if(index==2){
                      Navigator.pushNamed(context, changePasswordScreen);
                    } else if(index==3){
                      Navigator.pushNamed(context, twoStepVerificationScreen);
                    }
                  },
                  child: LoginAndSecurityItem(
                    title: itemsData[index]['title'],
                    content: itemsData[index]['content'],
                    index: index,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
