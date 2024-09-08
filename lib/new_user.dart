import 'package:app_ui_list_crud_state_managment_all/components/utils/show/snackbar_component.dart';
import 'package:app_ui_list_crud_state_managment_all/home_screen.dart';
import 'package:app_ui_list_crud_state_managment_all/models/user.dart';
import 'package:app_ui_list_crud_state_managment_all/provider/favorite_provider.dart';
import 'package:app_ui_list_crud_state_managment_all/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewUserScreen extends ConsumerStatefulWidget {
  const NewUserScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NewUserScreenState();
}

class _NewUserScreenState extends ConsumerState<NewUserScreen> {
  final _formKey = GlobalKey<FormState>();

  // Variáveis para armazenar os dados do formulário
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _imageUrlController = TextEditingController();
  bool _favorite = false;

  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      final newUser = User(
        id: DateTime.now().toString(),
        nome: _nomeController.text,
        email: _emailController.text,
        favorite: _favorite,
        imageUrl: _imageUrlController.text,
      );

      final notifierUser = ref.read(userNotifierProvider.notifier);
      notifierUser.addOrRemoveFavorite(newUser);

      if (newUser.favorite) {
        final notifierFavotire = ref.read(favoriteNotifierProvider.notifier);
        notifierFavotire.addOrRemoveFavorite(newUser);
      }

      ScaffoldMessenger.of(context).showSnackBar(SnackBarComponent.execute(
          textMessage: 'Usuário criado com sucesso',
          color: Colors.green[300]!));

      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomeScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Novo Usuário',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color.fromARGB(251, 95, 104, 130),
      ),
      body: Container(
        padding: const EdgeInsets.all(3.0),
        color: Color.fromARGB(255, 48, 61, 95),
        child: Card(
          color: Colors.black,
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: _nomeController,
                    decoration: const InputDecoration(
                        labelText: 'Nome',
                        labelStyle: TextStyle(color: Colors.grey)),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira um nome.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(color: Colors.grey)),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira um email.';
                      }
                      if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                        return 'Por favor, insira um email válido.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _imageUrlController,
                    decoration: const InputDecoration(
                        labelText: 'Link da Foto',
                        labelStyle: TextStyle(color: Colors.grey)),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Text('Favorito',
                          style: TextStyle(color: Colors.grey, fontSize: 16)),
                      Checkbox(
                        value: _favorite,
                        onChanged: (value) {
                          setState(() {
                            _favorite = value ?? false;
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      onPressed: _saveForm,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 48, 61, 95),
                      ),
                      child: const Text(
                        'Salvar',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
