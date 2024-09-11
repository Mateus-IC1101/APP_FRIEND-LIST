import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:app_ui_list_crud_state_managment_all/models/user.dart';

part 'user_provider.g.dart';

@riverpod
class UserNotifier extends _$UserNotifier {
  @override
  Set<User> build() {
    return allUsers.toSet();
  }

  void addOrRemoveFavorite(User user) {
    if (!state.contains(user)) {
      state = {...state, user};
      return;
    }
    user.favorite = false;
    state = {...state}..remove(user);
  }

  List<User> filterName(String? nameSearch) {
    if (nameSearch != null && nameSearch.isNotEmpty) {
      final filter = state
          .where((user) =>
              user.nome.toLowerCase().contains(nameSearch.toLowerCase()))
          .toList();
      return filter;
    }
    print('2200');
    return state.toList();
  }
}

List<User> allUsers = [
  User(
    id: '1',
    nome: 'Alice Johnson',
    email: 'alice.johnson@example.com',
    imageUrl: 'https://images.unsplash.com/photo-1494790108377-be9c29b29330',
  ),
  User(
    id: '2',
    nome: 'Bob Smith',
    email: 'bob.smith@example.com',
    imageUrl: 'https://images.unsplash.com/photo-1527980965255-d3b416303d12',
  ),
  User(
    id: '3',
    nome: 'Carol Williams',
    email: 'carol.williams@example.com',
    imageUrl: 'https://images.unsplash.com/photo-1502767089025-6572583495f6',
  ),
  User(
    id: '4',
    nome: 'David Brown',
    email: 'david.brown@example.com',
    imageUrl: 'https://images.unsplash.com/photo-1492562080023-ab3db95bfbce',
  ),
  User(
    id: '5',
    nome: 'Eva Taylor',
    email: 'eva.taylor@example.com',
    imageUrl: 'https://images.unsplash.com/photo-1544005313-94ddf0286df2',
  ),
  User(
    id: '6',
    nome: 'Milli Rose',
    email: 'milli.rose@example.com',
    imageUrl: 'https://images.unsplash.com/photo-1534528741775-53994a69daeb',
  ),
  User(
    id: '7',
    nome: 'Thomas Lee',
    email: 'thomas.lee@example.com',
    imageUrl: 'https://images.unsplash.com/photo-1552058544-f2b08422138a',
  ),
  User(
    id: '8',
    nome: 'Sther Floy',
    email: 'sther.floy@example.com',
    imageUrl: 'https://images.unsplash.com/photo-1551836022-d5d88e9218df',
  ),
  User(
    id: '9',
    nome: 'Carl Evan',
    email: 'carl.evan@example.com',
    imageUrl: 'https://images.unsplash.com/photo-1599566150163-29194dcaad36',
  ),
  User(
    id: '10',
    nome: 'Mônica lima',
    email: 'monica.limaaa@example.com',
    imageUrl: 'https://images.unsplash.com/photo-1607746882042-944635dfe10e',
  ),
];
