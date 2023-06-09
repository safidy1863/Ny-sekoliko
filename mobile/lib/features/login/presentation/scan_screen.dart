import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/core/utils/constants/app_color.dart';

class ScanScreen extends StatelessWidget {
  const ScanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double top = MediaQuery.of(context).size.height - 200.h;
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Positioned(
              top: -300,
              bottom: 200.h,
              right: -300,
              left: -300,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [AppColor.greenPrimary, AppColor.greenSecondary]),
                  color: AppColor.greenPrimary,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(800),
                  ),
                ),
              ),
            ),
            // Back button
            Positioned(
              top: 30,
              left: 10.w,
              child: Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.r)),
                child: Center(
                    child: Icon(
                  Icons.chevron_left,
                  size: 20,
                )),
              ),
            ),
            // Camera
            Positioned(
              top: 150.h,
              height: 300.h,
              right: 0,
              left: 0,
              child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AspectRatio(
                      aspectRatio: 1 / 1,
                      child: Container(
                        height: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),

            // Scan logo
            Positioned(
              bottom: 30.h,
              right: 0,
              left: 0,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5.r)),
                    child: Icon(
                      Icons.qr_code_2,
                      size: 70.sp,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Scannez ici pour vous connectez",
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
