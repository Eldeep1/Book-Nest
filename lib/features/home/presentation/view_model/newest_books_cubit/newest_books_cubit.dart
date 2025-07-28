import 'package:Bookly/features/home/data/repo/home_repo.dart';
import 'package:Bookly/features/home/presentation/view_model/newest_books_cubit/newest_books_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(super.initialState, {required this.homeRepo});
  final HomeRepo homeRepo;

  Future<void> fetchNewestBooks() async {
    final result = await homeRepo.fetchNewestBooks();
    result.fold(
      (failure) => emit(NewestBooksFailureState(errorMessage: failure.errorMessage)),
      (success) => emit(NewestBooksSuccessState(success)),
    );
  }
}
