import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../utils/globalcolors.dart';
import '../../utils/image_links.dart';

class TransactionListCardItem extends StatelessWidget {
  const TransactionListCardItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: appInputFieldBgColor,
      elevation: 0,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.w),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.0.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(bkashIcon),
            SizedBox(
              width: 8.w,
            ),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Bkash",
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  const CardRichTextItem(
                    title: "bkash no",
                    bodyTxt: "017177777000",
                  ),
                  const CardRichTextItem(
                    title: "TID ",
                    bodyTxt: "R-121221112",
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text("25,jan,2023"),
                SizedBox(
                  height: 13.h,
                ),
                const Text(
                  "+\$20000000000",
                  style: TextStyle(color: appGreen),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CardRichTextItem extends StatelessWidget {
  final String title;
  final String bodyTxt;

  const CardRichTextItem({
    Key? key,
    required this.title,
    required this.bodyTxt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "$title ",
        style: Theme.of(context).textTheme.subtitle1!.copyWith(
              color: appPrimaryCol,
            ),
        children: <TextSpan>[
          TextSpan(
              text: '$bodyTxt', style: Theme.of(context).textTheme.bodyText2),
        ],
      ),
    );
  }
}
