import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/globalcolors.dart';

class PointCardSection extends StatefulWidget {
  const PointCardSection({Key? key}) : super(key: key);

  @override
  State<PointCardSection> createState() => _PointCardSectionState();
}

class _PointCardSectionState extends State<PointCardSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 325.w,
      height: 110.h,
      margin: EdgeInsets.only(top: 33.h),
      decoration: BoxDecoration(
        color: appSecondaryCol,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Flexible(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.all(18.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        "January,2023",
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            ?.copyWith(fontSize: 15.sp),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "\$2,55,800",
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            ?.copyWith(fontSize: 20.sp),
                      ),
                    ],
                  ),
                  Container(
                    width: 50.w,
                    height: 50.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(width: 2, color: Colors.white),
                    ),
                    child: const Icon(
                      Icons.point_of_sale_sharp,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
