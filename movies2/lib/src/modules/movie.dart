class Movie{

  Movie({
    required this.title,
    required this.year,
    required this.rating,
    required this.genres,
    required this.image,
  });

  //alt+shift -> modificam in mai multe locuri odata
  Movie.fromJson(Map<String, dynamic> item)
      : title = item['title'] as String,
        year = item['year'] as int,
        rating = item['rating'] as double,
        genres = List<String>.from(item['genres'] as List<dynamic>),
        image = item['medium_cover_image'] as String;

  final String title;
  final int year;
  final double rating;
  final List<String> genres;
  final String image;


  //alt+insert -> Generate
  @override
  String toString() {
    return 'Movie{title: $title, year: $year, rating: $rating, genres: $genres, image: $image}';
  }
}
