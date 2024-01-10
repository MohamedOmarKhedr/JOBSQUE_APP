import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:job_finder/core/my_cache_keys.dart';
import 'package:job_finder/data/local_data/my_cache.dart';

class SavedIcon extends StatefulWidget {
  final String jobId;

  const SavedIcon({
    super.key,
    required this.jobId,
  });

  @override
  State<SavedIcon> createState() => _SavedIconState();
}

class _SavedIconState extends State<SavedIcon> {
  late bool isSavedClicked;

  bool isSavedClickedMethod({required String jobId}){
    List<String> jobsIdSaved = MyCache.getStringList(key: MyCacheKeys.jobsIdSavedList);
    if(jobsIdSaved.contains(jobId)){
      return true;
    }else{
      return false;
    }
  }

  void onTapSavedClicked({required String jobId}) {
    List<String> jobsIdSaved = MyCache.getStringList(key: MyCacheKeys.jobsIdSavedList);

    if (isSavedClicked) {
      // If the item is already saved, remove it
      if (jobsIdSaved.contains(jobId)) {
        jobsIdSaved.remove(jobId);
        MyCache.putStringList(key: MyCacheKeys.jobsIdSavedList, value: jobsIdSaved);
        if (kDebugMode) {

          print(MyCache.getStringList(key: MyCacheKeys.jobsIdSavedList));
        }
      }
      isSavedClicked = false;
    } else {
      // If the item is not saved, add it
      if (!jobsIdSaved.contains(jobId)&&jobId!='-1') {
        jobsIdSaved.add(jobId);
      }

      MyCache.putStringList(key: MyCacheKeys.jobsIdSavedList, value: jobsIdSaved);

      if (kDebugMode) {
        print(MyCache.getStringList(key: MyCacheKeys.jobsIdSavedList));
      }

      isSavedClicked = true;
    }
  }

  @override
  void didChangeDependencies() {
    isSavedClicked = isSavedClickedMethod(jobId:widget.jobId);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          onTapSavedClicked(jobId: widget.jobId);
        });
      },
      icon: Visibility(
        visible: isSavedClicked,
        replacement: SvgPicture.asset(
            'assets/images/home_layout/saved.svg'),
        child: SvgPicture.asset('assets/images/home_layout/saved2.svg'),
      ),
    );
  }
}
