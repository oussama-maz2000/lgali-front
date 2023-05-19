import 'package:get/get.dart';
import 'package:lgali/model/repository/requestRepository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ServiceCompanyController extends GetxController {
  static RxList requestData = [].obs;
  final supabase = Supabase.instance.client;

  @override
  void onInit() {
    super.onInit();
  }

  static Future<void> getRequest(String requestId) async {
    requestData.value = await RequestRepository.fetchRequestUser(requestId);
  }
}
