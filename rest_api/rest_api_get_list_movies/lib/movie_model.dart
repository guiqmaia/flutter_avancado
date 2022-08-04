import 'dart:convert';

class MovieModel {
  String id;
  String title;
  String originalTitle;
  String originalTitleRomanised;
  String image;
  String movieBanner;
  String description;
  String director;
  String producer;
  MovieModel({
    required this.id,
    required this.title,
    required this.originalTitle,
    required this.originalTitleRomanised,
    required this.image,
    required this.movieBanner,
    required this.description,
    required this.director,
    required this.producer,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'title': title});
    result.addAll({'originalTitle': originalTitle});
    result.addAll({'originalTitleRomanised': originalTitleRomanised});
    result.addAll({'image': image});
    result.addAll({'movieBanner': movieBanner});
    result.addAll({'description': description});
    result.addAll({'director': director});
    result.addAll({'producer': producer});

    return result;
  }

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      originalTitle: map['original_title'] ?? '',
      originalTitleRomanised: map['original_title_romanised'] ?? '',
      image: map['image'] ?? '',
      movieBanner: map['movie_banner'] ?? '',
      description: map['description'] ?? '',
      director: map['director'] ?? '',
      producer: map['producer'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieModel.fromJson(String source) =>
      MovieModel.fromMap(json.decode(source));
}
