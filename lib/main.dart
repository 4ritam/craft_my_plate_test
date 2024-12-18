import 'package:craft_my_plate_test/config/app_config.dart';
import 'package:craft_my_plate_test/config/util_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'views/platters_view.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 832),
      minTextAdapt: true,
      builder: (_, child) => MaterialApp(
        title: AppConfig.appName,
        debugShowCheckedModeBanner: false,
        home: PlattersView(platterType: UtilConfig.currentPlatterType),
      ),
    );
  }
}
