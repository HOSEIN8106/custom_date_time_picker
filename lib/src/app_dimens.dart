import 'package:custom_date_time_picker/custom_date_time_picker.dart';
import 'package:flutter/cupertino.dart';

class AppDimens {
  double veryTinySpace = 2;
  double tinySpace = 4;
  double xTinySpace = 6;
  double smallSpace = 8;
  double xSmallSpace = 12;
  double mediumSpace = 16;
  double xMediumSpace = 20;
  double largeSpace = 24;
  double xLargeSpace = 32;
  double xxLargeSpace = 36;
  double xxxLargeSpace = 44;

  double smallFontSize = 8;
  double xSmallFontSize = 10;
  double regularFontSize = 12;
  double xRegularFontSize = 14;
  double mediumFontSize = 16;
  double xMediumFontSize = 18;
  double xxMediumFontSize = 20;
  double xxxMediumFontSize = 24;
  double largeFontSize = 28;
  double xLargeFontSize = 32;
  double xxLargeFontSize = 36;
  double xxxLargeFontSize = 44;

  double standardIconSize = 18;

  double smallIconSize = 20;
  double mediumIconSize = 24;
  double largeIconSize = 30;

  double inputBoxHeight = 50;
  double inputBoxMinHeight = 44;

  double buttonSize = 50;

  double bottomSheetHeight = 60;
  double appBarHeight = 60;
  double largeAppBarHeight = 160;
  double itemButtonHeight = 60;
  double dashLineWidth = 3;
  double dividerHeight = 1;

  //LinearDatePicker
  double linearDatePickerXLargeSpace = 40;
  double linearDatePickerColumnWidth = 55;
  double linearDatePickerExtraColumnWidth = 102;
  double linearDatePickerItemExtent = 50;

  setLinearDatePickerItemExtent(double value) {
    linearDatePickerItemExtent = value;
  }

  setLinearDatePickerExtraColumnWidth(double value) {
    linearDatePickerExtraColumnWidth = value;
  }

  setLinearDatePickerColumnWidth(double value) {
    linearDatePickerColumnWidth = value;
  }

  setLinearDatePickerXLargeSpace(double value) {
    linearDatePickerXLargeSpace = value;
  }

  setDividerHeight(double value) {
    dividerHeight = value;
  }

  setDashLineWidth(double value) {
    dashLineWidth = value;
  }

  setItemButtonHeight(double value) {
    itemButtonHeight = value;
  }

  setLargeAppBarHeight(double value) {
    largeAppBarHeight = value;
  }

  setAppBarHeight(double value) {
    appBarHeight = value;
  }

  setBottomSheetHeight(double value) {
    bottomSheetHeight = value;
  }

  setButtonSize(double value) {
    buttonSize = value;
  }

  setInputBoxHeight(double value) {
    inputBoxHeight = value;
  }

  setInputBoxMinHeight(double value) {
    inputBoxMinHeight = value;
  }

  setLargeIconSize(double value) {
    largeIconSize = value;
  }

  setMediumIconSize(double value) {
    mediumIconSize = value;
  }

  setSmallIconSize(double value) {
    smallIconSize = value;
  }

  setStandardIconSize(double value) {
    standardIconSize = value;
  }

  setXxxLargeFontSize(double value) {
    xxxLargeFontSize = value;
  }

  setXxLargeFontSize(double value) {
    xxLargeFontSize = value;
  }

  setXLargeFontSize(double value) {
    xLargeFontSize = value;
  }

  setLargeFontSize(double value) {
    largeFontSize = value;
  }

  setXxxMediumFontSize(double value) {
    xxxMediumFontSize = value;
  }

  setXxMediumFontSize(double value) {
    xxMediumFontSize = value;
  }

  setXMediumFontSize(double value) {
    xMediumFontSize = value;
  }

  setMediumFontSize(double value) {
    mediumFontSize = value;
  }

  setXRegularFontSize(double value) {
    xRegularFontSize = value;
  }

  setRegularFontSize(double value) {
    regularFontSize = value;
  }

  setXSmallFontSize(double value) {
    xSmallFontSize = value;
  }

  setSmallFontSize(double value) {
    smallFontSize = value;
  }

  setXxxLargeSpace(double value) {
    xxxLargeSpace = value;
  }

  setXxLargeSpace(double value) {
    xxLargeSpace = value;
  }

  setXLargeSpace(double value) {
    xLargeSpace = value;
  }

  setLargeSpace(double value) {
    largeSpace = value;
  }

  setXMediumSpace(double value) {
    xMediumSpace = value;
  }

  setMediumSpace(double value) {
    mediumSpace = value;
  }

  setXSmallSpace(double value) {
    xSmallSpace = value;
  }

