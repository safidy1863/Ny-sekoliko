import 'package:go_router/go_router.dart';

import '../utils/constants/route_path.dart';
import '/features/login/presentation/login_screen.dart';
import '/features/login/presentation/identification_screen.dart';
import '/features/login/presentation/scan_screen.dart';
import '/features/home/presentation/home_screen.dart';
import '/features/lists/presentation/lists_screen.dart';
import '/features/info_user/presentation/info_user_screen.dart';
import '/features/about/presentation/about_screen.dart';

class AppRouter {
  static GoRouter appRoutes = GoRouter(
    initialLocation: RoutePath.home,
    routes: [
      GoRoute(
        path: RoutePath.login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: RoutePath.identification,
        builder: (context, state) => const IdentificationScreen(),
      ),
      GoRoute(
        path: RoutePath.scan,
        builder: (context, state) => const ScanScreen(),
      ),
      GoRoute(
        path: RoutePath.home,
        builder: (context, state) => HomeScreen(),
      ),
      GoRoute(
          path: RoutePath.lists,
          builder: (context, state) => const ListsScreen()),
      GoRoute(
        path: RoutePath.infoUser,
        builder: (context, state) => const InfoUserScreen(),
      ),
      GoRoute(
        path: RoutePath.about,
        builder: (context, state) => const AboutScreen(),
      ),
    ],
  );
}
