import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'widgets/platters/platter_view_appbar_background_widget.dart';
import 'widgets/platters/service_tab_bar_widget.dart';

class PlattersView extends StatefulWidget {
  final String platterType;
  final String platterBackgroundImage;
  const PlattersView({
    super.key,
    required this.platterType,
  }) : platterBackgroundImage =
            'assets/images/background/${platterType}_background.png';

  @override
  State<PlattersView> createState() => _PlattersViewState();
}

enum CurrentSelectedTab { delivery, catering }

class _PlattersViewState extends State<PlattersView> {
  // Reactive variables
  CurrentSelectedTab currentSelectedTab = CurrentSelectedTab.delivery;

  // Backpress function
  void backpress(BuildContext context) {
    // TODO: Implement backpress function
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                // Title Section
                title: Text(
                  widget.platterType,
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
                    backpress(context);
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
                  background: PlattersViewAppbarBackground(
                      imagePath: widget.platterBackgroundImage),
                ),
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(42.h),
                  child: ServiceTabBarWidget(
                    currentSelectedTab: currentSelectedTab,
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return ListTile(
                      title: Text('Platter $index'),
                    );
                  },
                  childCount: 30,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
