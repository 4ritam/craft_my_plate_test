import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controllers/platter_controller.dart';
import '../../../models/enums/service_enum.dart';
import '../../../models/platter_combo_model.dart';

class PlatterCardWidget extends StatelessWidget {
  final PlatterComboModel platter;
  const PlatterCardWidget({super.key, required this.platter});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 12.w, right: 12.w, top: 16.h),
      height: 401.h,
      width: 351.w,
      decoration: BoxDecoration(),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Color(0xFFE4E6E7),
            width: 1.h,
          ),
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(25),
              blurRadius: 4.77.r,
              offset: Offset(0, 1.59.h),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 200.h,
                width: 351.w,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image(
                      image: AssetImage(
                        platter.image,
                      ),
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.white.withAlpha((80 * 2.55).toInt()),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8.r),
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.person,
                              color: Color(0xFF484C51),
                              size: 11.sp,
                            ),
                            Obx(() {
                              final Service service =
                                  Get.find<PlatterController>()
                                      .selectedService
                                      .value;
                              return Text(
                                " Min ${platter.minOrder[service]} - Max ${platter.maxOrder[service]}",
                                style: GoogleFonts.lexend(
                                  color: Color(0xFF484C51),
                                  fontSize: 10.sp,
                                ),
                              );
                            }),
                          ],
                        ),
                      ),
                    ),
                    if (platter.additionalInfo != null)
                      Positioned(
                        top: 16.h,
                        left: 0,
                        child: Container(
                          padding: EdgeInsets.only(
                              top: 6.h, bottom: 6.h, left: 12.w, right: 8.w),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(50.r),
                                topRight: Radius.circular(50.r),
                              ),
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xFFA300A3),
                                  Color(0xFF0B003D),
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              )),
                          child: Text(
                            platter.additionalInfo!,
                            style: GoogleFonts.lexend(
                              color: Colors.white,
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              SizedBox(
                height: 182.h,
                child: SizedBox(
                  height: 41.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 12.w),
                        child: Container(
                          width: 327.w,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Color(0xFFE4E6E7),
                                width: 0.8.h,
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 12.h),
                            child: Text(
                              platter.name,
                              style: GoogleFonts.lexend(
                                color: Color(0xFF484C51),
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 72.h,
                        child: Stack(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 10.h),
                              height: 72.h,
                              width: 351.w,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                padding: EdgeInsets.only(left: 15.w),
                                itemCount: platter.items.length,
                                itemBuilder: (context, index) {
                                  final item =
                                      platter.items.entries.elementAt(index);
                                  final category = item.key;
                                  final count = item.value;
                                  return SizedBox(
                                    height: 51.h,
                                    child: Padding(
                                      padding: EdgeInsets.only(right: 15.w),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          ClipOval(
                                            child: Image.asset(
                                              category.image,
                                              height: 36.h,
                                              width: 36.h,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          SizedBox(height: 4.h),
                                          Text(
                                            "$count ${category.name}",
                                            style: GoogleFonts.lexend(
                                              color: Colors.black,
                                              fontSize: 8.sp,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Positioned(
                              left: 12.w,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 6.h, horizontal: 12.w),
                                decoration: BoxDecoration(
                                  color: Color(0xFFFDFAEC),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20.r),
                                    bottomRight: Radius.circular(20.r),
                                  ),
                                ),
                                child: Text(
                                  "${platter.totalCategories} Categories & ${platter.totalItems} Items",
                                  style: GoogleFonts.lexend(
                                    color: Color(0xFFDC6803),
                                    fontSize: 9.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 12.w),
                        child: CustomPaint(
                          painter: DashedLinePainter(),
                          child: SizedBox(
                            height: 60.h,
                            width: 327.w,
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.h),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "₹${platter.price.toStringAsFixed(2)}",
                                            style: GoogleFonts.lexend(
                                              color: Colors.black,
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Text(
                                            "/guest",
                                            style: GoogleFonts.lexend(
                                              color: Color(0xFF484C51),
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 1.h),
                                      Row(
                                        children: [
                                          Text(
                                            "Add guest count to see ",
                                            style: GoogleFonts.lexend(
                                              color: Color(0xFF484C51),
                                              fontSize: 10.sp,
                                            ),
                                          ),
                                          SvgPicture.asset(
                                            "assets/svg/star.svg",
                                            height: 12.h,
                                            width: 12.h,
                                          ),
                                          Text(
                                            " Dynamic Price",
                                            style: GoogleFonts.lexend(
                                                color: Color(0xFF6318AF),
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.w500),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xFF6318AF),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 12.w, vertical: 8.h),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Customize",
                                          style: GoogleFonts.lexend(
                                            color: Colors.white,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(width: 4.w),
                                        Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          color: Colors.white,
                                          size: 12.sp,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double dashWidth = 9.w, dashSpace = 6.w, startX = 0;
    final paint = Paint()
      ..color = Color(0xFFE4E6E7)
      ..strokeWidth = 0.8.h;
    while (startX < size.width) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
