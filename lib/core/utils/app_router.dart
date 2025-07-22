import 'package:Bookly/features/home/presentation/view/book_details_view.dart';
import 'package:Bookly/features/home/presentation/view/home_view.dart';
import 'package:Bookly/features/search/presentation/view/search_view.dart';
import 'package:Bookly/features/splash/presentation/view/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeView='/homeView' ;
  static const kBookDetailsView='/bookDetailsView' ;
  static const kSearchView='/searchView' ;
  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => SplashView()),
      GoRoute(path: AppRouter.kHomeView, builder: (context, state) => HomeView()),
      GoRoute(path: AppRouter.kBookDetailsView, builder: (context, state) => BookDetailsView()),
      GoRoute(path: AppRouter.kSearchView, builder: (context, state) => SearchView()),
    ],
  );
}
