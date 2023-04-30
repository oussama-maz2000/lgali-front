import 'package:get/get.dart';
import 'package:lgali/model/repository/companyRepository.dart';

class DisplayCompanyInfoController extends GetxController {
  // final CompanyRepository _companyRepository = Get.put(CompanyRepository());
  final _companyRepository = Get.put(CompanyRepository());
  var data = Get.arguments;
  var values = Rx([]);
  var type = ''.obs;

  @override
  void onInit() async {
    super.onInit();
    values.value = await _companyRepository.getCompany(data);
    type.value = values.value[2];
  }

  @override
  void onClose() {
    super.onClose();
    _companyRepository.dispose();
  }
}
