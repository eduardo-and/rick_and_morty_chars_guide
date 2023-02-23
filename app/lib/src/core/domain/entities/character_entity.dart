import '../enums/page_state_enum.dart';

class Character {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final int episodes;
  final EnumGender gender;
  final String location;
  final String origin;
  final String image;
  bool isFavorite;
  Character(
      {required this.id,
      required this.name,
      required this.status,
      required this.species,
      required this.type,
      required this.episodes,
      required this.gender,
      required this.location,
      required this.origin,
      required this.image,
      this.isFavorite = false});

  Character copyWith({
    int? id,
    String? name,
    String? status,
    String? species,
    String? type,
    int? episodes,
    EnumGender? gender,
    String? location,
    String? origin,
    bool? isFavorite,
    String? image,
  }) {
    return Character(
        id: id ?? this.id,
        name: name ?? this.name,
        status: status ?? this.status,
        species: species ?? this.species,
        type: type ?? this.type,
        episodes: episodes ?? this.episodes,
        gender: gender ?? this.gender,
        location: location ?? this.location,
        origin: origin ?? this.origin,
        isFavorite: isFavorite ?? isFavorite ?? false,
        image: image ?? this.image);
  }
}
