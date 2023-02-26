import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:hive/hive.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileRepository extends GetxController {
  final supabase = Supabase.instance.client;
  var box = Hive.box('user');

  Future<dynamic> createUser(String user_id, String firstName, String lastName,
      String email, String phone, String type) async {
    print('start creating user');
    var select = await supabase.from('users').insert({
      'user_id': user_id,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'phone': phone,
      'type': type
    }).select();
    print(' user created');
    return select;
  }

  Future<dynamic> createUserWithCompany(
      String user_id,
      String firstName,
      String lastName,
      String email,
      String phone,
      String type,
      String companyName,
      String companyPhone,
      String companyService,
      String? companyDescription) async {
    var user = await supabase.from('users').insert({
      'user_id': user_id,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'phone': phone,
      'type': type
    }).select();
    var company = await supabase.from('companies').insert({
      'user_id': user_id,
      'company_name': companyName,
      'company_phone': companyPhone,
      'company_service': companyService,
      'company_description': companyDescription
    }).select();

    return {user, company};
  }

  Future<void> fetchUser() async {
    var data = new Map();
    List<dynamic> response =
        await supabase.from('users').select('*').eq('user_id', box.get('id'));
    data = response[0];
    box.put('type', data['type']);
    print(data);

    print(box.get('type'));
  }
}
