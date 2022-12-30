import 'package:custom_date_time_picker/custom_date_time_picker.dart';
import 'package:custom_date_time_picker/src/app_color.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class TimePicker extends StatefulWidget {
  final Function(String) onSelectedTime;

  TimePicker({Key? key, required this.onSelectedTime}) : super(key: key);

  @override
  State<TimePicker> createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  int currentHour = 0;

  int currentMinute = 0;

  @override
  void initState() {
    setState(() {
      currentHour = DateTime.now().hour;
      currentMinute = DateTime.now().minute;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(CustomDateTimePicker.appDimens!.mediumSpace))),
      child: Wrap(
        children: [
          Container(
            padding: EdgeInsets.only(
                right: CustomDateTimePicker.appDimens!.xSmallSpace,
                bottom: CustomDateTimePicker.appDimens!.xSmallSpace,
                top: CustomDateTimePicker.appDimens!.xSmallSpace,
                left: CustomDateTimePicker.appDimens!.xSmallSpace),
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(CustomDateTimePicker.appDimens!.mediumSpace),
                    topLeft: Radius.circular(CustomDateTimePicker.appDimens!.mediumSpace))),
            child: Row(
              textDirection: TextDirection.rtl,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("زمان",
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        color: AppColor.veryBlueDark,
                        fontSize: CustomDateTimePicker.appDimens!.mediumFontSize,
                        fontWeight: FontWeight.bold)),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.close,
                    color: AppColor.veryBlueDark,
                    size: CustomDateTimePicker.appDimens!.xMediumSpace,
                  ),
                )
              ],
            ),
          ),
          Divider(
            height: CustomDateTimePicker.appDimens!.dividerHeight,
            thickness: CustomDateTimePicker.appDimens!.dividerHeight,
          ),
          Container(
            margin: EdgeInsets.only(top: CustomDateTimePicker.appDimens!.mediumSpace),
            child: Stack(
              children: [
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      margin: EdgeInsets.only(
                          right: CustomDateTimePicker.appDimens!.mediumSpace,
                          left: CustomDateTimePicker.appDimens!.mediumSpace,
                          top: CustomDateTimePicker.appDimens!.mediumSpace),
                      width: double.infinity,
                      height: CustomDateTimePicker.appDimens!.linearDatePickerXLargeSpace,
                      decoration: BoxDecoration(
                          color: AppColor.greyLight200,
                          borderRadius: BorderRadius.all(Radius.circular(CustomDateTimePicker.appDimens!.smallSpace))),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "ساعت",
                              textAlign: TextAlign.center,
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                  color: AppColor.blackLight,
                                  fontWeight: FontWeight.w500,
                                  fontSize: CustomDateTimePicker.appDimens!.xRegularFontSize),
                            ),
                            SizedBox(
                              width: CustomDateTimePicker.appDimens!.linearDatePickerColumnWidth,
                              child: Divider(
                                color: AppColor.grayishBlue,
                                thickness: CustomDateTimePicker.appDimens!.dividerHeight,
                                height: CustomDateTimePicker.appDimens!.dividerHeight,
                              ),
                            ),
                            NumberPicker(
                                textStyle: TextStyle(
                                    fontSize: CustomDateTimePicker.appDimens!.xRegularFontSize,
                                    fontWeight: FontWeight.w500),
                                selectedTextStyle: TextStyle(
                                    fontSize: CustomDateTimePicker.appDimens!.largeFontSize,
                                    fontWeight: FontWeight.w500),
                                value: currentHour,
                                itemHeight: CustomDateTimePicker.appDimens!.linearDatePickerItemExtent,
                                zeroPad: true,
                                minValue: 0,
                                maxValue: 23,
                                onChanged: (value) {
                                  setState(() {
                                    currentHour = value as int;
                                  });
                                }),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "دقیقه",
                          textAlign: TextAlign.center,
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                              color: AppColor.blackLight,
                              fontWeight: FontWeight.w500,
                              fontSize: CustomDateTimePicker.appDimens!.xRegularFontSize),
                        ),
                        SizedBox(
                          width: CustomDateTimePicker.appDimens!.linearDatePickerColumnWidth,
                          child: Divider(
                            color: AppColor.grayishBlue,
                            thickness: CustomDateTimePicker.appDimens!.dividerHeight,
                            height: CustomDateTimePicker.appDimens!.dividerHeight,
                          ),
                        ),
                        NumberPicker(
                            textStyle: TextStyle(
                                fontSize: CustomDateTimePicker.appDimens!.xRegularFontSize,
                                fontWeight: FontWeight.w500),
                            selectedTextStyle: TextStyle(
                                fontSize: CustomDateTimePicker.appDimens!.largeFontSize, fontWeight: FontWeight.w500),
                            itemHeight: CustomDateTimePicker.appDimens!.linearDatePickerItemExtent,
                            value: currentMinute,
                            zeroPad: true,
                            minValue: 0,
                            maxValue: 59,
                            onChanged: (value) {
                              setState(() {
                                currentMinute = value;
                              });
                            }),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.symmetric(
                  horizontal: CustomDateTimePicker.appDimens!.xSmallSpace,
                  vertical: CustomDateTimePicker.appDimens!.smallSpace),
              child: GestureDetector(
                onTap: () {
                  widget.onSelectedTime("$currentHour:$currentMinute");
                  setState(() {
                    Navigator.pop(context);
                  });
                },
                child: Padding(
                    padding: EdgeInsets.all(CustomDateTimePicker.appDimens!.smallSpace),
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppColor.orange,
                          borderRadius: BorderRadius.circular(CustomDateTimePicker.appDimens!.smallSpace)),
                      child: const Center(
                        child: Text("تایید"),
                      ),
                    )),
              ))
        ],
      ),
    );
  }
}
