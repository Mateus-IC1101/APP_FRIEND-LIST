import 'package:app_ui_list_crud_state_managment_all/components/card_user_component.dart';
import 'package:app_ui_list_crud_state_managment_all/favorites_screen.dart';
import 'package:app_ui_list_crud_state_managment_all/new_user.dart';
import 'package:app_ui_list_crud_state_managment_all/provider/favorite_provider.dart';
import 'package:app_ui_list_crud_state_managment_all/provider/user/filters/user_filter_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_ui_list_crud_state_managment_all/provider/user_provider.dart';
import 'package:badges/badges.dart' as badges;

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  TextEditingController _nomeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print('build');
    final allUsers = ref.watch(userFilterNotifierProvider);
    final favoriteUsers = ref.watch(favoriteNotifierProvider);
    print('---');
    print(allUsers.length);
    print('---');

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Usuários',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        actions: [
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: badges.Badge(
                badgeAnimation: badges.BadgeAnimation.fade(
                    // colorChangeAnimationDuration: Duration(seconds: 1),
                    animationDuration: Duration(seconds: 1)),
                badgeContent: Text(
                  favoriteUsers.length.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                badgeStyle: badges.BadgeStyle(
                  badgeColor: Color.fromARGB(255, 48, 61, 95),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                  borderRadius: BorderRadius.circular(30),
                  elevation: 2,
                ),
                position: badges.BadgePosition.topEnd(end: 0, top: 0),
                child: const Icon(
                  Icons.favorite,
                  size: 35,
                  color: Color.fromARGB(255, 236, 30, 30),
                ),
              ),
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => FavoritesScreen()),
              );
            },
          ),
        ],
        backgroundColor: Color.fromARGB(251, 95, 104, 130),
      ),
      body: Container(
          color: Color.fromARGB(255, 48, 61, 95),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(15, 15, 15, 0),
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 5, 5, 5).withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: Offset(0, 2), // changes position of shadow
                    ),
                  ],
                ),
                child: TextField(
                  controller: _nomeController,
                  onChanged: (value) {
                    final usersFilterLocal = ref
                        .watch(userFilterNotifierProvider.notifier)
                        .filterName(value);
                    ref.watch(userFilterNotifierProvider.notifier).state =
                        usersFilterLocal;
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 15),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.red,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.filter_list),
                      onPressed: () {},
                    ),
                    hintText: 'Nome do usuário',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              Expanded(
                  child: ListView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: allUsers.length,
                itemBuilder: (context, index) {
                  final user = allUsers.elementAt(index);
                  return CardUserComponent(user: user);
                },
              ))
            ],
          )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromRGBO(82, 170, 94, 1.0),
        tooltip: 'Novo Usuário',
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const NewUserScreen()));
        },
        child: const Icon(Icons.add, color: Colors.white, size: 28),
      ),
    );
  }
}
