import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CardWithIconAndText extends StatelessWidget {
  final String imageIconPath;
  final String title;

  const CardWithIconAndText(
      {Key? key, this.imageIconPath = "", this.title = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14.0.w),
      ),
      elevation: 1.0,
      child: Container(
        width: 94.w,
        height: 78.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(imageIconPath),
            SizedBox(height: 10.0.h),
            Text(
              title,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ],
        ),
      ),
    );
  }
}
