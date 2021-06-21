import 'dart:convert';

class RatingRepositoryDTO {
  String id;
  String age;
  String logo;

  RatingRepositoryDTO({
    required this.id,
    required this.age,
    required this.logo,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'age': age,
      'logo': logo,
    };
  }

  factory RatingRepositoryDTO.fromMap(Map<String, dynamic> map) {
    return RatingRepositoryDTO(
      id: map['id'],
      age: map['age'],
      logo: map['logo'],
    );
  }

  String toJson() => json.encode(toMap());

  factory RatingRepositoryDTO.fromJson(String source) =>
      RatingRepositoryDTO.fromMap(json.decode(source));
}
