import 'package:Bookly/core/utils/service_locator.dart';
import 'package:Bookly/features/home/data/models/book_model.dart';
import 'package:Bookly/features/home/data/repo/home_repo_impl.dart';
import 'package:Bookly/features/home/presentation/view/book_details_view.dart';
import 'package:Bookly/features/home/presentation/view/home_view.dart';
import 'package:Bookly/features/home/presentation/view_model/similar_books_cubit/similar_books_cubit.dart';
import 'package:Bookly/features/search/presentation/view/search_view.dart';
import 'package:Bookly/features/splash/presentation/view/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeView='/homeView' ;
  static const kBookDetailsView='/bookDetailsView' ;
  static const kSearchView='/searchView' ;
  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => SplashView()),
      GoRoute(path: AppRouter.kHomeView, builder: (context, state) => HomeView()),
      GoRoute(path: AppRouter.kBookDetailsView, builder: (context, state) {
        return BlocProvider(create: (context) {
         return SimilarBooksCubit(homeRepo: getIt.get<HomeRepoImpl>());
        },
        child: BookDetailsView(
          bookModel: state.extra as BookModel,
        ));
      }),
      GoRoute(path: AppRouter.kSearchView, builder: (context, state) => SearchView()),
    ],
  );
}
