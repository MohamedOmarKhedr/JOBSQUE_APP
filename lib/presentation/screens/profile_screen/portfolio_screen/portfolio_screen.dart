import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:job_finder/core/my_cache_keys.dart';
import 'package:job_finder/data/local_data/my_cache.dart';
import 'package:job_finder/presentation/views/back_arrow_button.dart';
import 'package:sizer/sizer.dart';

import '../../../../business_logic/profile_cubit/profile_cubit.dart';
import '../../../views/profile_screen/portfolio_item.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  late ProfileCubit profileCubit;

  @override
  void didChangeDependencies() {
    profileCubit = ProfileCubit.get(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is PickPortfolioFileSuccessfulState) {
          List<String> portfoliosNamesList =
              MyCache.getStringList(key: MyCacheKeys.portfoliosNamesList);
          portfoliosNamesList.add(profileCubit.portfolioName);
          MyCache.putStringList(
              key: MyCacheKeys.portfoliosNamesList, value: portfoliosNamesList);
          List<String> portfoliosSizesList =
              MyCache.getStringList(key: MyCacheKeys.portfoliosSizesList);
          portfoliosSizesList.add(profileCubit.portfolioSize.toString());
          MyCache.putStringList(
              key: MyCacheKeys.portfoliosSizesList, value: portfoliosSizesList);
          profileCubit.portfolioSize=0;
          profileCubit.portfolioName='';
        }
      },
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  onPressed: () {
                    profileCubit.isPortfolioDone();
                    Navigator.pop(context);
                  },
                  icon: SvgPicture.asset(
                    'assets/images/home_layout/arrow-left.svg',
                    height: 3.h,
                    width: 8.w,
                  )),
              centerTitle: true,
              title: Text(
                'Portfolio',
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
              ),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                    onTap: () {
                      profileCubit.pickPortfolioFile();
                    },
                    child: SvgPicture.asset(
                        'assets/images/home_layout/Upload document.svg')),
                SizedBox(
                  height: 3.h,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          return PortfolioItem(
                            index: index,
                            fileName: MyCache.getStringList(
                                key: MyCacheKeys.portfoliosNamesList)[index],
                            fileSize: MyCache.getStringList(
                                key: MyCacheKeys.portfoliosSizesList)[index],
                            profileCubit: profileCubit,
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 1.h,
                          );
                        },
                        itemCount: MyCache.getStringList(
                                key: MyCacheKeys.portfoliosNamesList)
                            .length),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
