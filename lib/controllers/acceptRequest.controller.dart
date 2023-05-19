import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:lgali/model/repository/companyRepository.dart';
import 'package:lgali/model/repository/requestRepository.dart';
import 'package:logging/logging.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'dart:developer';

class AcceptController extends GetxController {
  RequestRepository repository = Get.put(RequestRepository(), permanent: false);
  CompanyRepository companyRepository =
      Get.put(CompanyRepository(), permanent: false);
  var box = Hive.box('user');

  final supabase = Supabase.instance.client;

  var requests = Rx([]);

  @override
  void onInit() async {
    super.onInit();
    listenToChanges();
  }

  void listenToChanges() {
    final subscription = supabase
        .from('requests')
        .stream(primaryKey: ['user_id'])
        .eq("user_id", box.get('id'))
        .listen((List<Map<String, dynamic>> event) async {
          requests.value = await repository.getAllRequests(box.get('id'));

          requests.value.forEach((element) {
            if (element['cluster'] != -1)
              companyRepository.getCompanyWithCluster(element['cluster'],
                  element['id'].toString(), element['serviceType']);
          });
        });
    subscription.resume();
  }
}
