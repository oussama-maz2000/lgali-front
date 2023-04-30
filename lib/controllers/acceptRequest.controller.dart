import 'package:get/get.dart';
import 'package:lgali/model/repository/companyRepository.dart';
import 'package:lgali/model/repository/requestRepository.dart';
import 'package:logging/logging.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'dart:developer';

class AcceptController extends GetxController {
  RequestRepository repository = Get.put(RequestRepository(), permanent: false);
  CompanyRepository companyRepository =
      Get.put(CompanyRepository(), permanent: false);
/*   var requestRepository = Get.lazyPut(() => RequestRepository());
  RequestRepository repository = Get.find<RequestRepository>();

  var companies = Get.lazyPut(() => CompanyRepository());
  CompanyRepository companyRepository = Get.find<CompanyRepository>();*/
  final supabase = Supabase.instance.client;

  var requests = Rx([]);

  @override
  void onInit() async {
    super.onInit();
    listenToChanges();
  }

  void listenToChanges() {
    final subscription = supabase
        .from('depositRequest')
        .stream(primaryKey: ['user_id'])
        .eq("user_id", "48b1256c-0da0-4e34-a09c-d1dd5ae93fe0")
        .listen((List<Map<String, dynamic>> event) async {
          requests.value = await repository
              .getAllRequests("48b1256c-0da0-4e34-a09c-d1dd5ae93fe0");

          requests.value.forEach((element) {
            if (element['cluster'] != -1)
              companyRepository.getCompanyWithCluster(element['cluster'],
                  element['id'].toString(), element['serviceType']);
          });
        });
    subscription.resume();
  }
}
