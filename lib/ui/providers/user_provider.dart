import 'package:agenda_clinica/domain/models/user.dart';
import 'package:agenda_clinica/domain/usecases/delete_user.dart';
import 'package:agenda_clinica/domain/usecases/edit_user.dart';
import 'package:agenda_clinica/domain/usecases/save_user.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {

  final SaveUser saveUserUseCase;
  final EditUser editUserUseCase;
  final DeleteUser deleteUserUseCase;
  
  UserProvider({
    required this.saveUserUseCase,
    required this.editUserUseCase,
    required this.deleteUserUseCase,
  });
  
  final List<User> _users = [];
  User? _selectedUser = User(name: 'Camila Barona Cabrera', age: 24, id: '1010136709', idType: 'Cédula de Ciudadania', email: 'c@b.com', birthDate: DateTime.now(), phone: 3123452342, consult: 'orem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen. No sólo sobrevivió 500 años, sino que tambien ingresó como texto de relleno en documentos electrónicos, quedando esencialmente igual al original. Fue popularizado en los 60s con la creación de las hojas "Letraset", las cuales contenian pasajes de Lorem Ipsum, y más recientemente con software de autoedición, como por ejemplo Aldus PageMaker, el cual incluye versiones de Lorem Ipsum.', record: 'orem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen. No sólo sobrevivió 500 años, sino que tambien ingresó como texto de relleno en documentos electrónicos, quedando esencialmente igual al original. Fue popularizado en los 60s con la creación de las hojas "Letraset", las cuales contenian pasajes de Lorem Ipsum, y más recientemente con software de autoedición, como por ejemplo Aldus PageMaker, el cual incluye versiones de Lorem Ipsum.', diagnosis: 'orem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen. No sólo sobrevivió 500 años, sino que tambien ingresó como texto de relleno en documentos electrónicos, quedando esencialmente igual al original. Fue popularizado en los 60s con la creación de las hojas "Letraset", las cuales contenian pasajes de Lorem Ipsum, y más recientemente con software de autoedición, como por ejemplo Aldus PageMaker, el cual incluye versiones de Lorem Ipsum.', registerDate: DateTime.now());

  List<User> get users => _users;
  User? get selectedUser => _selectedUser;


  void selectUser(User user) {
    _selectedUser = user;
    notifyListeners();
  }

  Future<void> saveUser(User user) async {
    await saveUserUseCase(user);
    _users.add(user);
    notifyListeners();
  }

  Future<void> editUser(User user) async {
    await editUserUseCase(user);
    final index = _users.indexWhere((u) => u.id == user.id);
    if (index != -1) _users[index] = user;
    notifyListeners();
  }

  Future<void> deleteUser(String userId) async {
    await deleteUserUseCase(userId);
    _users.removeWhere((user) => user.id == userId);
    notifyListeners();
  }
}
