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
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColor.greenPrimary,
            ),
          ),
          Text(
            "Ny Sekoliko",
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: AppColor.greenPrimary,
              fontSize: 30.0
            ),
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
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColor.greenPrimary,
                  ),
                )
              ],
            ),
          ),
          CustomButton(
              label: Text(
                "S'identifier",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                context.push(RoutePath.identification);
              })
        ],
      ),
    ));
  }
}
