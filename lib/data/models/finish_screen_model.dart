import 'package:flutter/cupertino.dart';



class FinishScreenModel {
  final String title;
  final String subTitle;
  final String imagePath;
  final String? buttonText;
  final void Function(BuildContext context)? onPressed;
  final bool isIconButton;
  final bool isButton;
  final void Function(BuildContext context)? onPressedIcon;
  final String appBarTitle;

  FinishScreenModel( {
    required this.title,
    required this.subTitle,
    required this.imagePath,
     this.buttonText ='',
     this.onPressed,
     this.isIconButton=false,
     this.isButton=false,
    this.onPressedIcon,
    this.appBarTitle='',
  });

  void onPressedButton(BuildContext context)=> onPressed!(context);

  void onPressedIconButton(BuildContext context)=> onPressedIcon!(context);
}
