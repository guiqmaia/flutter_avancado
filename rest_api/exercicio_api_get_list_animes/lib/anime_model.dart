
class AnimeModel {
  int id;
  String anime_name;
  String anime_img;
  
  AnimeModel({
    required this.id,
    required this.anime_name,
    required this.anime_img,
  });

  factory AnimeModel.fromMap(Map<String, dynamic> map) {
    return AnimeModel(
      id: map['anime_id']?.toInt() ?? 0,
      anime_name: map['anime_name'] ?? '',
      anime_img: map['anime_img'] ?? '',
    );
  }
}
