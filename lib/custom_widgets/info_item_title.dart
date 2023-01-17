import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/globalcolors.dart';


class InfoItemTile extends StatelessWidget {
  final Widget? icon;
  final String? titleTxt;
  final String? bodyTxt;
  final Function()? onTap;

  const InfoItemTile(
      {Key? key, this.icon, this.titleTxt, this.bodyTxt, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: CircleAvatar(
              radius: 20,
              backgroundColor: appInputFieldBgColor,
              child: icon,
            ),
          ),
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  titleTxt ?? "",
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                if (bodyTxt != null)
                  SizedBox(
                    height: 5.h,
                  ),
                if (bodyTxt != null) Text(bodyTxt ?? ""),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
