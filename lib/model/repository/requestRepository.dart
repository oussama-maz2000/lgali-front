import 'package:get/get.dart';
import 'package:lgali/model/repository/profileRepository.dart';
import 'package:logging/logging.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

import 'companyRepository.dart';

class RequestRepository extends GetConnect implements GetxService {
  final supabase = Supabase.instance.client;
  ProfileRepository profileRepository = Get.put(ProfileRepository());
  CompanyRepository companyRepository = Get.put(CompanyRepository());

  Future<dynamic> createNewRequest(
    String user_id,
    String serviceType,
    String requestDescription,
    double latitude,
    double longitude,
  ) async {
    var request = await supabase.from('depositRequest').insert({
      'user_id': user_id,
      'serviceType': serviceType,
      'requestDescription': requestDescription,
      'latitude': latitude,
      'longitude': longitude,
      'cluster': -1,
      'status': 0
    }).select();
    return request;
  }

  Future<void> uploadRequestInStorage(dynamic file, String path) async {
    await supabase.storage.from('deposit-request-images').uploadBinary(
        path, file,
        fileOptions: const FileOptions(cacheControl: '3600', upsert: false));
  }

  Future<List> getAllRequests(String userID) async {
    List<dynamic> requests =
        await supabase.from('depositRequest').select('*').eq('user_id', userID);
    return requests;
  }

  Future<List> fetchRequest(String id) async {
    List<dynamic> request =
        await supabase.from('depositRequest').select('*').eq('id', id);
    return request;
  }

  Future<void> getSpecificRequest(String requestId) async {
    List value =
        await supabase.from('depositRequest').select('*').eq('id', requestId);

    // await companyRepository.getCmpWithId(value[0]['user_id']);

    /*    print('from request repository');
    print(value); */
  }
}
