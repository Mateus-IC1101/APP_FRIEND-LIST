import 'package:app_ui_list_crud_state_managment_all/models/user.dart';
import 'package:app_ui_list_crud_state_managment_all/provider/favorite_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CardUserComponent extends ConsumerStatefulWidget {
  final User user;
  const CardUserComponent({super.key, required this.user});

  @override
  ConsumerState<CardUserComponent> createState() => _CardUserComponentState();
}

class _CardUserComponentState extends ConsumerState<CardUserComponent> {
  @override
  Widget build(BuildContext context) {
    final favoriteUsers = ref.watch(favoriteNotifier);
    return Card(
      color: Colors.black,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      elevation: 4, // Sombra do card
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12), // Arredondamento dos cantos
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
                alignment: Alignment.topRight,
                child: (widget.user.favorite!)
                    ? IconButton(
                        icon: Icon(
                          Icons.favorite,
                          size: 25,
                        ),
                        color: Color.fromARGB(255, 236, 30, 30),
                        onPressed: () {
                          final notifier = ref.read(favoriteNotifier.notifier);
                          notifier.addOrRemoveFavorite(widget.user);
                        },
                      )
                    : IconButton(
                        icon: Icon(
                          Icons.favorite,
                          size: 25,
                        ),
                        color: Color.fromARGB(255, 98, 97, 97),
                        onPressed: () {
                          final notifier = ref.read(favoriteNotifier.notifier);
                          notifier.addOrRemoveFavorite(widget.user);
                        },
                      )),
            CircleAvatar(
              backgroundImage: NetworkImage(widget.user.imageUrl),
              radius: 40,
              onBackgroundImageError: (error, stackTrace) {
                // Exibe um ícone de erro se a imagem falhar ao carregar
                Icon(
                  Icons.error,
                  color: Colors.red,
                );
              },
            ),
            const SizedBox(height: 8),
            Text(
              widget.user.nome,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Color.fromARGB(175, 36, 79, 188)),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(
              widget.user.email,
              style: const TextStyle(color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
