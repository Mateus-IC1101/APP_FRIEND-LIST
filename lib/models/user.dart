// user_model.dart
class User {
  String id;
  String nome;
  String email;
  bool favorite;
  String imageUrl; // Nova propriedade

  User(
      {required this.id,
      required this.nome,
      required this.email,
      required this.imageUrl,
      this.favorite = false});

  User copyWith({
    String? id,
    String? nome,
    String? email,
    bool? favorite,
    String? imageUrl,
  }) {
    return User(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      email: email ?? this.email,
      favorite: favorite ?? this.favorite,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}
