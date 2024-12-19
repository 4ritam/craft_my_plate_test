import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ServiceOptionWidget extends StatelessWidget {
  final String title;
  final bool isActive;
  final VoidCallback onSelected;

  const ServiceOptionWidget({
    super.key,
    required this.title,
    required this.isActive,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelected,
      child: Container(
        width: 171.w,
        height: 34.h,
        decoration: BoxDecoration(
          color: isActive ? Colors.white : Color(0xFFE4E6E7),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.r),
            topRight: Radius.circular(12.r),
            bottomLeft: isActive ? Radius.circular(0.r) : Radius.circular(12.r),
            bottomRight:
                isActive ? Radius.circular(0.r) : Radius.circular(12.r),
          ),
          border: Border.all(
            color: !isActive ? Color(0xFFE4E6E7) : Colors.transparent,
            width: 1.w,
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: GoogleFonts.lexend(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: isActive ? const Color(0xFF6318AF) : Color(0xFF60666C),
            ),
          ),
        ),
      ),
    );
  }
}
