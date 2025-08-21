import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DefaultNetworkImage extends StatelessWidget {
  const DefaultNetworkImage(
      {super.key, this.height, this.width, required this.imageURL, this.fit});

  final double? height;
  final double? width;
  final String imageURL;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    if (imageURL.isNotEmpty) {
      return Image.network(
        imageURL,
        fit: fit,
        height: height,
        width: width,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          } else {
            return Padding(
              padding: EdgeInsets.all(2.sp),
              child: CircularProgressIndicator(
                strokeWidth: 4.sp,
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                    : null,
              ),
            );
          }
        },
        errorBuilder: ((context, error, stackTrace) {
          return const Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error, color: Colors.red),
            ],
          ));
        }),
      );
    } else {
      return const Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error, color: Colors.red),
        ],
      ));
    }
  }
}
