class User {
  String id; // Campo id adicionado
  String nome;
  String email;
  bool favorite;
  String imageUrl;

  User({
    required this.id, // Adicionado como obrigatório
    required this.nome,
    required this.email,
    required this.imageUrl,
    this.favorite = false, // Valor padrão para favorite
  });

  User copyWith({
    String? id,
    String? nome,
    String? email,
    bool? favorite,
    String? imageUrl,
  }) {
    return User(
      id: id ?? this.id, // Mantém o valor existente se não for fornecido
      nome: nome ?? this.nome,
      email: email ?? this.email,
      favorite: favorite ?? this.favorite,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  // Método fromJson atualizado para refletir os campos fornecidos
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? '', // ID deve ser uma String não nula
      nome: json['nome'] ?? '', // Nome pode vir como 'first_name'
      email: json['email'] ?? '', // Email deve ser uma String não nula
      imageUrl: json['imageUrl'] ?? '', // URL da imagem
      favorite: json['favorite'] ?? false, // Valor padrão para favorite
    );
  }

  // Método toJson para converter o objeto em JSON, se necessário
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'email': email,
      'imageUrl': imageUrl,
      'favorite': favorite,
    };
  }
}
