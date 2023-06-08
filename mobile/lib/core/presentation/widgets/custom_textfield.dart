import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key,required this.hintText, this.isPassword = false});

  final String hintText;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: TextField(
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hintText,
          border: const OutlineInputBorder(),
          contentPadding: EdgeInsets.symmetric(vertical:8.h, horizontal: 15),
          hintStyle: TextStyle(
            fontSize: 16.sp
          )
          )
        ),
    );
  }
}
