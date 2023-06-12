import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getwidget/components/drawer/gf_drawer.dart';
import 'package:mobile/core/utils/constants/app_color.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  int currentMenu = 0;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width * 0.65,
      child: GFDrawer(
          child: SafeArea(
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 60, sigmaY: 80),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/logo.png",
                          width: 100.w,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        _menuItem(context, Icons.home_filled, 0, "Accueil"),
                        _menuItem(context, Icons.person, 1, "Profil"),
                        _menuItem(context, Icons.info_sharp, 2, "A propos"),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.power_settings_new,
                          color: AppColor.greenPrimary,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          "Déconnecter",
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: AppColor.greenPrimary,
                                  ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }

  Widget _menuItem(
      BuildContext context, IconData icon, int numberMenu, String label) {
    return GestureDetector(
      onTap: () {
        setState(() {
          currentMenu = numberMenu;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        color: currentMenu == numberMenu
            ? AppColor.greenPrimary
            : Colors.transparent,
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: currentMenu == numberMenu
                    ? Colors.white
                    : AppColor.greenPrimary,
              ),
              const SizedBox(
                width: 15,
              ),
              Text(
                label,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: currentMenu == numberMenu
                          ? Colors.white
                          : AppColor.greenPrimary,
                    ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
