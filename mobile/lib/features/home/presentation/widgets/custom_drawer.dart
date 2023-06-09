import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getwidget/components/drawer/gf_drawer.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GFDrawer(
      child: Column(
        children: [
          Image.asset("assets/images/logo.png", width: 100.w,)
        ],
      ),
    );
  }
}
