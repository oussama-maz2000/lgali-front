import 'package:get/get.dart';
import 'package:lgali/model/repository/companyRepository.dart';
import 'package:logging/logging.dart';

class DisplayCompaniesRequestController extends GetxController {
  final CompanyRepository _companyRepository = Get.put(CompanyRepository());
  var data = Get.arguments;
  var companies = Rx([]);
  final log = Logger('DisplayCompaniesRequestController');


  @override
  void onInit() async {
  print(data);
    super.onInit();
    companies.value = await _companyRepository.fetchAllCompanies(data[0],data[1]);
  }
}
