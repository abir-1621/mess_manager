import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mess_manager/views/transactions/transaction_cardItem.dart';
import '../../custom_widgets/build_appbar_function.dart';
import '../../custom_widgets/outlined_icon_btn.dart';
import '../../translations/locale_keys.g.dart';
import '../../utils/globalcolors.dart';
import 'balance_section.dart';

class TransactionSreeen extends StatefulWidget {
  const TransactionSreeen({Key? key}) : super(key: key);

  @override
  State<TransactionSreeen> createState() => _TransactionSreeenState();
}

class _TransactionSreeenState extends State<TransactionSreeen> {
  DateTime dateTime = DateTime.now();
  String _selectedDate = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //set selected date as current date and time
    final formatter = DateFormat(DateFormat.yMMMd().pattern, 'en_US');
    final timeString = formatter.format(dateTime!);
    _selectedDate = timeString;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar:buildAppBar(
        context: context,
        title: LocaleKeys.transaction_history_txt.tr(),
        appbarActionWidget: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.h, vertical: 15.w),
          child: GestureDetector(
            onTap: () {
              _showDatePicker();
            },
            child: const Icon(
              Icons.calendar_month,
              color: appSecondaryCol,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0.w, vertical: 10.h),
            child: Align(
              alignment: Alignment.topRight,
              child: Text(
                _selectedDate,
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ),
          ),
          Column(
            children: [
              const BalanceSection(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                child: Card(
                  color: appInputFieldBgColor,
                  elevation: 0,
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.w),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 2.h),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            LocaleKeys.transaction_history_txt.tr(),
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(color: appPrimaryCol),
                          ),
                        ),
                        Row(
                          children: [
                            CustomOutlinedIconBtn(
                              iconData: Icons.add,
                              btnText: "Deposit",
                              onPressed: () {},
                              color: appGreen,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            CustomOutlinedIconBtn(
                              iconData: Icons.remove,
                              btnText: "Expense",
                              onPressed: () {},
                              color: appSecondaryCol,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index) => const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 0),
                child: TransactionListCardItem(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _showDatePicker() {
    // showCupertinoModalPopup(
    //     context: context,
    //     builder: (BuildContext context) {
    //       return Container(
    //         height: 200,
    //         child: CupertinoDatePicker(
    //           onDateTimeChanged: (DateTime newDateTime) {
    //             // handle the new date
    //           },
    //           minimumDate: DateTime.now().subtract(Duration(days: 30)),
    //           maximumDate: DateTime.now().add(Duration(days: 30)),
    //           maximumYear: 2025,
    //           mode: CupertinoDatePickerMode.date,
    //         ),
    //       );
    //     });

    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2050),
    ).then((dateTime) {
      final formatter = DateFormat(DateFormat.yMMMd().pattern, 'en_US');
      final timeString = formatter.format(dateTime!);
      setState(() {
        _selectedDate = timeString;
      });
      print(timeString);
      print("${dateTime?.day.toString()} ${dateTime?.month.toString()}");
    });
  }
}
