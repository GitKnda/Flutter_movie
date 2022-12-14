import 'package:flutter/material.dart';
import 'package:moviesapp/services/MovieService.dart';
import 'package:moviesapp/models/MovieInfo.dart';
import 'package:moviesapp/components/PaddedText.dart';

class MovieDetail extends StatelessWidget {
  final String movieName;
  final String imdbId;

  MovieDetail({this.movieName, this.imdbId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.movieName),
        backgroundColor: Colors.red,
      ),
      body: FutureBuilder<MovieInfo>(
          future: getMovie(this.imdbId),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                          alignment: Alignment.center,
                          child: Image.network(
                            snapshot.data.poster,
                            width: 200,
                          ),
                        ),
                        Text(snapshot.data.plot, textAlign: TextAlign.justify,style: TextStyle( color: Colors.white) ),
                        Text("Year : " + snapshot.data.year, style: TextStyle( color: Colors.white)),
                        Text("Genre : " + snapshot.data.genre, style: TextStyle( color: Colors.white)),
                        Text("Directed by : " + snapshot.data.director, style: TextStyle( color: Colors.white)),
                        Text("Runtime : " + snapshot.data.runtime, style: TextStyle( color: Colors.white)),
                        Text("Rated : " + snapshot.data.rating, style: TextStyle( color: Colors.white)),
                        Text("IMDB Rating : " + snapshot.data.imdbRating, style: TextStyle( color: Colors.white)),
                        Text("Meta Score : " + snapshot.data.metaScore, style: TextStyle( color: Colors.white)),
                      ]));
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
