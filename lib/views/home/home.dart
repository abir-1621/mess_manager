import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mess_manager/views/home/point_card.dart';
import 'package:mess_manager/views/home/top_section.dart';
import '../../custom_widgets/card_icon_with_text.dart';
import '../../translations/locale_keys.g.dart';
import '../../utils/image_links.dart';
import '../../utils/route_names_paths.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            const TopSection(),
            const PointCardSection(),
            SizedBox(
              height: 55.h,
            ),
            Wrap(
              direction: Axis.horizontal,
              spacing: 8.0.w,
              children: [
                GestureDetector(
                  onTap: () {
                    context.go("/${AppRouter.driverListScreenPath}");
                  },
                  child: CardWithIconAndText(
                    imageIconPath: driverIcon,
                    title: LocaleKeys.driver_txt.tr(),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    context.go("/${AppRouter.vehicleListScreenPath}");
                  },
                  child: CardWithIconAndText(
                    imageIconPath: carIcon,
                    title: LocaleKeys.vehicle_txt.tr(),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    context.go("/${AppRouter.transactionScreenPath}");
                  },
                  child: CardWithIconAndText(
                    imageIconPath: transactionIcon,
                    title: LocaleKeys.transaction_txt.tr(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
