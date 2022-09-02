// import 'package:abastible_duo/src/theme/theme.dart';
// import 'package:flutter/material.dart';

// class AppThemes {
//   AppThemes._();

//   //constants color range for light theme
//   static const Color _lightAppBarColor = AppColors.abastiblePrimaryColor;
//   static const Color _lightFloatingActionButton = Color(0xFFFB7030);
//   static const Color _lightOnPrimaryColor = Colors.black;
//   static const Color _lightPrimaryColor = Colors.black;
//   static const Color _lightSnackBarBackgroundErrorColor = Colors.redAccent;

//   //text theme for light theme
//   static const TextStyle _lightScreenHeadingTextStyle =
//       TextStyle(fontSize: 20.0, color: _lightOnPrimaryColor);
//   static const TextStyle _lightScreenTaskNameTextStyle =
//       TextStyle(fontSize: 16.0, color: _lightOnPrimaryColor);
//   static const TextStyle _lightScreenTaskDurationTextStyle =
//       TextStyle(fontSize: 14.0, color: Colors.grey);
//   static const TextStyle _lightScreenButtonTextStyle = TextStyle(
//       fontSize: 14.0, color: _lightOnPrimaryColor, fontWeight: FontWeight.w500);
//   static const TextStyle _lightScreenCaptionTextStyle = TextStyle(
//       fontSize: 12.0, color: _lightAppBarColor, fontWeight: FontWeight.w100);

//   static const TextTheme _lightTextTheme = TextTheme(
//     headline6: _lightScreenHeadingTextStyle,
//     bodyText1: _lightScreenTaskNameTextStyle,
//     bodyText2: _lightScreenTaskDurationTextStyle,
//     button: _lightScreenButtonTextStyle,
//     subtitle1: _lightScreenTaskNameTextStyle,
//     subtitle2: _lightScreenTaskDurationTextStyle,
//     caption: _lightScreenCaptionTextStyle,
//   );

//   //constants color range for dark theme
//   static const Color _darkPrimaryColor = Colors.white;
//   static const Color _darkPrimaryVariantColor = Colors.black;
//   static const Color _darkSecondaryColor = Colors.white;
//   static const Color _darkOnPrimaryColor = Colors.white;
//   static const Color _darkButtonPrimaryColor = Colors.deepPurpleAccent;
//   static const Color _darkAppBarColor = AppColors.abastiblePrimaryColor;
//   static const Color _darkIconColor = Colors.deepPurpleAccent;
//   static const Color _darkSnackBarBackgroundErrorColor = Colors.redAccent;

//   //text theme for dark theme
//   static final TextStyle _darkScreenHeadingTextStyle =
//       _lightScreenHeadingTextStyle.copyWith(color: _darkOnPrimaryColor);
//   static final TextStyle _darkScreenTaskNameTextStyle =
//       _lightScreenTaskNameTextStyle.copyWith(color: _darkOnPrimaryColor);
//   static const TextStyle _darkScreenTaskDurationTextStyle =
//       _lightScreenTaskDurationTextStyle;
//   static const TextStyle _darkScreenButtonTextStyle = TextStyle(
//       fontSize: 14.0, color: _darkOnPrimaryColor, fontWeight: FontWeight.w500);
//   static const TextStyle _darkScreenCaptionTextStyle = TextStyle(
//       fontSize: 12.0, color: _darkAppBarColor, fontWeight: FontWeight.w100);

//   static final TextTheme _darkTextTheme = TextTheme(
//     headline6: _darkScreenHeadingTextStyle,
//     bodyText1: _darkScreenTaskNameTextStyle,
//     bodyText2: _darkScreenTaskDurationTextStyle,
//     button: _darkScreenButtonTextStyle,
//     subtitle1: _darkScreenTaskNameTextStyle,
//     subtitle2: _darkScreenTaskDurationTextStyle,
//     caption: _darkScreenCaptionTextStyle,
//   );