  setSmallSpace(double value) {
    smallSpace = value;
  }

  setXTinySpace(double value) {
    xTinySpace = value;
  }

  setTinySpace(double value) {
    tinySpace = value;
  }

  setVeryTinySpace(double value) {
    veryTinySpace = value;
  }

  double calculateSize(BuildContext context, double appDimen) {
    if (MediaQuery.of(context).size.width < 360) {
      return (appDimen * 320) / 400;
    } else if (MediaQuery.of(context).size.width >= 360 && MediaQuery.of(context).size.width <= 390) {
      return (appDimen * 380) / 400;
    } else if (MediaQuery.of(context).size.width > 391 && MediaQuery.of(context).size.width <= 480) {
      return appDimen;
    } else if (MediaQuery.of(context).size.width >= 481 && MediaQuery.of(context).size.width <= 768) {
      return (appDimen * 768) / 400;
    } else if (MediaQuery.of(context).size.width >= 769 && MediaQuery.of(context).size.width <= 800) {
      return (appDimen * 800) / 400;
    } else {
      return (appDimen * 1024) / 400;
    }
  }

  static void initAppDimen(BuildContext context) {
    CustomDateTimePicker.appDimens = AppDimens();
    CustomDateTimePicker.appDimens!.setVeryTinySpace(
        CustomDateTimePicker.appDimens!.calculateSize(context, CustomDateTimePicker.appDimens!.veryTinySpace));
    CustomDateTimePicker.appDimens!.setTinySpace(
        CustomDateTimePicker.appDimens!.calculateSize(context, CustomDateTimePicker.appDimens!.tinySpace));
    CustomDateTimePicker.appDimens!.setXTinySpace(
        CustomDateTimePicker.appDimens!.calculateSize(context, CustomDateTimePicker.appDimens!.xTinySpace));
    CustomDateTimePicker.appDimens!.setSmallSpace(
        CustomDateTimePicker.appDimens!.calculateSize(context, CustomDateTimePicker.appDimens!.smallSpace));
    CustomDateTimePicker.appDimens!.setXSmallSpace(
        CustomDateTimePicker.appDimens!.calculateSize(context, CustomDateTimePicker.appDimens!.xSmallSpace));
    CustomDateTimePicker.appDimens!.setMediumSpace(
        CustomDateTimePicker.appDimens!.calculateSize(context, CustomDateTimePicker.appDimens!.mediumSpace));
    CustomDateTimePicker.appDimens!.setXMediumSpace(
        CustomDateTimePicker.appDimens!.calculateSize(context, CustomDateTimePicker.appDimens!.xMediumSpace));
    CustomDateTimePicker.appDimens!.setLargeSpace(
        CustomDateTimePicker.appDimens!.calculateSize(context, CustomDateTimePicker.appDimens!.largeSpace));
    CustomDateTimePicker.appDimens!.setXLargeSpace(
        CustomDateTimePicker.appDimens!.calculateSize(context, CustomDateTimePicker.appDimens!.xLargeSpace));
    CustomDateTimePicker.appDimens!.setXxLargeSpace(
        CustomDateTimePicker.appDimens!.calculateSize(context, CustomDateTimePicker.appDimens!.xxLargeSpace));
    CustomDateTimePicker.appDimens!.setXxxLargeSpace(
        CustomDateTimePicker.appDimens!.calculateSize(context, CustomDateTimePicker.appDimens!.xxxLargeSpace));

    CustomDateTimePicker.appDimens!.setSmallFontSize(
        CustomDateTimePicker.appDimens!.calculateSize(context, CustomDateTimePicker.appDimens!.smallFontSize));
    CustomDateTimePicker.appDimens!.setXSmallFontSize(
        CustomDateTimePicker.appDimens!.calculateSize(context, CustomDateTimePicker.appDimens!.xSmallFontSize));
    CustomDateTimePicker.appDimens!.setRegularFontSize(
        CustomDateTimePicker.appDimens!.calculateSize(context, CustomDateTimePicker.appDimens!.regularFontSize));
    CustomDateTimePicker.appDimens!.setXRegularFontSize(
        CustomDateTimePicker.appDimens!.calculateSize(context, CustomDateTimePicker.appDimens!.xRegularFontSize));
    CustomDateTimePicker.appDimens!.setMediumFontSize(
        CustomDateTimePicker.appDimens!.calculateSize(context, CustomDateTimePicker.appDimens!.mediumFontSize));
    CustomDateTimePicker.appDimens!.setXMediumFontSize(
        CustomDateTimePicker.appDimens!.calculateSize(context, CustomDateTimePicker.appDimens!.xMediumFontSize));
    CustomDateTimePicker.appDimens!.setXxMediumFontSize(
        CustomDateTimePicker.appDimens!.calculateSize(context, CustomDateTimePicker.appDimens!.xxMediumFontSize));
    CustomDateTimePicker.appDimens!.setXxxMediumFontSize(
        CustomDateTimePicker.appDimens!.calculateSize(context, CustomDateTimePicker.appDimens!.xxxMediumFontSize));
    CustomDateTimePicker.appDimens!.setLargeFontSize(
        CustomDateTimePicker.appDimens!.calculateSize(context, CustomDateTimePicker.appDimens!.largeFontSize));
    CustomDateTimePicker.appDimens!.setXLargeFontSize(
        CustomDateTimePicker.appDimens!.calculateSize(context, CustomDateTimePicker.appDimens!.xLargeFontSize));
    CustomDateTimePicker.appDimens!.setXxLargeFontSize(
        CustomDateTimePicker.appDimens!.calculateSize(context, CustomDateTimePicker.appDimens!.xxLargeFontSize));
    CustomDateTimePicker.appDimens!.setXxxLargeFontSize(
        CustomDateTimePicker.appDimens!.calculateSize(context, CustomDateTimePicker.appDimens!.xxxLargeFontSize));

    CustomDateTimePicker.appDimens!.setStandardIconSize(
        CustomDateTimePicker.appDimens!.calculateSize(context, CustomDateTimePicker.appDimens!.standardIconSize));

    CustomDateTimePicker.appDimens!.setSmallIconSize(
        CustomDateTimePicker.appDimens!.calculateSize(context, CustomDateTimePicker.appDimens!.smallIconSize));
    CustomDateTimePicker.appDimens!.setMediumIconSize(
        CustomDateTimePicker.appDimens!.calculateSize(context, CustomDateTimePicker.appDimens!.mediumIconSize));
    CustomDateTimePicker.appDimens!.setLargeIconSize(
        CustomDateTimePicker.appDimens!.calculateSize(context, CustomDateTimePicker.appDimens!.largeIconSize));

    CustomDateTimePicker.appDimens!.setInputBoxHeight(
        CustomDateTimePicker.appDimens!.calculateSize(context, CustomDateTimePicker.appDimens!.inputBoxHeight));
    CustomDateTimePicker.appDimens!.setInputBoxMinHeight(
        CustomDateTimePicker.appDimens!.calculateSize(context, CustomDateTimePicker.appDimens!.inputBoxMinHeight));

    CustomDateTimePicker.appDimens!.setButtonSize(
        CustomDateTimePicker.appDimens!.calculateSize(context, CustomDateTimePicker.appDimens!.buttonSize));

    CustomDateTimePicker.appDimens!.setBottomSheetHeight(
        CustomDateTimePicker.appDimens!.calculateSize(context, CustomDateTimePicker.appDimens!.bottomSheetHeight));
    CustomDateTimePicker.appDimens!.setAppBarHeight(
        CustomDateTimePicker.appDimens!.calculateSize(context, CustomDateTimePicker.appDimens!.appBarHeight));
    CustomDateTimePicker.appDimens!.setLargeAppBarHeight(
        CustomDateTimePicker.appDimens!.calculateSize(context, CustomDateTimePicker.appDimens!.largeAppBarHeight));
    CustomDateTimePicker.appDimens!.setItemButtonHeight(
        CustomDateTimePicker.appDimens!.calculateSize(context, CustomDateTimePicker.appDimens!.itemButtonHeight));
    CustomDateTimePicker.appDimens!.setDashLineWidth(
        CustomDateTimePicker.appDimens!.calculateSize(context, CustomDateTimePicker.appDimens!.dashLineWidth));
    CustomDateTimePicker.appDimens!.setDividerHeight(
        CustomDateTimePicker.appDimens!.calculateSize(context, CustomDateTimePicker.appDimens!.dividerHeight));

    CustomDateTimePicker.appDimens!.setLinearDatePickerXLargeSpace(CustomDateTimePicker.appDimens!
        .calculateSize(context, CustomDateTimePicker.appDimens!.linearDatePickerXLargeSpace));
    CustomDateTimePicker.appDimens!.setLinearDatePickerColumnWidth(CustomDateTimePicker.appDimens!
        .calculateSize(context, CustomDateTimePicker.appDimens!.linearDatePickerColumnWidth));
    CustomDateTimePicker.appDimens!.setLinearDatePickerExtraColumnWidth(CustomDateTimePicker.appDimens!
        .calculateSize(context, CustomDateTimePicker.appDimens!.linearDatePickerExtraColumnWidth));
    CustomDateTimePicker.appDimens!.setLinearDatePickerItemExtent(CustomDateTimePicker.appDimens!
        .calculateSize(context, CustomDateTimePicker.appDimens!.linearDatePickerItemExtent));
  }
}
