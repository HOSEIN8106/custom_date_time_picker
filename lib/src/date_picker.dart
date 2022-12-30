import 'package:custom_date_time_picker/custom_date_time_picker.dart';
import 'package:custom_date_time_picker/src/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:shamsi_date/shamsi_date.dart';

class DatePicker extends StatefulWidget {
  final bool? showDay;
  final Function(String date) dateChangeListener;

  final String startDate;
  final String endDate;
  final String initialDate;

  final String? fontFamily;

  final Color? textColor;
  final Color? selectedColor;
  final Color? unselectedColor;

  final String? yearText;
  final String? monthText;
  final String? dayText;

  final bool? showLabels;
  final double? columnWidth;
  final double? fontSize;
  final bool isJalaali;
  final bool? showMonthName;

  DatePicker({
    required this.startDate,
    required this.endDate,
    required this.initialDate,
    required this.dateChangeListener,
    this.showDay = true,
    this.fontFamily = "",
    this.textColor,
    this.selectedColor,
    this.unselectedColor,
    this.yearText = "سال",
    this.monthText = "ماه",
    this.dayText = "روز",
    this.showLabels = true,
    columnWidth,
    this.fontSize,
    this.isJalaali = false,
    this.showMonthName = false,
  }) : columnWidth = (columnWidth ?? CustomDateTimePicker.appDimens!.linearDatePickerColumnWidth);

  @override
  _DatePickerState createState() => _DatePickerState(
        startDate,
        endDate,
        initialDate,
        dateChangeListener,
        showDay: showDay,
        fontFamily: fontFamily,
        textColor: textColor,
        selectedColor: selectedColor,
        unselectedColor: unselectedColor,
        yearText: yearText,
        monthText: monthText,
        dayText: dayText,
        showLabels: showLabels,
        columnWidth: columnWidth,
        fontSize: fontSize,
        isJalaali: isJalaali,
        showMonthName: showMonthName,
      );
}

class _DatePickerState extends State<DatePicker> {
  int _selectedYear = 0;
  int _selectedMonth = 0;
  int _selectedDay = 0;

  int minYear = 0;
  int maxYear = 0;

  int minMonth = 01;
  int maxMonth = 12;

  int minDay = 01;
  int maxDay = 31;

  bool? showDay;

  String startDate = '';
  String endDate = '';
  String initialDate = '';

  Function(String date) onDateSelected;

  String? fontFamily;

  Color? textColor;
  Color? selectedColor;
  Color? unselectedColor;

  String? yearText;
  String? monthText;
  String? dayText;

  bool? showLabels = false;

  double? columnWidth;
  double? fontSize;

  bool isJalaali = true;

  bool? showMonthName;

  _DatePickerState(this.startDate, this.endDate, this.initialDate, this.onDateSelected,
      {this.showDay = true,
      this.fontFamily = "",
      required this.textColor,
      required this.selectedColor,
      required this.unselectedColor,
      required this.yearText,
      required this.monthText,
      required this.dayText,
      required this.showLabels,
      required this.columnWidth,
      required this.fontSize,
      required this.isJalaali,
      required this.showMonthName});

