import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:app_ui_list_crud_state_managment_all/models/user.dart';
import 'package:app_ui_list_crud_state_managment_all/provider/user_provider.dart';

part 'user_filter_provider.g.dart';

@riverpod
class UserFilterNotifier extends _$UserFilterNotifier {
  @override
  Set<User> build() {
    print('build UserFilterNotifier');
    final users = ref.watch(userNotifierProvider);
    return users.toSet();
  }

  void addOrRemoveFavorite(User user) {
    if (!state.contains(user)) {
      state = {...state, user};
      return;
    }
    user.favorite = false;
    state = {...state}..remove(user);
  }

  Set<User> filterName(String? nameSearch) {
    print('filter');
    if (nameSearch != null && nameSearch.isNotEmpty) {
      final filter = ref
          .watch(userNotifierProvider)
          .where((user) =>
              user.nome.toLowerCase().contains(nameSearch.toLowerCase()))
          .toList();
      // state = {...filter};
      // print(state.length);
      return filter.toSet();
    }
    final users = ref.watch(userNotifierProvider).toList();
    // state = {...users};
    return users.toSet();
  }
}
