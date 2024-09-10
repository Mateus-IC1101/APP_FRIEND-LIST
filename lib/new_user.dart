import 'package:app_ui_list_crud_state_managment_all/components/utils/show/snackbar_component.dart';
import 'package:app_ui_list_crud_state_managment_all/home_screen.dart';
import 'package:app_ui_list_crud_state_managment_all/models/user.dart';
import 'package:app_ui_list_crud_state_managment_all/provider/favorite_provider.dart';
import 'package:app_ui_list_crud_state_managment_all/provider/form/new_user_form_provider.dart';
import 'package:app_ui_list_crud_state_managment_all/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewUserScreen extends ConsumerStatefulWidget {
  const NewUserScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NewUserScreenState();
}

class _NewUserScreenState extends ConsumerState<NewUserScreen> {
  final _formKey = GlobalKey<FormState>();

  // Variáveis para armazenar os dados do formulário
  TextEditingController _nomeController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _imageUrlController = TextEditingController();
  bool _favorite = false;

  @override
  void initState() {
    super.initState();
  }

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

  void cleanForm() {
    ref.read(newUserFormProvider.notifier).update((state) {
      state.nome = '';
      state.email = '';
      state.imageUrl = '';
      state.favorite = false;

      _nomeController.text = '';
      _emailController.text = '';
      _imageUrlController.text = '';
      _favorite = false;
      return state;
    });
  }

  @override
  Widget build(BuildContext context) {
    final formProviderState = ref.read(newUserFormProvider.notifier).state;
    final formProvider = ref.read(newUserFormProvider);

    _nomeController.text = ref.read(newUserFormProvider.notifier).state.nome;
    _emailController.text = ref.read(newUserFormProvider.notifier).state.email;
    _imageUrlController.text =
        ref.read(newUserFormProvider.notifier).state.imageUrl;
    _favorite = ref.read(newUserFormProvider.notifier).state.favorite;

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
                  Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                          onPressed: () {
                            cleanForm();
                          },
                          icon: Icon(
                            Icons.refresh,
                            color: Color.fromARGB(248, 28, 135, 188),
                          ))),
                  TextFormField(
                    controller: _nomeController,
                    onChanged: (value) {
                      ref.read(newUserFormProvider.notifier).update((state) {
                        if (state != null) {
                          state = state.copyWith(nome: _nomeController.text);
                        }
                        return state; // Retorna sempre um estado atualizado
                      });
                    },
                    decoration: const InputDecoration(
                      labelText: 'Nome',
                      labelStyle: TextStyle(
                          color: Color.fromARGB(248, 28, 135, 188),
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                    style: TextStyle(color: Colors.grey, fontSize: 14),
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
                    onChanged: (value) {
                      ref.read(newUserFormProvider.notifier).update((state) {
                        if (state != null) {
                          state = state.copyWith(email: _emailController.text);
                        }
                        return state; // Retorna sempre um estado atualizado
                      });
                    },
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(
                          color: Color.fromARGB(248, 28, 135, 188),
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                      // floatingLabelBehavior: FloatingLabelBehavior.auto
                    ),
                    style: TextStyle(color: Colors.grey, fontSize: 14),
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
                    onChanged: (value) {
                      ref.read(newUserFormProvider.notifier).update((state) {
                        if (state != null) {
                          state = state.copyWith(
                              imageUrl: _imageUrlController.text);
                        }
                        return state; // Retorna sempre um estado atualizado
                      });
                    },
                    decoration: const InputDecoration(
                      labelText: 'Link da Foto',
                      labelStyle: TextStyle(
                          color: Color.fromARGB(248, 28, 135, 188),
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                      // floatingLabelBehavior: FloatingLabelBehavior.auto
                    ),
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Text('Favorito',
                          style: TextStyle(
                              color: Color.fromARGB(248, 28, 135, 188),
                              fontWeight: FontWeight.bold,
                              fontSize: 14)),
                      Checkbox(
                        value: _favorite,
                        activeColor: Colors.black,
                        checkColor: Colors.green,
                        onChanged: (value) {
                          setState(() {
                            _favorite = value ?? false;
                            ref
                                .read(newUserFormProvider.notifier)
                                .update((state) {
                              if (state != null) {
                                state = state.copyWith(favorite: value);
                              }
                              return state; // Retorna sempre um estado atualizado
                            });
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
