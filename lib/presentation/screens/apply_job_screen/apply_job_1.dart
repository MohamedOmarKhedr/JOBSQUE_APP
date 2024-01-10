import 'package:flutter/material.dart';
import 'package:job_finder/business_logic/apply_job_cubit/apply_job_cubit.dart';
import 'package:sizer/sizer.dart';
import 'package:country_code_picker/country_code_picker.dart';
import '../../widgets/my_job_text_field.dart';

class ApplyJob1 extends StatefulWidget {
  final ApplyJobCubit applyJobCubit;
  const ApplyJob1({super.key, required this.applyJobCubit});

  @override
  State<ApplyJob1> createState() => _ApplyJob1State();
}

class _ApplyJob1State extends State<ApplyJob1> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();

  CountryCode countryCode = CountryCode(name: 'EG', dialCode: '+20');
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 2.h,horizontal: 4.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 1.h),
            child: Text(
              'Bio data',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            'Fill in your bio data correctly',
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 10.sp, color: Colors.grey[600]),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 1.h),
            child: Text(
              'Full Name',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
            ),
          ),
          MyJobTextField(
            prefixIcon: const Icon(Icons.person_2_outlined),
            hintText: 'Full Name',
            onChanged: (text) {
              widget.applyJobCubit.userName = text;
            },
            controller: _nameController,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 1.h),
            child: Text(
              'Email',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
            ),
          ),
          MyJobTextField(
            prefixIcon: const Icon(Icons.email_outlined),
            hintText: 'Email',
            onChanged: (text) {
              widget.applyJobCubit.email = text;
            },
            controller: _emailController,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 1.h),
            child: Text(
              'No.Hand phone',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
            ),
          ),
          MyJobTextField(
            keyboardType: TextInputType.number,
            prefixIcon: CountryCodePicker(
              onChanged: (countryCode) {
                this.countryCode = countryCode;
              },
              initialSelection: 'EG',
              favorite: const ['+20', 'EG'],
            ),
            hintText: 'No.Hand phone',
            onChanged: (text) {
              widget.applyJobCubit.mobile = text;
            },
            controller: _mobileController,
          ),
        ],
      ),
    );
  }
}
