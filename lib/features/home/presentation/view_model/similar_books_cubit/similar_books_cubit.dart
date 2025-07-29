import 'package:Bookly/features/home/data/repo/home_repo.dart';
import 'package:Bookly/features/home/presentation/view_model/similar_books_cubit/similar_books_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksStates> {

  SimilarBooksCubit({required this.homeRepo}) : super(SimilarBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchSimilarBooks({required String category}) async {
    emit(SimilarBooksLoadingState());
    var result = await homeRepo.fetchSimilarBooks(category: category);
    result.fold(
      (failure) => emit(SimilarBooksFailureState(failure.errorMessage)),
      (books) {
        emit(SimilarBooksSuccessState(books));
      },
    );
  }
}
