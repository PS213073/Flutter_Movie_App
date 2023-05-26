import 'package:flutter/material.dart';
import 'package:movie_app/tmdb_api.dart';

class MovieDetailScreen extends StatelessWidget {
  final Movie movie;

  const MovieDetailScreen({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 300,
              child: AspectRatio(
                aspectRatio: 2 / 3,
                child: Image.network(
                  movie.posterUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${movie.rating}/10',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Release Date: ${movie.releaseDate}',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Overview',
                    style: Theme.of(context).textTheme.titleLarge,
                   ),
                  const SizedBox(height: 8),
                  Text(movie.overview),
                  const SizedBox(height: 16),
                  // Text(
                  //   'Cast',
                  //   style: Theme.of(context).textTheme.titleLarge,
                  // ),
                  // const SizedBox(height: 8),
                  // FutureBuilder(
                  //   future: Cast.getMovieCast(123),
                  //   builder: (context, snapshot) {
                  //     if (snapshot.hasData) {
                  //       final List<Actor> cast = snapshot.data as List<Actor>;
                  //       return SizedBox(
                  //         height: 100,
                  //         child: ListView.builder(
                  //           scrollDirection: Axis.horizontal,
                  //           itemCount: cast.length,
                  //           itemBuilder: (context, index) {
                  //             final Actor actor = cast[index];
                  //             return Padding(
                  //               padding: const EdgeInsets.all(8.0),
                  //               child: Column(
                  //                 children: [
                  //                   SizedBox(
                  //                     height: 60,
                  //                     width: 60,
                  //                     child: CircleAvatar(
                  //                       backgroundImage: NetworkImage(actor.profileUrl),
                  //                     ),
                  //                   ),
                  //                   const SizedBox(height: 4),
                  //                   Text(
                  //                     actor.name,
                  //                     style: const TextStyle(fontSize: 12),
                  //                     textAlign: TextAlign.center,
                  //                     maxLines: 2,
                  //                   ),
                  //                 ],
                  //               ),
                  //             );
                  //           },
                  //         ),
                  //       );
                  //     } else if (snapshot.hasError) {
                  //       return Text('${snapshot.error}');
                  //     } else {
                  //       return const Center(child: CircularProgressIndicator());
                  //     }
                  //   },
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
