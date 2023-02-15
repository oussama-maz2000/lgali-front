import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Credential {
  final supabase = Supabase.instance.client;
  User? user;
  Session? session;

  String _email;
  String _password;

  Credential(this._email, this._password) {}

  String getEmail() {
    return this._email;
  }

  String getPassword() {
    return this._password;
  }

  void setEmail(String email) {
    this._email = email;
  }

  void setPassword(String password) {
    this._password = password;
  }

  Future<void> createNewUser() async {
    print(getEmail());
    print(getPassword());
    AuthResponse response =
        await supabase.auth.signUp(email: getEmail(), password: getPassword());

    session = response.session;
    user = response.user;
    print(session);
    print(user);
  }

  @override
  String toString() {
    return 'Credential{email: $_email, password: $_password}';
  }
}
