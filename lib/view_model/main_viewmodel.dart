import 'package:flutter/material.dart';
import 'package:movia_app/core/api_response.dart';
import 'package:movia_app/models/genre.dart';
import 'package:movia_app/models/movie.dart';
import 'package:movia_app/models/repositories/genre_repositories.dart';
import 'package:movia_app/models/repositories/popular_repository.dart';

class MainViewModel extends ChangeNotifier{

  ApiResponse _apiResponse  = ApiResponse.initial("Initial");
  List<Movie> _movies = [];
  List<Genre> _genres = [];


  List<Movie> get movies {
    return _movies;
  }
  List<Genre> get genres {
    return _genres;
  }


  ApiResponse get response{
    return _apiResponse;

  }
  Future fetchPopular() async{
      try{
        List<Movie>  movies = await PopularRepository().fetchPopular();
        _movies = movies;
        _apiResponse = ApiResponse.completed(movies.toString());
      }
      catch(exception){
        _apiResponse = ApiResponse.error(exception.toString());

      }
      notifyListeners();
  }



  Future fetchGenres() async{
    try{
      List<Genre>  genres = await GenreRepository().fetchGenres();
      _genres  = genres;

    }
    catch(exception){

    }
    notifyListeners();
  }
}