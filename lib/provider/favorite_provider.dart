import 'package:app_ui_list_crud_state_managment_all/models/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteNotifier extends Notifier<Set<User>> {
  @override
  Set<User> build() {
    return {
      User(
          id: '10',
          nome: 'Jack Anderson',
          email: 'jack.anderson@example.com',
          imageUrl:
              'https://images.unsplash.com/photo-1607746882042-944635dfe10e',
          favorite: true)
    };
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

final favoriteNotifier = NotifierProvider<FavoriteNotifier, Set<User>>(() {
  return FavoriteNotifier();
});