//   //the light theme
//   static final ThemeData lightTheme = ThemeData(
//     appBarTheme: AppBarTheme(
//       color: _lightAppBarColor,
//       iconTheme: IconThemeData(color: _lightOnPrimaryColor),
//       titleTextStyle: _lightTextTheme.headline6,
//       toolbarTextStyle: _lightTextTheme.bodyText2,
//     ),
//     colorScheme: const ColorScheme.light(
//       onPrimary: AppColors.whiteTextColor,
//       primary: AppColors.abastiblePrimaryColor,
//       primaryContainer: AppColors.backgroundColor,
//       secondary: AppColors.abastibleSecondaryColor,
//     ),
//     elevatedButtonTheme: ElevatedButtonThemeData(
//       style: ElevatedButton.styleFrom(
//         elevation: 2,
//         onPrimary: AppColors.whiteTextColor,
//         primary: AppColors.abastiblePrimaryColor,
//         shadowColor: AppColors.blackTextColor,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.all(
//             Radius.circular(4.0),
//           ),
//         ),
//       ),
//     ),
//     fontFamily: AppFontFamily.roboto,
//     floatingActionButtonTheme: FloatingActionButtonThemeData(
//       backgroundColor: _lightFloatingActionButton,
//     ),
//     iconTheme: const IconThemeData(
//       color: AppColors.blackTextColor,
//     ),
//     popupMenuTheme: PopupMenuThemeData(
//       color: _lightAppBarColor,
//     ),
//     scaffoldBackgroundColor: AppColors.backgroundColor,
//     snackBarTheme: const SnackBarThemeData(
//       backgroundColor: _lightSnackBarBackgroundErrorColor,
//     ),
//     textButtonTheme: TextButtonThemeData(
//       style: TextButton.styleFrom(
//         primary: AppColors.abastibleSecondaryColor,
//         textStyle: TextStyle(
//           color: AppColors.abastibleSecondaryColor,
//           fontSize: 14,
//           fontWeight: FontWeight.w500,
//         ),
//       ),
//     ),
//     textTheme: _lightTextTheme,
//     unselectedWidgetColor: _lightPrimaryColor,
//   );

//   //the dark theme
//   static final ThemeData darkTheme = ThemeData(
//     fontFamily: AppFontFamily.productSans,
//     scaffoldBackgroundColor: _darkPrimaryVariantColor,
//     floatingActionButtonTheme: FloatingActionButtonThemeData(
//       backgroundColor: _darkButtonPrimaryColor,
//     ),
//     appBarTheme: AppBarTheme(
//       color: _darkAppBarColor,
//       iconTheme: IconThemeData(color: _darkOnPrimaryColor),
//       toolbarTextStyle: _darkTextTheme.bodyText2,
//       titleTextStyle: _darkTextTheme.headline6,
//     ),
//     colorScheme: ColorScheme.light(
//       primary: _darkPrimaryColor,
//       primaryContainer: _darkPrimaryVariantColor,
//       secondary: _darkSecondaryColor,
//       onPrimary: _darkOnPrimaryColor,
//     ),
//     snackBarTheme:
//         SnackBarThemeData(backgroundColor: _darkSnackBarBackgroundErrorColor),
//     iconTheme: IconThemeData(
//       color: _darkIconColor,
//     ),
//     popupMenuTheme: PopupMenuThemeData(color: _darkAppBarColor),
//     textTheme: _darkTextTheme,
//     buttonTheme: ButtonThemeData(
//         buttonColor: _darkButtonPrimaryColor,
//         textTheme: ButtonTextTheme.primary),
//     unselectedWidgetColor: _darkPrimaryColor,
//     inputDecorationTheme: InputDecorationTheme(
//         fillColor: _darkPrimaryColor,
//         labelStyle: TextStyle(
//           color: _darkPrimaryColor,
//         )),
//   );
// }
