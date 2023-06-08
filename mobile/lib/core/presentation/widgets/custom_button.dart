import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/constants/app_color.dart';

class CustomButton extends StatelessWidget {

  final Widget label;
  final bool isTransparent;
  final Function()? onPressed;

  const CustomButton({super.key, required this.label, required this.onPressed, this.isTransparent = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 65.h,
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0.0,
          backgroundColor: isTransparent ? Colors.transparent : AppColor.greenPrimary,
          side: isTransparent ? const BorderSide(color: AppColor.greenPrimary) : null,
        ),
        child: label,
      ),
    );
  }
}
