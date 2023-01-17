import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/globalcolors.dart';


class ProfileCard extends StatelessWidget {
  const ProfileCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.w),
      ),
      child: SizedBox(
        width: double.infinity,
        height: 100.h,
        child: Padding(
          padding: EdgeInsets.all(15.0.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://images.unsplash.com/photo-1671725501835-afb7bd1f21ed?ixlib=rb-4.0.3&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=688&q=80"),
                    radius: 40,
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Mr User",
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            ?.copyWith(color: appPrimaryCol),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        "017122255",
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  const Icon(
                    Icons.edit,
                    color: appSecondaryCol,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
