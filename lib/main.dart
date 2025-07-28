import 'package:Bookly/core/utils/app_router.dart';
import 'package:Bookly/core/utils/service_locator.dart';
import 'package:Bookly/features/home/data/repo/home_repo_impl.dart';
import 'package:Bookly/features/home/presentation/view_model/featured_books_cubit/featured_books_cubit.dart';
import 'package:Bookly/features/home/presentation/view_model/newest_books_cubit/newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';

void main() {
  setupServiceLocator();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => FeaturedBooksCubit(
          homeRepo: getIt.get<HomeRepoImpl>(),
        ),
        ),
        BlocProvider(create: (context) => NewestBooksCubit(
          homeRepo: getIt.get<HomeRepoImpl>(),
        ),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
      ),
    );
  }
}

