import 'package:Bookly/features/home/data/models/book_model.dart';

abstract class FeaturedBooksStates{
  const FeaturedBooksStates();
}

class FeaturedBooksInitial extends FeaturedBooksStates{

}
class FeaturedBooksLoadingState extends FeaturedBooksStates{

}

class FeaturedBooksFailureState extends FeaturedBooksStates{
  final String errorMessage;

  const FeaturedBooksFailureState(this.errorMessage);
}
class FeaturedBooksSuccessState extends FeaturedBooksStates{
  final List<BookModel> books;

  const FeaturedBooksSuccessState(this.books);
}