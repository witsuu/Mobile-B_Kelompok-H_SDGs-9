import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SessionUser {
  String _user;
  final _storage = new FlutterSecureStorage();

  Future getSession() async {
    _user = await _storage.read(key: 'isLogged');
    return Future.value(_user);
  }

  Future<String> deleteSession() async {
    await _storage.delete(key: 'isLogged');
    await _storage.delete(key: 'email');
    _user = await _storage.read(key: 'isLogged');
    String _mail = await _storage.read(key: 'email');
    print(_mail);
    return Future.value(_user);
  }
}
