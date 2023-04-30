import 'package:get/get.dart';
import 'package:lgali/model/repository/companyRepository.dart';
import 'package:lgali/model/repository/requestRepository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ServiceCompanyController extends GetxController {
  CompanyRepository companyRepository = Get.put(CompanyRepository());
  RequestRepository requestRepository = Get.put(RequestRepository());
  final supabase = Supabase.instance.client;

  @override
  void onInit() {
    super.onInit();
    final subscription = supabase
        .from('companies')
        .stream(primaryKey: ['user_id'])
        .eq("user_id", "eac22d54-635b-48d8-943c-77465cd136e4")
        .listen((List<Map<String, dynamic>> event) async {
          if (event[0]['demand_user_id'] == '') {
            print('empty service for work');
          } else
            await requestRepository
                .getSpecificRequest(event[0]['demand_user_id']);
        });
    subscription.resume();
  }

  @override
  void onReady() {
    super.onReady();
    try {
      print('from service company controller');
      // print(requestRepository.getSpecificRequest());
    } catch (e) {
      print(e);
    }
  }
}
