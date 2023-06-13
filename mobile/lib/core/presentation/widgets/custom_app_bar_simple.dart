import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBarSimple extends StatelessWidget implements PreferredSize{
  const CustomAppBarSimple(
      {super.key, required this.title, this.leadingPressed});

  final String title;
  final Function()? leadingPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      leading: IconButton(
        onPressed: leadingPressed,
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.black,
          size: 16,
        ),
      ),
      leadingWidth: 10,
      title: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, 70.h);
}
