import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlattersViewAppbarBackground extends StatelessWidget {
  final String imagePath;

  const PlattersViewAppbarBackground({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          imagePath,
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
