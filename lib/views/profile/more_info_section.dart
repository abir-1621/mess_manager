import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../custom_widgets/info_item_title.dart';
import '../../utils/globalcolors.dart';

class MoreInfoSection extends StatelessWidget {
  const MoreInfoSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.w),
      ),
      child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "More info",
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.copyWith(color: appPrimaryCol),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: InfoItemTile(
                    icon: Icon(
                      Icons.support_agent_sharp,
                      color: appSecondaryCol,
                    ),
                    titleTxt: "Help & support",
                    bodyTxt: "Call us on 01714555696",
                  ),
                ),
                buildInfoDivider(),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: InfoItemTile(
                    icon: Icon(
                      Icons.app_shortcut,
                      color: appYellow,
                    ),
                    titleTxt: "About app",
                  ),
                ),
              ],
            ),
          )),
    );
  }

  Divider buildInfoDivider() {
    return const Divider(
      color: Colors.grey,
      thickness: 0.3,
    );
  }
}
