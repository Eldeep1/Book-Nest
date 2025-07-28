import 'package:Bookly/features/home/data/models/book_model.dart';

abstract class NewestBooksState{
  const NewestBooksState();
}
class NewestBooksLoadingState extends NewestBooksState{}

class NewestBooksSuccessState extends NewestBooksState{
  final List<BookModel> books;

  const NewestBooksSuccessState(this.books);
}

class NewestBooksFailureState extends NewestBooksState{
  final String errorMessage;

  const NewestBooksFailureState({required this.errorMessage});

}
