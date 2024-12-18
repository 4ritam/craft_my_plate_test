import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../platters_view.dart';
import 'service_option_widget.dart';

class ServiceTabBarWidget extends StatelessWidget {
  ServiceTabBarWidget({
    super.key,
    required this.currentSelectedTab,
  });

  final CurrentSelectedTab currentSelectedTab;

  final Widget inactiveGap = SizedBox(
    width: 11.w,
  );

  final Widget activeGapLeft = SizedBox(
    width: 11.r,
    height: 11.r,
    child: CustomPaint(
      painter: ActiveLeftSide(),
    ),
  );

  final Widget activeGapRight = SizedBox(
    width: 11.r,
    height: 11.r,
    child: CustomPaint(
      painter: ActiveRightSide(),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        currentSelectedTab == CurrentSelectedTab.delivery
            ? activeGapLeft
            : inactiveGap,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ServiceOptionWidget(
                title: 'Bulk Food Delivery',
                isActive: currentSelectedTab == CurrentSelectedTab.delivery,
              ),
              Container(
                height: 8.h,
                color: currentSelectedTab == CurrentSelectedTab.delivery
                    ? Colors.white
                    : Colors.transparent,
              ),
            ],
          ),
        ),
        currentSelectedTab == CurrentSelectedTab.delivery
            ? activeGapRight
            : activeGapLeft,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ServiceOptionWidget(
                title: 'Catering Services',
                isActive: currentSelectedTab == CurrentSelectedTab.catering,
              ),
              Container(
                height: 8.h,
                color: currentSelectedTab == CurrentSelectedTab.catering
                    ? Colors.white
                    : Colors.transparent,
              ),
            ],
          ),
        ),
        currentSelectedTab == CurrentSelectedTab.delivery
            ? inactiveGap
            : activeGapRight,
      ],
    );
  }
}

class ActiveLeftSide extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final Path path = Path()
      ..moveTo(0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0)
      ..quadraticBezierTo(size.width, size.height, 0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class ActiveRightSide extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final Path path = Path()
      ..moveTo(0, 0)
      ..lineTo(0, size.height)
      ..lineTo(size.width, size.height)
      ..quadraticBezierTo(0, size.height, 0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
