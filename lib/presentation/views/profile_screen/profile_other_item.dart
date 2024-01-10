import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../core/screens.dart';

class ProfileOtherItem extends StatelessWidget {
  final String profileOtherItemTitle;
  final int index;
  const ProfileOtherItem({super.key, required this.profileOtherItemTitle, required this.index});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Text(profileOtherItemTitle)),
        IconButton(onPressed: (){
          if(index==1){
            Navigator.pushNamed(context, helpCenterScreen);
          } else if(index==2){
            Navigator.pushNamed(context, termsAndConditionsScreen);
          } else if(index==3){
            Navigator.pushNamed(context, privacyPolicyScreen);
          } else if(index==4){
            Navigator.pushNamed(context, completeProfileScreen);
          }
        }, icon: SvgPicture.asset('assets/images/home_layout/arrow-right2.svg'))
      ],
    );
  }
}
