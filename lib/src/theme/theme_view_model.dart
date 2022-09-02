// import 'package:abastible_duo/src/model/storage/secure_storage.dart';
// import 'package:flutter/material.dart';

// class ThemeViewModel extends ChangeNotifier {
//   ThemeViewModel({required SecureStorage secureStorage})
//       : _secureStorage = secureStorage;

//   final SecureStorage _secureStorage;

//   late bool _isDarkMode;

//   bool get isDarkMode => _isDarkMode;

//   ThemeMode getTheme() {
//     return _isDarkMode ? ThemeMode.dark : ThemeMode.light;
//   }

//   Future<void> initialize() async {
//     _isDarkMode = await _secureStorage.isDarkMode();
//   }

//   void updateTheme({required bool darkMode}) async {
//     await _secureStorage.changeTheme(darkMode: darkMode);
//     notifyListeners();
//   }
// }
