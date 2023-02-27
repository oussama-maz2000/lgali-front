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

  Future<List<String>> fetchUser(String? userID) async {
    var data = new Map();
    var company = new Map();
    List<String> values = [];
    List<dynamic> response = await supabase
        .from('users')
        .select(
            'first_name,last_name,phone,type,email,companies(company_name,company_phone,company_service,company_description)')
        .eq('user_id', '94a474e9-4597-42e6-8159-e1617ec3bfa8');
    data = response[0];
    data['companies'] == null ? null : company = data['companies'];

    data.remove('companies');
    data.forEach((key, value) {
      values.add(value.toString());
    });
    company.forEach((key, value) {
      values.add(value.toString());
    });

    await box.putAll({
      'firstName': data['first_name'],
      'lastName': data['last_name'],
      'phone': data['phone'],
      'type': data['type']
    });
    return values;
  }

  Future<List> fetchAllUsers() async {
    List<dynamic> users = await supabase
        .from('users')
        .select('first_name,last_name,phone,type,email').eq('email', 'loulououssama2015@gmail.com');

    return users;
  }
}
