import 'package:flutter/material.dart';
import 'package:getwidget/components/image/gf_image_overlay.dart';
import 'package:mobile/core/utils/constants/app_color.dart';

class AvatarUser extends StatelessWidget {
  const AvatarUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         GFImageOverlay(
          height: 120,
          width: 120,
          shape: BoxShape.circle,
          image: const AssetImage("assets/images/user.jpg"),
          boxFit: BoxFit.cover,
          color: AppColor.greenPrimary,
          border: Border.all(width: 3,color: AppColor.greenPrimary)
        ),
        Text("Mialy Rak", style: Theme.of(context).textTheme.bodySmall?.copyWith(
          color: Colors.black,
          fontWeight: FontWeight.w600
        ),),
        Text("Délégué", style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Colors.black.withOpacity(0.5)
        ),),
      ],
    );
  }
}
