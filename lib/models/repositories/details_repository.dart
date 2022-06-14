import 'package:movia_app/core/base_service.dart';
import 'package:movia_app/models/movie.dart';
import 'package:movia_app/models/services/details_services.dart';

class DetailsRepository{
  final BaseService _detailsService = DetailsService();


  Future<List<Movie>> fetchDetails(int movieId) async {
    dynamic response = await  _detailsService.getResponse(movieId.toString());
    final data = response["results"] as List;


    List<Movie> movies = data.map((e) => Movie.fromJson(e)).toList();
    return movies;
  }


}