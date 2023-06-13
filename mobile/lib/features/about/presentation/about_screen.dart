import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/core/utils/constants/app_color.dart';
import 'package:mobile/features/about/presentation/widgets/avatar_ny_sekoliko.dart';
import 'package:mobile/features/about/presentation/widgets/info_item.dart';
import '/core/presentation/widgets/custom_app_bar_simple.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarSimple(
        title: "A propos",
        leadingPressed: () {
          context.pop();
        },
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Stack(
          children: [
            Positioned.fill(
              child: Column(
                children: [
                  const AvatarNySekoliko(),
                  const SizedBox(
                    height: 20,
                  ),
                  Divider(
                    color: Colors.black.withOpacity(0.5),
                  ),
                  const InfoItem(label: "Accord d'utilisation"),
                  const InfoItem(label: "Politique de confidentialité"),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Column(
                children: [
                  const Divider(
                    color: Colors.grey,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.copyright,
                        color: Colors.grey,
                        size: 14,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Copyright 2023",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Colors.grey,
                            ),
                      )
                    ],
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
