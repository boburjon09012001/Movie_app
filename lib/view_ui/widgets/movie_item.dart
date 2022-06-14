import 'package:flutter/material.dart';
import 'package:movia_app/models/genre.dart';
import 'package:movia_app/models/movie.dart';

class MovieItem extends StatelessWidget {
  final Movie movie;
  final List<Genre> genres;
  static const imgEndPoint = "http://image.tmdb.org./t/p/w500";
  const MovieItem(this.movie, this.genres, {Key? key,  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      decoration: BoxDecoration(
        color: Colors.black38,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        children: [
          Padding(
            padding:const  EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            child: Row(
             mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network("$imgEndPoint${movie.posterPath}",
                  width: MediaQuery.of(context).size.width * 0.43,
                  height: MediaQuery.of(context).size.height * 0.29,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 20.0, top: 10.0),
            child:  SizedBox(child: Text(movie.title ?? "---",
              style: TextStyle(color: Color(0xFFC7C8D0)),), width: MediaQuery.of(context).size.width * 0.4,),
          ),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            buildGenres(genres),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 20.0, top: 10.0),
            child: SizedBox(child: Text(movie.releaseDate ?? "---",
                style: TextStyle(color: Color(0xFFC7C8D0))), width: MediaQuery.of(context).size.width * 0.4,),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 10,  top: 10.0),
            child: Row(
              children: [
              const  Icon(Icons.star, color: Colors.yellow,),
              const  SizedBox(width: 2.0,),
               SizedBox(child: Text(movie.voteAverage.toString() ?? "---",
                    style: TextStyle(color: Color(0xFFC7C8D0))), width: MediaQuery.of(context).size.width * 0.4,),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget buildGenres(List<Genre> genres) {
    List<Widget> widgets = [];
    genres.forEach((element)
    {widgets.add(Text("- ${element.name}",
      style:const TextStyle(color: Colors.white70),));});
    return Column(
      children:
        widgets,
    );

  }
}
