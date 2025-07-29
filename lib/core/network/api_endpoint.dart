class ApiEndpoint{
  static const String newestBooksEndpoint="volumes?Filtering=free-ebooks&Sorting=newest &q=computer science";
  static const String featuredBooksEndpoint="volumes?Filtering=free-ebooks&q=subject:programming";
  static String similarBooksEndpoint({required String category}){
    return "volumes?Sorting=relevance&Filtering=free-ebooks&q=subject:$category";
  }
}