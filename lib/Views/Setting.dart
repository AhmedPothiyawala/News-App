import 'package:flutter/material.dart';
import 'package:flutter_mvvm_template/Remote/Colors/color.dart';
import 'package:flutter_mvvm_template/App_Controllers/StorageController.dart';
import '../Remote/App_Heading/heading.dart';
import '../App_Controllers/ExitController.dart';
import 'CustomeWidget.dart';
import 'SettingList.dart';
import 'package:get/get.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter_mvvm_template/Remote/Themes/Theme.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  bool _isDarkMode = false;

  final exitConfirmationController = Get.put(ExitConfirmationController());

  Future<void> _getDarkModePreference() async {
    _isDarkMode = await Storage.getDarkModePreference();
    setState(() {});
  }

  @override
  void initState() {
    _getDarkModePreference();
    super.initState();
  }

  void _toggleDarkMode() async {
    _isDarkMode = !_isDarkMode;
    await Storage.setDarkModePreference(_isDarkMode);
    final theme = await AppTheme.getThemeFromPreferences();
    Get.changeTheme(theme);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Scaffold(
        backgroundColor: AppColors.kPrimaryColor,
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 170,
                    color: Theme.of(context).brightness == Brightness.light
                        ? AppColors.kPrimaryLightColor
                        : AppColors.kPrimaryDarkColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                            child:
                                HeadingText(AppHeading.settings, 26, context)),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0, left: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                  backgroundColor: AppColors.kButtonColor,
                                  radius: 50,
                                  child: FlutterLogo(
                                    size: 100,
                                    textColor: AppColors.kPrimaryDarkColor,
                                    // Set the color of the text
                                    style: FlutterLogoStyle.horizontal,
                                    // Set the logo style
                                    duration: Duration(seconds: 2),
                                    // Set the duration for the animation
                                    curve: Curves
                                        .easeInOut, // Set the curve for the animation
                                  )),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 15.0, top: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SettingText(AppHeading.user, context),
                                    SettingNormal(
                                        AppHeading.email,
                                        Theme.of(context).brightness ==
                                                Brightness.light
                                            ? AppColors.kPrimaryDarkColor
                                            : AppColors.kPrimaryLightColor),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10.0),
                                      child: SettingNormal(AppHeading.signout,
                                          AppColors.kPrimary_active_color),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          ListTile(
                              tileColor: Theme.of(context).brightness ==
                                      Brightness.light
                                  ? AppColors.kPrimaryLightColor
                                  : AppColors.kPrimaryDarkColor,
                              title: Text(
                                AppHeading.dark,
                                style: TextStyle(
                                  color: Theme.of(context).brightness ==
                                          Brightness.light
                                      ? AppColors.kPrimaryDarkColor
                                      : AppColors.kPrimaryLightColor,
                                ),
                              ),
                              trailing: CupertinoSwitch(
                                activeColor: AppColors.kPrimary_active_color,
                                value: _isDarkMode,
                                onChanged: (value) {
                                  _toggleDarkMode();
                                  setState(() {});
                                },
                              )),

                          // SetingList(AppHeading.dark, false),
                          SetingList(AppHeading.notifications, false),
                        ],
                      )),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: MenuText(AppHeading.acccount, 1),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          SetingList(AppHeading.editaccount, null),
                          SetingList(AppHeading.changepassword, null),
                          SetingList(AppHeading.language, null),
                        ],
                      )),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: MenuText(AppHeading.privacy, 1),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          SetingList(AppHeading.privacyaccount, false),
                          SetingList(AppHeading.privacysecurity, null),
                        ],
                      )),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
