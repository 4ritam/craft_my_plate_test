import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/platter_controller.dart';
import '../models/enums/service_enum.dart';
import '../models/platter_combo_model.dart';
import 'widgets/platters/delivery_tab_bar_widget.dart';
import 'widgets/platters/platter_card_widget.dart';
import 'widgets/platters/platter_view_appbar_background_widget.dart';
import 'widgets/platters/service_tab_bar_widget.dart';

class PlattersView extends StatelessWidget {
  const PlattersView({super.key});

  // Back Button Press
  void backpress() {
    Get.showSnackbar(
      GetSnackBar(
        title: 'Sorry',
        message: 'Home page is not available',
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: <Widget>[
              customAppBar(),
              ...customBody(),
            ],
          ),
        ],
      ),
    );
  }

  List<Widget> customBody() {
    return [
      // Delivery Tab Bar
      DeliveryTabBar(),
      Obx(
        () {
          List<PlatterComboModel> filteredPlatters =
              Get.find<PlatterController>().filteredPlatters;

          if (Get.find<PlatterController>().selectedService.value ==
              Service.delivery) {
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  PlatterComboModel platter = filteredPlatters[index];
                  return PlatterCardWidget(platter: platter);
                },
                childCount: filteredPlatters.length,
              ),
            );
          } else {
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  PlatterComboModel platter = filteredPlatters[index];
                  return PlatterCardWidget(platter: platter);
                },
                childCount: filteredPlatters.length,
              ),
            );
          }
        },
      ),
    ];
  }

  SliverAppBar customAppBar() {
    return SliverAppBar(
      // Title Section
      title: Text(
        Get.find<PlatterController>().eventType,
      ),
      titleTextStyle: GoogleFonts.lexend(
        fontSize: 18.sp,
        fontWeight: FontWeight.w500,
      ),
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.white,
          size: 20.sp,
        ),
        onPressed: () {
          backpress();
        },
      ),

      // Sliding Properties
      expandedHeight: 174.h,
      toolbarHeight: 48.h,
      floating: false,
      pinned: true,
      backgroundColor: Colors.black,

      // Flexible Space
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.none,
        background: PlattersViewAppbarBackground(),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(42.h),
        child: ServiceTabBarWidget(),
      ),
    );
  }
}
