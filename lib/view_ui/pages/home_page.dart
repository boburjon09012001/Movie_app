import 'package:flutter/material.dart';
import 'package:movia_app/core/api_response.dart';
import 'package:movia_app/models/genre.dart';
import 'package:movia_app/view_model/main_viewmodel.dart';
import 'package:movia_app/view_ui/widgets/movie_item.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState(){
    super.initState();
    Provider.of<MainViewModel>(context, listen:  false).fetchPopular();
    Provider.of<MainViewModel>(context, listen:  false).fetchGenres();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor:Color(0xFF070D2D),
          appBar: AppBar(title:const Text("Movie App"),
        elevation: 0.0,
            backgroundColor:Color(0xFF070D2D),
        ),
        body: Consumer<MainViewModel>(
          builder: (context , data, child){
            List<Genre> genres = data.genres;
           if(data.response.status == Status.LOADING){
             return const CircularProgressIndicator();
           }
           if(data.response.status == Status.COMPLETED){
             return SingleChildScrollView(
               child: Column(
                 children: [
                   myFormField(),
                   Padding(
                     padding: const EdgeInsets.only(left: 12.0, top: 10, right: 12.0),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children:const [
                     Text(
                           "Catigories", style: TextStyle(fontSize: 17.0,color: Color(0xFFC7C8D0)),
                         ),
                     Text(
                           "See more", style: TextStyle(fontSize: 16.0,color: Color(0xFF606787)),
                         ),
                       ],
                     ),
                   ),

                   myCatigories(),

                   Padding(
                     padding: const EdgeInsets.only(left: 12.0, top: 10, right: 12.0),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children:const [
                         Text(
                           "Popular", style: TextStyle(fontSize: 17.0,color: Color(0xFFC7C8D0)),
                         ),
                         Text(
                           "See more", style: TextStyle(fontSize: 16.0,color: Color(0xFF606787)),
                         ),
                       ],
                     ),
                   ),

                  const SizedBox(
                     height: 6.0,
                   ),
                   Container(
                     height: MediaQuery.of(context).size.height * 0.5,
                     child: ListView.builder(
                       scrollDirection: Axis.horizontal,
                         itemCount: data.movies.length,
                         itemBuilder: (BuildContext context, int index) {
                         List<Genre> movieGenres = [];
                         data.movies[index].genreIds?.forEach((id) {
                           movieGenres.addAll(genres.where((genre) =>genre.id  == id));
                         });
                       return Padding(
                         padding: const EdgeInsets.all(8.0),
                        child: MovieItem(data.movies[index],movieGenres ),
                       );
                     }),
                   ),
                 ],
               ),
             );
           }
           if(data.response.status == Status.ERROR){
             return Center(child: Text(data.response.message,
               style: const TextStyle(fontSize: 19.0),));
           }

           if(data.response.status == Status.INITIAL){
             return const Center(child: CircularProgressIndicator());
             // return const Center(child: Text("INITIAL RIGHT NOW", style: TextSty  le(fontSize: 19.0),));
           }

           return Container();


          },
        )
      ),
    );
  }


  Widget myFormField(){
    return   Padding(
      padding: const EdgeInsets.all(12.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          decoration:  InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.white12,
            ),
            fillColor:const Color(0xFF606787),
            labelText: 'Search your movie',labelStyle:const TextStyle(
            color: Colors.white70,
          ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide:const BorderSide(
                color: Colors.white12,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide:const BorderSide(
                color: Colors.white12,
                width: 2.0,
              ),
            ),
          ),
          onSaved: (String? value) {

          },
          validator: (String? value) {
            return (value != null && value.contains('@')) ? 'Do not use the words.' : null;
          },
        ),
      ),
    );
  }


  Widget myCatigories(){
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Padding(
            padding:const EdgeInsets.fromLTRB(8.0, 12, 8,8),
            child: Container(
              width: 75,
              height: 75,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(9.0),
                child: Image.asset("assets/images/romance.png"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 75,
              height: 75,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child:  Padding(
                padding: const EdgeInsets.all(18.0),
                child: Image.asset("assets/images/comedy.png",width: 10,),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 75,
              height: 75,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child:  Padding(
                padding: const EdgeInsets.all(19.0),
                child: Image.asset("assets/images/harror.png",width: 10,),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 75,
              height: 75,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(19.0),
                child: Image.asset("assets/images/drama.png",width: 10,),
              ),
            ),
          ),


        ],
      ),
    );
  }
}
