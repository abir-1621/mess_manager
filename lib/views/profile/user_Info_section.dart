import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../custom_widgets/info_item_title.dart';
import '../../utils/globalcolors.dart';

class UserInfoSection extends StatelessWidget {
  const UserInfoSection({Key? key}) : super(key: key);

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
                  "Account info",
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
                    Icons.location_pin,
                    color: appSecondaryCol,
                  ),
                  titleTxt: "Address",
                  bodyTxt: "Bangladesh,New york,Dhaka-1210",
                ),
              ),
              buildInfoDivider(),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: InfoItemTile(
                  icon: Icon(
                    Icons.call,
                    color: Colors.green,
                  ),
                  titleTxt: "Phone",
                  bodyTxt: "01714455855",
                ),
              ),
              buildInfoDivider(),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: InfoItemTile(
                  icon: Icon(
                    Icons.logout,
                    color: Colors.grey,
                  ),
                  titleTxt: "Log out",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Divider buildInfoDivider() {
    return const Divider(
      color: Colors.grey,
      thickness: 0.3,
    );
  }
}
