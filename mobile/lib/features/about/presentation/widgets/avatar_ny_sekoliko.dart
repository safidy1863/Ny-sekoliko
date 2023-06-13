import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class AvatarNySekoliko extends StatelessWidget {
  const AvatarNySekoliko({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const GFImageOverlay(
          height: 120,
          width: 120,
          shape: BoxShape.circle,
          image: AssetImage("assets/images/logo.png"),
          boxFit: BoxFit.contain,
          colorFilter: ColorFilter.mode(Colors.transparent, BlendMode.color),
        ),
        Text(
          "Ny Sekoliko",
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Colors.black, fontWeight: FontWeight.w600),
        ),
        Text(
          "Version actuelle : 1.0.0",
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(color: Colors.black.withOpacity(0.5)),
        ),
      ],
    );
  }
}
