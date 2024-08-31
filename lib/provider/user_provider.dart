import 'package:app_ui_list_crud_state_managment_all/models/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

List<User> allUsers = [
  User(id: '1', nome: 'Alice Johnson', email: 'alice.johnson@example.com'),
  User(id: '2', nome: 'Bob Smith', email: 'bob.smith@example.com'),
  User(id: '3', nome: 'Carol Williams', email: 'carol.williams@example.com'),
  User(id: '4', nome: 'David Brown', email: 'david.brown@example.com'),
  User(id: '5', nome: 'Eva Taylor', email: 'eva.taylor@example.com'),
  User(id: '6', nome: 'Frank Clark', email: 'frank.clark@example.com'),
  User(id: '7', nome: 'Grace Lee', email: 'grace.lee@example.com'),
  User(id: '8', nome: 'Henry Walker', email: 'henry.walker@example.com'),
  User(
      id: '9',
      nome: 'Isabella Martinez',
      email: 'isabella.martinez@example.com'),
  User(id: '10', nome: 'Jack Anderson', email: 'jack.anderson@example.com'),
];

final usersProvider = Provider((ref) {
  return allUsers;
});
