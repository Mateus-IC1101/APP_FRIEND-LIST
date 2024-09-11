import 'package:app_ui_list_crud_state_managment_all/models/user.dart';
import 'package:app_ui_list_crud_state_managment_all/provider/user/user_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userSearchNameProvider =
    StateProvider.family<List<User>, String?>((ref, nameSearch) {
  final users = ref.read(userNotifierProvider);

  if (nameSearch != null && nameSearch.isNotEmpty) {
    return users
        .where((user) =>
            user.nome.toLowerCase().contains(nameSearch.toLowerCase()))
        .toList();
  }
  print(users.length);
  return users.toList();
});