  @override
  initState() {
    super.initState();
    if (isJalaali) {
      minYear = Jalali.now().year - 100;
      maxYear = Jalali.now().year;
    } else {
      minYear = Gregorian.now().year - 100;
      maxYear = Gregorian.now().year;
    }
    if (initialDate.isNotEmpty) {
      List<String> initList = initialDate.split("/");
      _selectedYear = int.parse(initList[0]);
      _selectedMonth = int.parse(initList[1]);
      if (showDay != null && showDay!) {
        _selectedDay = int.parse(initList[2]);
      } else {
        _selectedDay = isJalaali ? Jalali.now().day : Jalali.now().day;
      }
    } else {
      if (isJalaali) {
        _selectedYear = Jalali.now().year;
        _selectedMonth = Jalali.now().month;
        _selectedDay = Jalali.now().day;
      } else {
        _selectedYear = Gregorian.now().year;
        _selectedMonth = Gregorian.now().month;
        _selectedDay = Gregorian.now().day;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    maxDay = _getMonthLength(_selectedYear, _selectedMonth);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: CustomDateTimePicker.appDimens!.mediumSpace,
        ),
        Visibility(
          visible: showLabels != null && showLabels!,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  SizedBox(
                      width: columnWidth,
                      child: Text(
                        yearText!,
                        style: TextStyle(
                            fontFamily: fontFamily, color: textColor, fontSize: fontSize, fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center,
                      )),
                  Container(
                      width: columnWidth! - CustomDateTimePicker.appDimens!.linearDatePickerXLargeSpace,
                      height: CustomDateTimePicker.appDimens!.dividerHeight,
                      color: AppColor.grayishBlue)
                ],
              ),
              Column(
                children: [
                  SizedBox(
                      width: columnWidth,
                      child: Text(
                        monthText!,
                        style: TextStyle(
                            fontFamily: fontFamily, color: textColor, fontSize: fontSize, fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center,
                      )),
                  Container(
                      width: columnWidth! - CustomDateTimePicker.appDimens!.linearDatePickerXLargeSpace,
                      height: CustomDateTimePicker.appDimens!.dividerHeight,
                      color: AppColor.grayishBlue)
                ],
              ),
              Visibility(
                visible: showDay != null && showDay!,
                child: Column(
                  children: [
                    SizedBox(
                        width: columnWidth,
                        child: Text(
                          dayText!,
                          style: TextStyle(
                              fontFamily: fontFamily,
                              color: textColor,
                              fontSize: fontSize,
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        )),
                    Container(
                        width: columnWidth! - CustomDateTimePicker.appDimens!.linearDatePickerXLargeSpace,
                        height: CustomDateTimePicker.appDimens!.dividerHeight,
                        color: AppColor.grayishBlue)
                  ],
                ),
              ),
            ],
          ),
        ),
        Stack(
          children: [
            Positioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: CustomDateTimePicker.appDimens!.mediumSpace),
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
                NumberPicker(
                    itemWidth: columnWidth!,
                    value: _selectedYear,
                    minValue: _getMinimumYear(),
                    maxValue: _getMaximumYear(),
                    textStyle: TextStyle(
                        fontSize: CustomDateTimePicker.appDimens!.mediumFontSize,
                        fontWeight: FontWeight.w500,
                        fontFamily: fontFamily),
                    selectedTextStyle: TextStyle(
                        fontSize: CustomDateTimePicker.appDimens!.largeFontSize,
                        fontWeight: FontWeight.w500,
                        fontFamily: fontFamily),
                    itemHeight: CustomDateTimePicker.appDimens!.linearDatePickerItemExtent,
                    onChanged: (value) {
                      setState(() {
                        _selectedYear = value;
                        if (showDay != null && showDay!) {
                          onDateSelected("$_selectedYear/$_selectedMonth/$_selectedDay");
                        } else {
                          onDateSelected("$_selectedYear/$_selectedMonth");
                        }
                      });
                    }),
                NumberPicker(
                    itemWidth: columnWidth!,
                    value: _selectedMonth,
                    minValue: _getMinimumMonth(),
                    maxValue: _getMaximumMonth(),
                    textStyle: TextStyle(
                        fontSize: CustomDateTimePicker.appDimens!.mediumFontSize,
                        fontWeight: FontWeight.w500,
                        fontFamily: fontFamily),
                    selectedTextStyle: TextStyle(
                        fontSize: CustomDateTimePicker.appDimens!.largeFontSize,
                        fontWeight: FontWeight.w500,
                        fontFamily: fontFamily),
                    itemHeight: CustomDateTimePicker.appDimens!.linearDatePickerItemExtent,
                    onChanged: (value) {
                      setState(() {
                        _selectedMonth = value;
                        if (showDay != null && showDay!) {
                          onDateSelected("$_selectedYear/$_selectedMonth/$_selectedDay");
                        } else {
                          onDateSelected("$_selectedYear/$_selectedMonth");
                        }
                      });
                    }),
                Visibility(
                  visible: showDay != null && showDay!,
                  child: Theme(
                    data: Theme.of(context).copyWith(
                        textTheme: Theme.of(context).textTheme.copyWith(
                            bodyText2: TextStyle(
                                fontSize: CustomDateTimePicker.appDimens!.xRegularFontSize,
                                fontWeight: FontWeight.w500),
                            headline5: TextStyle(
                                fontSize: CustomDateTimePicker.appDimens!.largeFontSize, fontWeight: FontWeight.w500))),
                    child: NumberPicker(
                        itemWidth: columnWidth!,
                        value: _selectedDay,
                        minValue: _getMinimumDay(),
                        maxValue: _getMaximumDay(),
                        textStyle: TextStyle(
                            fontSize: CustomDateTimePicker.appDimens!.mediumFontSize,
                            fontWeight: FontWeight.w500,
                            fontFamily: fontFamily),
                        selectedTextStyle: TextStyle(
                            fontSize: CustomDateTimePicker.appDimens!.largeFontSize,
                            fontWeight: FontWeight.w500,
                            fontFamily: fontFamily),
                        itemHeight: CustomDateTimePicker.appDimens!.linearDatePickerItemExtent,
                        onChanged: (value) {
                          setState(() {
                            _selectedDay = value;
                            if (showDay != null && showDay!) {
                              onDateSelected("$_selectedYear/$_selectedMonth/$_selectedDay");
                            } else {
                              onDateSelected("$_selectedYear/$_selectedMonth");
                            }
                          });
                        }),
                  ),
                )
              ],
            )
          ],
        ),
      ],
    );
  }

  _getMonthLength(int selectedYear, int selectedMonth) {
    if (isJalaali) {
      if (selectedMonth <= 6) {
        return 31;
      }
      if (selectedMonth > 6 && selectedMonth < 12) {
        return 30;
      }
      if (Jalali(selectedYear).isLeapYear()) {
        return 30;
      } else {
        return 29;
      }
    } else {
      DateTime firstOfNextMonth;
      if (selectedMonth == 12) {
        firstOfNextMonth = DateTime(selectedYear + 1, 1, 1, 12); //year, selectedMonth, day, hour
      } else {
        firstOfNextMonth = DateTime(selectedYear, selectedMonth + 1, 1, 12);
      }
      int numberOfDaysInMonth = firstOfNextMonth.subtract(const Duration(days: 1)).day;
      //.subtract(Duration) returns a DateTime, .day gets the integer for the day of that DateTime
      return numberOfDaysInMonth;
    }
  }

  int _getMinimumMonth() {
    if (startDate.isNotEmpty) {
      var startList = startDate.split("/");
      int startMonth = int.parse(startList[1]);

      if (_selectedYear == _getMinimumYear()) {
        return startMonth;
      }
    }

    return minMonth;
  }

  int _getMaximumMonth() {
    if (endDate.isNotEmpty) {
      var endList = endDate.split("/");
      int endMonth = int.parse(endList[1]);
      if (_selectedYear == _getMaximumYear()) {
        return endMonth;
      }
    }
    return maxMonth;
  }

  int _getMinimumYear() {
    if (startDate.isNotEmpty) {
      var startList = startDate.split("/");
      return int.parse(startList[0]);
    }
    return minYear;
  }

  _getMaximumYear() {
    if (endDate.isNotEmpty) {
      var endList = endDate.split("/");
      return int.parse(endList[0]);
    }
    return maxYear;
  }

  int _getMinimumDay() {
    if (startDate.isNotEmpty && (showDay != null && showDay!)) {
      var startList = startDate.split("/");
      int startDay = int.parse(startList[2]);

      if (_selectedYear == _getMinimumYear() && _selectedMonth == _getMinimumMonth()) {
        return startDay;
      }
    }

    return minDay;
  }

  int _getMaximumDay() {
    if (endDate.isNotEmpty && (showDay != null && showDay!)) {
      var endList = endDate.split("/");
      int endDay = int.parse(endList[2]);
      if (_selectedYear == _getMaximumYear() && _selectedMonth == _getMinimumMonth()) {
        return endDay;
      }
    }
    return _getMonthLength(_selectedYear, _selectedMonth);
  }
}
