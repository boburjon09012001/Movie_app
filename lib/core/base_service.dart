abstract class BaseService{
  final String apiKey = "?api_key=b1595085465143ff3a90c6eb541a2eb6";
  final String baseURL = "https://api.themoviedb.org/3/movie";
  final String genreURL = "https://api.themoviedb.org/3/genre/movie/list";



  Future<dynamic> getResponse(String url);
}