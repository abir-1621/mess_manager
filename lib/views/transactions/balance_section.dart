import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../custom_widgets/custom_arc_painter.dart';
import '../../custom_widgets/rich_title_subtitle_text.dart';
import '../../translations/locale_keys.g.dart';
import '../../utils/globalcolors.dart';


class BalanceSection extends StatelessWidget {
  const BalanceSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.30,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 8.0.h),
            child: Align(
              alignment: Alignment.topLeft,
              child: RichTitleSubtilteText(
                title: "${LocaleKeys.expense_txt.tr()}\n",
                subtitle: "-\$12225",
                subtitleColor: appSecondaryCol,
              ),
            ),
          ),
          Stack(
            children: [
              CustomPaint(
                painter: MyArcPainter(),
                size: Size(120.w, 120.w),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.center,
                  child: RichTitleSubtilteText(
                    title: "${LocaleKeys.balance_txt.tr()}\n",
                    subtitle: "\$100225",
                    subtitleColor: appPrimaryCol,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 5.0.h, bottom: 5.0.h),
            child: Align(
              alignment: Alignment.bottomRight,
              child: RichTitleSubtilteText(
                title: "${LocaleKeys.deposit_txt.tr()}\n",
                subtitle: "+\$1225",
                subtitleColor: appPrimaryCol,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
