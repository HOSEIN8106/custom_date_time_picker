library custom_date_time_picker;

import 'package:custom_date_time_picker/src/app_dimens.dart';
import 'package:custom_date_time_picker/src/date_picker.dart';
import 'package:custom_date_time_picker/src/time_picker.dart';
import 'package:flutter/material.dart';

class CustomDateTimePicker {
  static AppDimens? appDimens;

  static void showCustomDatePicker(BuildContext context, String startDate, String endDate, String initialDate,
      Function(String date) dateChangeListener) {
    AppDimens.initAppDimen(context);
    Dialog dateDialog = Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)), //th
      insetPadding: EdgeInsets.symmetric(horizontal: 16), // is right here
      child: DatePicker(
        startDate: startDate,
        endDate: endDate,
        initialDate: initialDate,
        dateChangeListener: dateChangeListener,
      ),
    );
    showDialog(context: context, builder: (context) => dateDialog);
  }

  static void showCustomTimePicker(BuildContext context, Function(String) onSelectedTime) {
    AppDimens.initAppDimen(context);
    Dialog timeDialog = Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      insetPadding: EdgeInsets.symmetric(horizontal: 16), // is right here
      child: TimePicker(
        onSelectedTime: onSelectedTime,
      ),
    );
    showDialog(context: context, builder: (context) => timeDialog);
  }
}
