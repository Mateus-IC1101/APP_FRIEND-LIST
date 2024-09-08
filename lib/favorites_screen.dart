import 'package:app_ui_list_crud_state_managment_all/components/card_user_component.dart';
import 'package:app_ui_list_crud_state_managment_all/components/utils/icons_buttons/icon_button_badge_component.dart';
import 'package:app_ui_list_crud_state_managment_all/provider/favorite_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class FavoritesScreen extends ConsumerStatefulWidget {
  const FavoritesScreen({super.key});

  @override
  ConsumerState<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends ConsumerState<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    final favoriteUsers = ref.watch(favoriteNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Riverpod Management',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        actions: [IconButtonBadgeComponent(favoriteUsers: favoriteUsers)],
        backgroundColor: Color.fromARGB(251, 95, 104, 130),
      ),
      body: Container(
        color: Color.fromARGB(255, 48, 61, 95),
        child: favoriteUsers.isEmpty
            ? Center(
                child: Text(
                  'Sem favoritos no momento',
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.bold),
                ),
              )
            : ListView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: favoriteUsers.length,
                itemBuilder: (context, index) {
                  final user = favoriteUsers.elementAt(index);
                  return CardUserComponent(user: user);
                },
              ),
      ),
    );
  }
}
