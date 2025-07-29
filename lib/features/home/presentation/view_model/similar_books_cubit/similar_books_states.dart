import 'package:Bookly/features/home/data/models/book_model.dart';

abstract class SimilarBooksStates{
  const SimilarBooksStates();
}

class SimilarBooksInitial extends SimilarBooksStates{

}
class SimilarBooksLoadingState extends SimilarBooksStates{

}

class SimilarBooksFailureState extends SimilarBooksStates{
  final String errorMessage;

  const SimilarBooksFailureState(this.errorMessage);
}
class SimilarBooksSuccessState extends SimilarBooksStates{
  final List<BookModel> books;

  const SimilarBooksSuccessState(this.books);
}