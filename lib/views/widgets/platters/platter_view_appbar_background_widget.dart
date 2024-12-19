import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/instance_manager.dart';

import '../../../controllers/platter_controller.dart';

class PlattersViewAppbarBackground extends StatelessWidget {
  const PlattersViewAppbarBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final eventType = Get.find<PlatterController>().eventType;
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          "assets/images/background/${eventType}_background.png",
          alignment: Alignment.topCenter,
          fit: BoxFit.cover,
          filterQuality: FilterQuality.high,
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            height: (MediaQuery.of(context).padding.top + 48).h,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withAlpha((32 * 2.55).toInt()),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            height: (MediaQuery.of(context).padding.top + 48).h,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black,
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
