import 'package:flutter/material.dart';
import "package:flutter_screenutil/flutter_screenutil.dart";
import 'package:mobile/core/navigation/app_router.dart';

void main() {
  runApp(const NySekoliko());
}

class NySekoliko extends StatelessWidget {
  const NySekoliko({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => MaterialApp.router(
        title: 'Ny Sekoliko',
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.appRoutes,
      ),
      designSize: const Size(428,926),
    );
  }
}
