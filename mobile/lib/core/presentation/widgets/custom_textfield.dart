import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/core/utils/constants/app_color.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    this.isPassword = false,
    this.validator,
    this.controller,
    this.suffixIcon,
    this.prefixIcon,
    this.textInputType = TextInputType.text,
    this.onChanged,
    this.isDense = false,
  });

  final String hintText;
  final bool isPassword;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType textInputType;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Function(String)? onChanged;
  final bool isDense;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        onChanged: onChanged,
        controller: controller,
        obscureText: isPassword,
        validator: validator,
        keyboardType: textInputType,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Colors.black,
            ),
        decoration: InputDecoration(
          hintText: hintText,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.grayPrimary),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.redPrimary.withOpacity(0.3)),
          ),
          errorStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppColor.redPrimary.withOpacity(0.5),
              ),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.grayPrimary),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 15),
          hintStyle: Theme.of(context).textTheme.bodySmall,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          prefixIconConstraints: const BoxConstraints(
            maxHeight: 20,
            minWidth: 30,
          ),
          isDense: isDense
        ),
      ),
    );
  }
}
