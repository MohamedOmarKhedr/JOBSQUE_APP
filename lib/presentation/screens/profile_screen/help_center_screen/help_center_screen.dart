import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../views/back_arrow_button.dart';
import '../../../views/profile_screen/help_center_item.dart';
import '../../../views/search_screen/search_text_field.dart';

class HelpCenterScreen extends StatefulWidget {
  const HelpCenterScreen({super.key});

  @override
  State<HelpCenterScreen> createState() => _HelpCenterScreenState();
}

class _HelpCenterScreenState extends State<HelpCenterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackArrowButton(context: context),
        centerTitle: true,
        title: Text(
          'Help Center',
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SearchTextField(hintText: 'What can we help?',),
          SizedBox(height: 3.h,),
          Expanded(child: ListView.builder(itemCount: 6,itemBuilder: (context, index) {
            return const HelpCenterItem();
          },))


        ],
      ),
    );
  }
}
