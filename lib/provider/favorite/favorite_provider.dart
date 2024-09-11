import 'package:app_ui_list_crud_state_managment_all/models/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favorite_provider.g.dart';

@riverpod
class FavoriteNotifier extends _$FavoriteNotifier {
  @override
  Set<User> build() {
    return {};
  }

  void addOrRemoveFavorite(User user) {
    if (!state.contains(user)) {
      user.favorite = true;
      state = {...state, user};
      return;
    }
    user.favorite = false;
    state = {...state}..remove(user);
  }
}
