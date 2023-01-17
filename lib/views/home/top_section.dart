import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../translations/locale_keys.g.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../utils/globalcolors.dart';
import '../../utils/image_links.dart';

class TopSection extends StatefulWidget {
  const TopSection({Key? key}) : super(key: key);

  @override
  State<TopSection> createState() => _TopSectionState();
}

class _TopSectionState extends State<TopSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375.w,
      height: 211.h,
      padding: EdgeInsets.all(10.w),
      decoration: const BoxDecoration(
        color: appPrimaryCol,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(15),
          bottomLeft: Radius.circular(15),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 30.0.h),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      LocaleKeys.home_corporate_title.tr(),
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    SizedBox(
                      height: 13.h,
                    ),
                    SizedBox(
                      width: 0.5.sw,
                      child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent nec justo quamhh",
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                  ],
                ),
                SvgPicture.asset(homeTopSecImgAsset),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
