import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:app_ui_list_crud_state_managment_all/models/user.dart';

class UserAllHttp {
  // Simulação de uma chamada de API que retorna uma lista de usuários
  static Future<List<User>> fetchUsers() async {
    final url =
        Uri.parse('https://reqres.in/api/users?page=1'); // API de exemplo
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List<dynamic> usersData = jsonData['data'];

      // Convertendo os dados do JSON para uma lista de objetos User
      return usersData.map((user) => User.fromJson(user)).toList();
    } else {
      throw Exception('Erro ao carregar usuários da API');
    }
  }
}
