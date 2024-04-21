import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm_template/Remote/Themes/Theme.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'Remote/App_Heading/heading.dart';
import 'Remote/Http_Override/MyHttpOverrides.dart';
import 'Remote/System_Orientation_and_SystemUIOverlayStyle/System_Orientation_and_SystemUIOverlayStyle_all_screen.dart';
import 'Views/BottomAppBar.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = new MyHttpOverrides();
  System_Orientation_and_SystemUIOverlayStyle_all_screen();
  final theme = await AppTheme.getThemeFromPreferences();
  runApp(MyApp(
    initialTheme: theme,
  ));
}

class MyApp extends StatelessWidget {
  final ThemeData initialTheme;
  MyApp({Key? key, required this.initialTheme}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppHeading.application_name,
      theme: initialTheme,
      themeMode: ThemeMode.light,
      home: BottomAppBarView(),
    );
  }
}
