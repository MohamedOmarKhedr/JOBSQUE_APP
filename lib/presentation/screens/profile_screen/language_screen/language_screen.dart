import 'package:flutter/material.dart';
import 'package:job_finder/core/my_cache_keys.dart';
import 'package:job_finder/data/local_data/my_cache.dart';
import 'package:sizer/sizer.dart';

import '../../../style/colors.dart';
import '../../../views/back_arrow_button.dart';
import '../../../views/profile_screen/language_item.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  late int currentIndex;
  List<Map> languages=[
    {
      'imagePath':'assets/images/home_layout/English.png',
      'languageName':'English'
    },
    {
      'imagePath':'assets/images/home_layout/Indonesia.png',
      'languageName':'Indonesia'
    },
    {
      'imagePath':'assets/images/home_layout/Arabic.png',
      'languageName':'Arabic'
    },
    {
      'imagePath':'assets/images/home_layout/Chinese.png',
      'languageName':'Chinese'
    },
    {
      'imagePath':'assets/images/home_layout/Dutch.png',
      'languageName':'Dutch'
    },{
      'imagePath':'assets/images/home_layout/French.png',
      'languageName':'French'
    },
    {
      'imagePath':'assets/images/home_layout/Germany.png',
      'languageName':'German'
    },
    {
      'imagePath':'assets/images/home_layout/Japanese.png',
      'languageName':'Japanese'
    },{
      'imagePath':'assets/images/home_layout/Korean.png',
      'languageName':'Korean'
    },
    {
      'imagePath':'assets/images/home_layout/Portuguese.png',
      'languageName':'Portuguese'
    },


  ];

  @override
  Widget build(BuildContext context) {
    currentIndex=MyCache.getInt(key: MyCacheKeys.languageIndex);
    return Scaffold(
      appBar: AppBar(
        leading: BackArrowButton(context: context),
        centerTitle: true,
        title: Text(
          'Language',
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w,vertical: 2.h),
        child: ListView.separated(
          separatorBuilder: (context, index) {
            return Divider(height: 2.h,color: grey,thickness: 1,);
          },
          itemCount: languages.length,
          itemBuilder: (context, index) {
            return InkWell(
                onTap: (){
                  setState(() {
                    MyCache.putInt(key: MyCacheKeys.languageIndex, value: index);
                  });
                },
                child: LanguageItem(currentIndex:currentIndex , index: index, language: languages[index],

                ));
          },
        ),
      ),
    );
  }
}
