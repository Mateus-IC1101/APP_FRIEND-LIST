import 'package:app_ui_list_crud_state_managment_all/models/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final newUserFormProvider = StateProvider<User>((ref) {
  return User(id: DateTime.now().toString(), nome: '', email: '', imageUrl: '');
});
