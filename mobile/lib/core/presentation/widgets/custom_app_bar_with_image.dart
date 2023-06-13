import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getwidget/getwidget.dart';

class CustomAppBarWithImage extends StatelessWidget implements PreferredSize{
  const CustomAppBarWithImage({super.key, required this.currentUser});

  final ImageProvider currentUser;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(color: Colors.grey, size: 30.sp),
      actions: [
        Padding(
          padding: const EdgeInsets.all(5),
          child: GFAvatar(
            backgroundImage: currentUser,
            shape: GFAvatarShape.square,
            borderRadius: BorderRadius.circular(8.r),
            size: GFSize.SMALL,
          ),
        )
      ],
    );
  }

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, 65.h);
}
