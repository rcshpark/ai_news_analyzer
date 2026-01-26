import 'package:ai_news_analyzer/presentation/pages/intro_screen.dart';
import 'package:ai_news_analyzer/presentation/pages/signup_screen.dart';
import 'package:go_router/go_router.dart';
import 'route_paths.dart';
import 'route_names.dart';

class AppRouter {
  static GoRouter create() {
    return GoRouter(
      initialLocation: RoutePaths.intro,
      routes: [
        GoRoute(
          path: RoutePaths.intro,
          name: RouteNames.intro,
          builder: (_, __) => const IntroScreen(),
        ),
        GoRoute(
          path: RoutePaths.signUp,
          name: RouteNames.signUp,
          builder: (_, __) => const SignUpScreen(),
        ),
      ],
    );
  }
}
