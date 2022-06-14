
import 'package:movia_app/core/base_service.dart';
import 'package:movia_app/models/genre.dart';
import 'package:movia_app/models/services/genre_services.dart';

class GenreRepository{
  final BaseService _genreService = GenreService();


  Future<List<Genre>> fetchGenres() async {
    dynamic response = await  _genreService.getResponse("");
    final data = response["genres"] as List;


    List<Genre> genres = data.map((e) => Genre.fromJson(e)).toList();
    return genres;
  }
}