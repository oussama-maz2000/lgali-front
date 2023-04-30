import 'package:get/get.dart';
import 'package:lgali/model/repository/companyRepository.dart';
import 'package:lgali/model/repository/requestRepository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class NotificationController extends GetxController {
  RequestRepository repository = Get.put(RequestRepository());
  CompanyRepository companyRepository = Get.put(CompanyRepository());
  final supabase = Supabase.instance.client;

  var requests = Rx([]);

  @override
  void onInit() async {
    super.onInit();
    listenToChanges();
  }

  @override
  void onReady() async {
    // TODO: implement onReady
    super.onReady();
  }

  void listenToChanges() {
    final subscription = supabase
        .from('depositRequest')
        .stream(primaryKey: ['user_id'])
        .eq("user_id", "eac22d54-635b-48d8-943c-77465cd136e4")
        .listen((List<Map<String, dynamic>> event) async {
          requests.value = await repository
              .getAllRequests("eac22d54-635b-48d8-943c-77465cd136e4");

          requests.value.forEach((element) {
            if (element['cluster'] != -1)
              companyRepository.getCompanyWithCluster(
                  element['cluster'], element['id'].toString());
          });
        });
    subscription.resume();
  }
}
