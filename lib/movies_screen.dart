import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'movie_detail.dart';
import 'tmdb_api.dart';
import 'package:movie_app/MovieTile.dart';

// void main() {
//   PaintingBinding.instance!.imageCache!.maximumSize = 100 * 1024 * 1024; // 100 MB cache
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       title: 'My App',
//       home: MoviesScreen(),
//     );
//   }
// }
//
// class MoviesScreen extends StatefulWidget {
//   const MoviesScreen({Key? key}) : super(key: key);
//
//   @override
//   MoviesScreenState createState() => MoviesScreenState();
// }
//
// class MoviesScreenState extends State<MoviesScreen> {
//   late int _currentPage;
//   late List<dynamic> _movies;
//   late bool _isLoading;
//
//   @override
//   void initState() {
//     super.initState();
//     _currentPage = 1;
//     _movies = [];
//     _isLoading = true;
//     _loadMovies();
//   }
//
//   Future<void> _loadMovies() async {
//     try {
//       final movies = await getPopularMovies(page: _currentPage);
//       setState(() {
//         _movies.addAll(movies);
//         _isLoading = false;
//       });
//     } catch (e) {
//       setState(() {
//         _isLoading = false;
//       });
//       if (kDebugMode) {
//         print('Failed to load movies: $e');
//       }
//     }
//   }
//
//   void _handleScrollEnd() {
//     if (!_isLoading) {
//       setState(() {
//         _isLoading = true;
//         _currentPage++;
//       });
//       _loadMovies();
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Movies'),
//       ),
//       body: Center(
//         child: NotificationListener<ScrollNotification>(
//           onNotification: (notification) {
//             if (notification is ScrollEndNotification &&
//                 notification.metrics.extentAfter == 0) {
//               _handleScrollEnd();
//             }
//             return false;
//           },
//           child: GridView.builder(
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2,
//               childAspectRatio: 1,
//             ),
//             itemCount: _movies.length,
//             itemBuilder: (context, index) {
//               final movie = _movies[index];
//               return Card(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: [
//                     Expanded(
//                       child: CachedNetworkImage(
//                         imageUrl:
//                         'https://image.tmdb.org/t/p/w500{movie['poster_path']}',
//                         placeholder: (context, url) => const Center(
//                           child: CircularProgressIndicator(),
//                         ),
//                         errorWidget: (context, url, error) =>
//                         const Icon(Icons.error),
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Text(
//                         movie['title'],
//                         style: const TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Text(
//                         'Rating: ${movie['vote_average']}',
//                         style: const TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Text(
//                         'Release Date: ${movie['release_date']}',
//                         style: const TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
//
//   getPopularMovies({required int page}) {}
// }

// class MoviesScreen extends StatelessWidget {
//   const MoviesScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Movies App'),
//       ),
//       body: Center(
//         child: FutureBuilder(
//           future: Movie.getPopularMovies(),
//         ),
//       ),
//     );
//   }
// }


//
// class MoviesScreen extends StatelessWidget {
//   const MoviesScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Movies App'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 20.0),
//         child: PageView.builder(
//           itemCount: 5, // replace with actual movie count
//           itemBuilder: (BuildContext context, int index) {
//             return Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: MovieTile(
//                 movie: Movie(
//                   id: index,
//                   title: 'Movie $index',
//                   overview: '',
//                   posterUrl: '',
//                 ), // replace with actual movie object
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }





class MoviesScreen extends StatelessWidget {

  const MoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies App'),
      ),
      body: Center(
        child: FutureBuilder(
          future: Movies().getPopularMovies(),
          builder: (context, snapshot){
            if (snapshot.hasData){
              List<Movie> movies = snapshot.data as List<Movie>;
              return ListView.builder(
                  itemCount: movies.length,
                  itemBuilder: (context, index){
                    return GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (
                            context
                        ) => MovieDetailScreen(movie: movies[index]),
                        ),
                        );
                      },
                      child: ListTile(
                        title: Text(movies[index].title),
                      ),
                    );
                  },
              );
            } else if (snapshot.hasError){
              return Text('${snapshot.error}');
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
