import 'package:Bookly/features/home/presentation/view/home_view.dart';
import 'package:Bookly/features/splash/presentation/view/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeView='/homeView' ;
  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => SplashView()),
      GoRoute(path: AppRouter.kHomeView, builder: (context, state) => HomeView()),
    ],
  );
}
