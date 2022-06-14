
import 'package:movia_app/core/base_service.dart';
import 'package:movia_app/models/movie.dart';
import 'package:movia_app/models/services/popular_service.dart';

class PopularRepository{
  final BaseService _popularService = PopularService();


     Future<List<Movie>> fetchPopular() async {
     dynamic response = await  _popularService.getResponse("/popular");
     final data = response["results"] as List;


     List<Movie> movies = data.map((e) => Movie.fromJson(e)).toList();
     return movies;
 }


}