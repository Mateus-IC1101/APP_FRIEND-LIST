class User {
  // String id;
  String nome;
  String email;
  bool favorite;
  String imageUrl;
  String? firstName;
  String? lastName;
  String? avatar;

  User({
    // required this.id,
    required this.nome,
    required this.email,
    required this.imageUrl,
    this.firstName,
    this.lastName,
    this.avatar,
    this.favorite = false,
  });

  User copyWith({
    // String? id,
    String? nome,
    String? email,
    bool? favorite,
    String? imageUrl,
    String? firstName,
    String? lastName,
    String? avatar,
  }) {
    return User(
      // id: id ?? this.id,
      nome: nome ?? this.nome,
      email: email ?? this.email,
      favorite: favorite ?? this.favorite,
      imageUrl: imageUrl ?? this.imageUrl,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      avatar: avatar ?? this.avatar,
    );
  }

  // Método fromJson com os novos campos opcionais
  factory User.fromJson(Map<dynamic, dynamic> json) {
    return User(
      nome:
          json['first_name'] ?? '', // Nome é opcional, pode vir de `first_name`
      email: json['email'] ?? '', // Email deve ser uma String não nula
      imageUrl:
          json['avatar'] ?? '', // URL da imagem é opcional, use valor padrão
      firstName: json['first_name'], // Campos opcionais
      lastName: json['last_name'],
      avatar: json['avatar'],
      favorite: json['favorite'] ?? false, // Valor padrão para favorite
    );
  }
}
