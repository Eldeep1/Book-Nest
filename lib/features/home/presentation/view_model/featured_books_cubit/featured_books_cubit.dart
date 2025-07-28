import 'package:Bookly/features/home/data/repo/home_repo.dart';
import 'package:Bookly/features/home/presentation/view_model/featured_books_cubit/featured_books_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksStates> {

  FeaturedBooksCubit({required this.homeRepo}) : super(FeaturedBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBooksLoadingState());
    var result = await homeRepo.fetchFeaturedBooks();
    result.fold(
      (failure) => emit(FeaturedBooksFailureState(failure.errorMessage)),
      (books) => emit(FeaturedBooksSuccessState(books)),
    );
  }
}
