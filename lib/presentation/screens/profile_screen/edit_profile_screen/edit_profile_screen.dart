import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:job_finder/core/screens.dart';
import 'package:job_finder/presentation/widgets/my_button.dart';
import 'package:sizer/sizer.dart';

import '../../../../business_logic/profile_cubit/profile_cubit.dart';
import '../../../../core/my_cache_keys.dart';
import '../../../../data/local_data/my_cache.dart';
import '../../../style/colors.dart';
import '../../../views/back_arrow_button.dart';
import '../../../widgets/my_job_text_field.dart';

class EditProfileScreen extends StatefulWidget {
  final String title;
  const EditProfileScreen({super.key, required this.title});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late TextEditingController _nameController;
  late TextEditingController _addressController;
  late TextEditingController _mobileController;
  late TextEditingController _bioController;

  CountryCode countryCode = CountryCode(name: 'EG', dialCode: '+20');

  late ProfileCubit profileCubit;
  @override
  void didChangeDependencies() {
    profileCubit = ProfileCubit.get(context);
    _nameController = TextEditingController(text: profileCubit.profileName);
    _addressController =
        TextEditingController(text: profileCubit.profileAddress);
    _mobileController =
        TextEditingController(text: profileCubit.profilePhoneNumber);
    _bioController = TextEditingController(text: profileCubit.profileBio);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: BackArrowButton(context: context),
            centerTitle: true,
            title: Text(
              widget.title,
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 4.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (MyCache.getString(key: MyCacheKeys.profileImagePath) ==
                      '')
                    Center(
                      child: SizedBox(
                        height: 10.h,
                        width: 10.h,
                        child: Stack(
                          children: [
                            Container(
                              height: 10.h,
                              width: 10.h,
                              decoration: BoxDecoration(
                                  color: grey,
                                  border:
                                      Border.all(color: Colors.white, width: 2.sp),
                                  borderRadius: BorderRadius.circular(50.sp),
                                  image: const DecorationImage(
                                    image: AssetImage(
                                      'assets/images/home_layout/profile.png',
                                    ),
                                  )),

                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  profileCubit.pickProfileImage();
                                });
                              },
                              child: Container(
                                height: 10.h,
                                width: 10.h,
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(.2),
                                  borderRadius: BorderRadius.circular(50.sp),),
                                child: Center(
                                    child: SvgPicture.asset(
                                        'assets/images/home_layout/camera.svg')),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  else
                    Center(
                      child: SizedBox(
                        height: 10.h,
                        width: 10.h,
                        child: Stack(
                          children: [
                            Container(
                              height: 10.h,
                              width: 10.h,
                              padding: EdgeInsets.only(
                                top: 10.h,
                              ),
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.white, width: 2.sp),
                                  borderRadius: BorderRadius.circular(50.sp),
                                  image: DecorationImage(
                                    image: FileImage(profileCubit.fileImage!),
                                  )),

                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  profileCubit.pickProfileImage();
                                });
                              },
                              child: Container(
                                height: 10.h,
                                width: 10.h,
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(.2),
                                    borderRadius: BorderRadius.circular(50.sp),),
                                child: Center(
                                    child: SvgPicture.asset(
                                        'assets/images/home_layout/camera.svg')),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  Center(
                    child: Text(
                      'Change photo',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 12.sp,
                          color: blue,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 1.h, top: 2.h),
                    child: Text(
                      'Name',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[600]),
                    ),
                  ),
                  MyJobTextField(
                    hintText: 'Name',
                    onChanged: (text) {
                      profileCubit.profileName = text;
                    },
                    controller: _nameController,
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 1.h, top: 2.h),
                    child: Text(
                      'Bio',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[600]),
                    ),
                  ),
                  MyJobTextField(
                    hintText: 'Bio',
                    onChanged: (text) {
                      profileCubit.profileBio = text;
                    },
                    controller: _bioController,
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 1.h, top: 2.h),
                    child: Text(
                      'Address',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[600]),
                    ),
                  ),
                  MyJobTextField(
                    hintText: 'Address',
                    onChanged: (text) {
                      profileCubit.profileAddress = text;
                    },
                    controller: _addressController,
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 1.h, top: 2.h),
                    child: Text(
                      'No.Hand phone',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[600]),
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
                      profileCubit.profilePhoneNumber = text;
                    },
                    controller: _mobileController,
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Center(
                      child: MyButton(
                          onPressed: () {
                            MyCache.putString(
                                key: MyCacheKeys.userName,
                                value: profileCubit.profileName);
                            MyCache.putString(
                                key: MyCacheKeys.profileBio,
                                value: profileCubit.profileBio);
                            MyCache.putString(
                                key: MyCacheKeys.profileAddress,
                                value: profileCubit.profileAddress);
                            MyCache.putString(
                                key: MyCacheKeys.profilePhoneNumber,
                                value: profileCubit.profilePhoneNumber);
                            profileCubit.postUpdateUserData(name: profileCubit.profileName, password: MyCache.getString(key: MyCacheKeys.password));
                            profileCubit.isPersonalDetailsDone();
                            Navigator.pop(context);
                          },
                          text: 'Save'))
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
