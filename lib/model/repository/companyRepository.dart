import 'dart:math';

import 'package:get/get.dart';
import 'package:logging/logging.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../shared/custom_snack_bar.dart';
import '../../shared/global.color.dart';

class CompanyRepository extends GetConnect implements GetxService {
  final supabase = Supabase.instance.client;
  final log = Logger('CompanyRepository');

  Future<List> getCompany(String userID) async {
    var data = new Map();
    List<String> values = [];
    List<dynamic> response = await supabase
        .from('companies')
        .select(
            'company_name,company_phone,company_service,company_description')
        .eq('user_id', userID);
    data = response[0];
    data.forEach((key, value) {
      values.add(value);
    });
    return values;
  }

  Future<List> fetchAllCompanies(int cluster, String serviceType) async {
    List<dynamic> response = await supabase
        .from('companies')
        .select(
            'user_id,company_name,company_phone,company_service,company_description')
        .eq('cluster', cluster)
        .eq('company_service', serviceType);

    return response;
  }

  Future<void> getCompanyWithCluster(
      int cluster, String requestID, String serviceType) async {
    log.info(cluster);
    log.info(requestID);
    log.info(serviceType);

    List<String> values = [];
    try {
      await supabase
          .from('companies')
          .update({'demand_user_id': requestID}).eq('cluster', cluster);
    } catch (e) {
      print(e);
    }
  }

  void listenToChanges() {
    List<dynamic> requestID = [];
    final subscription = supabase
        .from('companies')
        .stream(primaryKey: ['user_id'])
        .eq("user_id", "eac22d54-635b-48d8-943c-77465cd136e4")
        .listen((List<Map<String, dynamic>> event) async {
          print('you have notification of service from ${event[0]['user_id']}');
        });
    subscription.resume();
  }

  Future<String> getRequestIdFromCompany(id) async {
    List<dynamic> values = [];

    try {
      values = await supabase.from('companies').select('*').eq('id', id);
      return values[0]['demand_user_id'];
    } catch (e) {
      print(e);
    }
    return values[0]['demand_user_id'];
  }

  Future<dynamic> getDemandRequestId() async {
    List<dynamic> demandRequestId = await supabase
        .from('companies')
        .select("demand_user_id")
        .eq('user_id', "eac22d54-635b-48d8-943c-77465cd136e4");
    return demandRequestId[0]['demand_user_id'];
  }

  Future<void> getCmpWithId(String id) async {
    List<dynamic> company =
        await supabase.from('companies').select('*').eq('user_id', id);
    print(company);
  }
}
