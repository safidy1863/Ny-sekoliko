import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import "package:flutter_screenutil/flutter_screenutil.dart";

import 'core/navigation/app_router.dart';
import 'features/login/presentation/bloc/auth_bloc.dart';
import 'app_theme.dart';

void main() {
  runApp(const NySekoliko());
}

class NySekoliko extends StatelessWidget {
  const NySekoliko({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc()),
      ],
      child: ScreenUtilInit(
        builder: (context, child) => MaterialApp.router(
          title: 'Ny Sekoliko',
          theme: AppTheme.customTheme(),
          debugShowCheckedModeBanner: false,
          routerConfig: AppRouter.appRoutes,
        ),
        designSize: const Size(428,926),
      ),
    );
  }
}
