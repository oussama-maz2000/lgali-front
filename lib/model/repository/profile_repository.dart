import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileRepository extends GetxController {
  final supabase = Supabase.instance.client;

  Future<dynamic> createUser(String fname, String lname, String email,
      String phone, String type) async {
    print('start creating user');
    var select = await supabase.from('users').insert({
      'firstName': fname,
      'lastName': lname,
      'email': email,
      'phone': phone,
      'type': type
    }).select();
    print(' user created');
    return select;
  }
}
