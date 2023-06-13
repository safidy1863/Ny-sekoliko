import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/core/utils/constants/app_color.dart';

class AppBarLists extends StatelessWidget implements PreferredSize {
  const AppBarLists({super.key, required this.leadingPressed});

  final Function()? leadingPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      leading: IconButton(
        onPressed: leadingPressed,
        icon: const Icon(
          Icons.chevron_left,
          color: Colors.black,
          size: 18,
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Liste d'appel",
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Colors.black,
            ),
          ),
          Text(
            "Intéraction homme machine",
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Colors.grey,
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
            onPressed: () {
            },
            child: Text(
              "Términer",
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppColor.greenPrimary,
              ),
            ))
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
