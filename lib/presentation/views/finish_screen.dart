import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../data/models/finish_screen_model.dart';
import '../widgets/my_button.dart';

class FinishScreen extends StatefulWidget {
  const FinishScreen({super.key, required this.finishScreenModel});
  final FinishScreenModel finishScreenModel;

  @override
  State<FinishScreen> createState() => _FinishScreenState();
}

class _FinishScreenState extends State<FinishScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: widget.finishScreenModel.isIconButton
              ? IconButton(
                  onPressed: () =>
                      widget.finishScreenModel.onPressedIconButton(context),
                  icon: const Icon(Icons.arrow_back),
                )
              : const Center(),
          title: Text(
            widget.finishScreenModel.appBarTitle,
            style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(
                flex: 1,
              ),
              SvgPicture.asset(widget.finishScreenModel.imagePath),
              SizedBox(
                height: 2.h,
              ),
              Text(
                widget.finishScreenModel.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18.sp,
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Text(
                  widget.finishScreenModel.subTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: Colors.grey,
                  ),
                ),
              ),
              const Spacer(
                flex: 2,
              ),
              if (widget.finishScreenModel.isButton)
                MyButton(
                  onPressed: () =>
                      widget.finishScreenModel.onPressedButton(context),
                  text: widget.finishScreenModel.buttonText!,
                ),
              SizedBox(
                height: 1.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
