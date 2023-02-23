import 'dart:convert';

import '../../domain/entities/character_entity.dart';
import '../../domain/enums/page_state_enum.dart';

class CharacterModel extends Character {
  final List<dynamic> episodesRef;
  CharacterModel({
    required int id,
    required String name,
    required String status,
    required String species,
    required String type,
    required this.episodesRef,
    required EnumGender gender,
    required String location,
    required String origin,
    required String image,
    bool isFavorite = false,
  }) : super(
            id: id,
            name: name,
            status: status,
            species: species,
            type: type,
            episodes: episodesRef.length,
            gender: gender,
            location: location,
            origin: origin,
            image:image,
            isFavorite: isFavorite);

  Character toEntity() {
    return Character(
        id: id,
        name: name,
        type: type,
        gender: gender,
        species: species,
        status: status,
        location: location,
        origin: origin,
        episodes: episodesRef.length,
        image:image,
        isFavorite: isFavorite);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'gender': gender.toString(),
      'species': species,
      'status': status,
      'location': location,
      'origin': origin,
      'episodes': episodesRef,
      'image': image,
      'isFavorite': isFavorite,
    };
  }

  factory CharacterModel.fromMap(Map<dynamic, dynamic> map) {
    return CharacterModel(
      id: map['id'],
      name: map['name'],
      type: map['type'],
      gender: EnumGenderExtension.fromString(map['gender']),
      species: map['species'],
      status: map['status'],
      location: map['location']['name'],
      origin: map['origin']['name'],
      episodesRef: map['episode'],
      image: map['image'],
      isFavorite: false,
    );
  }

  String toJson() => json.encode(toMap());
}
