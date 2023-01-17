import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mess_manager/views/profile/profile_card.dart';
import 'package:mess_manager/views/profile/profile_title_card.dart';
import 'package:mess_manager/views/profile/user_Info_section.dart';

import '../../utils/globalcolors.dart';
import 'more_info_section.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appInputFieldBgColor,
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Padding(
            padding: EdgeInsets.all(20.0.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                const ProfileTitleCard(),
                SizedBox(
                  height: 8.h,
                ),
                const ProfileCard(),
                SizedBox(
                  height: 15.h,
                ),
                const UserInfoSection(),
                const MoreInfoSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
