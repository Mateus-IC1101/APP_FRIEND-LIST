import 'package:app_ui_list_crud_state_managment_all/components/card_user_component.dart';
import 'package:app_ui_list_crud_state_managment_all/favorites_screen.dart';
import 'package:app_ui_list_crud_state_managment_all/provider/favorite_provider.dart';
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
  @override
  Widget build(BuildContext context) {
    final allUsers = ref.watch(usersProvider);
    final favoriteUsers = ref.watch(favoriteNotifier);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Riverpod Management',
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
        child: ListView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: allUsers.length,
          itemBuilder: (context, index) {
            final user = allUsers[index];
            return CardUserComponent(user: user);
          },
        ),
      ),
    );
  }
}
