import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '/core/presentation/widgets/custom_button.dart';
import '/core/utils/constants/app_color.dart';
import '/core/utils/constants/route_path.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.white,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 120.h,
          ),
          Image.asset(
            "assets/images/logo.png",
            width: 130.w,
          ),
          SizedBox(
            height: 75.h,
          ),
          Text(
            "Bienvenue sur",
            style: TextStyle(fontSize: 16.sp, color: AppColor.greenPrimary),
          ),
          Text(
            "Ny Sekoliko",
            style: TextStyle(
                fontSize: 36.sp,
                fontWeight: FontWeight.w600,
                color: AppColor.greenPrimary),
          ),
          SizedBox(
            height: 90.h,
          ),
          CustomButton(
            onPressed: () {
              context.push(RoutePath.scan);
            },
            isTransparent: true,
            label: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.qr_code_2,
                  color: AppColor.greenPrimary,
                ),
                Text(
                  "Scanner le QR Code",
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: AppColor.greenPrimary,
                  ),
                )
              ],
            ),
          ),
          CustomButton(
              label: Text(
                "S'identifier",
                style: TextStyle(color: Colors.white, fontSize: 16.sp),
              ),
              onPressed: () {
                context.push(RoutePath.identification);
              })
        ],
      ),
    ));
  }
}
