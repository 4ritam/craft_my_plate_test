import 'package:craft_my_plate_test/controllers/platter_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DeliveryTabBar extends StatelessWidget {
  final List<String> tabs = Get.find<PlatterController>().mealCategories;

  DeliveryTabBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SliverPersistentHeader(
        pinned: true,
        delegate: DeliveryTabBarDelegate(
          availablePlattersCount:
              Get.find<PlatterController>().availablePlattersCount.value,
          tabs: tabs,
          selectedIndex: Get.find<PlatterController>().selectedMealIndex.value,
          onTabChange: (index) {
            Get.find<PlatterController>().changeMealCategory(index);
          },
        ),
      );
    });
  }
}

class DeliveryTabBarDelegate extends SliverPersistentHeaderDelegate {
  final int availablePlattersCount;
  final List<String> tabs;
  final int selectedIndex;
  final Function(int) onTabChange;

  DeliveryTabBarDelegate({
    required this.availablePlattersCount,
    required this.tabs,
    required this.selectedIndex,
    required this.onTabChange,
  });

  final activeColor = Color(0xFFE70472);
  final inactiveColor = Color(0xFF60666C);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      width: double.infinity,
      height: 44.h,
      padding: EdgeInsets.only(left: 22.w, top: 14.h, bottom: 8.h),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x0F000000),
            offset: Offset(0, 2.h),
            blurRadius: 2.r,
            spreadRadius: 2.r,
          )
        ],
      ),
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          String tab = selectedIndex == index
              ? "${tabs[index].toUpperCase()} ($availablePlattersCount)"
              : tabs[index];
          TextSpan span = TextSpan(
            text: tab,
            style: GoogleFonts.lexend(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color:
                  Get.find<PlatterController>().selectedMealIndex.value == index
                      ? activeColor
                      : inactiveColor,
            ),
          );
          TextPainter tp = TextPainter(
            text: span,
            textDirection: TextDirection.ltr,
            textAlign: TextAlign.left,
          );
          tp.layout();
          final textWidth = tp.size.width;

          return Padding(
            padding: EdgeInsets.only(right: 32.w),
            child: InkWell(
              onTap: () {
                Get.find<PlatterController>().changeMealCategory(index);
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: RichText(text: span),
                  ),
                  Container(
                    height: 2.h,
                    width: textWidth,
                    color:
                        Get.find<PlatterController>().selectedMealIndex.value ==
                                index
                            ? activeColor
                            : Colors.transparent,
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: tabs.length,
      ),
    );
  }

  @override
  double get maxExtent => 44.h;

  @override
  double get minExtent => 44.h;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
