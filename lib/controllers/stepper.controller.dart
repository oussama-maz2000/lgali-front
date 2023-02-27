import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:lgali/screens/dashbord.view.dart';
import 'package:lgali/screens/profil.view.dart';
import 'package:selectable_container/selectable_container.dart';

import 'package:lgali/model/repository/profileRepository.dart';

import '../utils/global.color.dart';

class StepperController extends GetxController {
  var box = Hive.box('user');
  final _repository = Get.put(ProfileRepository());

  final _services = ["doctor", "farmer", "pharmacies", "painter"];

  TextEditingController userFirstNameController = TextEditingController();
  TextEditingController userLastNameController = TextEditingController();
  TextEditingController userPhoneController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();
  TextEditingController companyPhoneController = TextEditingController();
  TextEditingController companyDescriptionController = TextEditingController();

  var currentStep = 0.obs;
  var proController = false.obs;
  var prtController = true.obs;
  var firstNameValid = false.obs;
  var lastNameValid = false.obs;
  var phoneValid = false.obs;
  var companyNameValid = false.obs;
  var companyPhoneValid = false.obs;
  var selected = ''.obs;
  var result = [].obs;

  Widget userInfo() {
    return Container(
        child: Column(
      children: [
        Container(
          alignment: Alignment.center,
          child: Text(
            "User Profil",
            style: TextStyle(
              fontSize: 30,
              color: GlobalColor.buttonColor,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        SizedBox(height: 10),
        Container(
          margin: EdgeInsets.only(left: 30, right: 30),
          child: Text(
            "Please enter your information to validate your profile",
            style: TextStyle(fontSize: 18, color: GlobalColor.textColor),
          ),
        ),
        SizedBox(height: 20),
        Card(
          elevation: 0,
          color: GlobalColor.cardColor,
          child: Column(
            children: [
              SizedBox(
                height: 15,
                width: double.infinity,
              ),
              SizedBox(
                width: 360,
                child: Center(
                  child: Container(
                    child: TextFormField(
                      controller: userFirstNameController,
                      onChanged: (value) {
                        if (value.length > 3) {
                          firstNameValid.value = true;
                        } else {
                          firstNameValid.value = false;
                        }
                      },
                      style: TextStyle(
                        fontSize: 23,
                      ),
                      decoration: InputDecoration(
                        hintText: 'First Name',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        hintStyle: TextStyle(
                            height: 1,
                            fontSize: 20,
                            color: GlobalColor.buttonColor),
                      ),
                      keyboardType: TextInputType.name,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              SizedBox(
                width: 360,
                child: Center(
                  child: Container(
                    child: TextFormField(
                      controller: userLastNameController,
                      onChanged: (value) {
                        if (value.length > 3) {
                          lastNameValid.value = true;
                        } else {
                          lastNameValid.value = false;
                        }
                      },
                      style: TextStyle(fontSize: 23),
                      decoration: InputDecoration(
                        hintText: 'Last Name',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        hintStyle: TextStyle(
                            height: 1,
                            fontSize: 20,
                            color: GlobalColor.buttonColor),
                      ),
                      keyboardType: TextInputType.name,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              SizedBox(
                width: 360,
                child: Center(
                  child: Container(
                    child: TextFormField(
                      controller: userPhoneController,
                      onChanged: (value) {
                        if (value.length == 10) {
                          if (value.startsWith('07') ||
                              value.startsWith('05') ||
                              value.startsWith('06')) {
                            phoneValid.value = true;
                          }
                        } else {
                          phoneValid.value = false;
                        }
                      },
                      style: TextStyle(fontSize: 23),
                      decoration: InputDecoration(
                        hintText: 'Phone Number',
                        suffix: Text('+213'),
                        suffixStyle: TextStyle(fontSize: 17),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        hintStyle: TextStyle(
                            height: 1,
                            fontSize: 20,
                            color: GlobalColor.buttonColor),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 16,
        ),
      ],
    ));
  }

  Widget userType() {
    return Container(
        child: Column(children: [
      SizedBox(
        height: 10,
      ),
      Container(
          child: Text(
        "Type of Account",
        style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: GlobalColor.buttonColor),
      )),
      SizedBox(
        height: 4,
      ),
      Container(
          margin: EdgeInsets.only(left: 25),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              'Choose the type of your account, if you have company/profession select professional',
              style: TextStyle(fontSize: 18, color: GlobalColor.textColor),
            ),
          )),
      SelectableContainer(
          selected: prtController.value,
          onValueChanged: (value) {
            prtController.value = true;
            proController.value = false;
            //  data.storage.write('userType', 'prt');
          },
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Card(
              elevation: 0,
              color: GlobalColor.cardColor,
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/prt.png'),
                radius: 45,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  'I am a particular',
                  style: TextStyle(
                      color: GlobalColor.buttonColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Find a service online, access',
                  style: TextStyle(
                      color: GlobalColor.textColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w300),
                ),
                SizedBox(
                  height: 1,
                ),
                Text(
                  ' companies and more',
                  style: TextStyle(
                      color: GlobalColor.textColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w300),
                ),
              ],
            )
          ])),
      SizedBox(
        height: 20,
      ),
      SelectableContainer(
          selected: proController.value,
          onValueChanged: (value) {
            proController.value = true;
            prtController.value = false;

            //data.storage.write('userType', 'pro');
          },
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Card(
              elevation: 0,
              color: GlobalColor.cardColor,
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/pro.png'),
                radius: 45,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  'I am a professional',
                  style: TextStyle(
                      color: GlobalColor.buttonColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'The easiest way to raise',
                  style: TextStyle(
                      color: GlobalColor.textColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w300),
                ),
                SizedBox(
                  height: 1,
                ),
                Text(
                  ' your service online',
                  style: TextStyle(
                      color: GlobalColor.textColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w300),
                ),
              ],
            )
          ])),
    ]));
  }

  Widget companyInfo() {
    return Container(
        child: Column(
      children: [
        Container(
          alignment: Alignment.center,
          child: Text(
            "Company Profil",
            style: TextStyle(
              fontSize: 30,
              color: GlobalColor.buttonColor,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        SizedBox(height: 10),
        Container(
          margin: EdgeInsets.only(left: 35, right: 30),
          child: Text(
            "Please enter your information to "
            "validate your company",
            style: TextStyle(
              fontSize: 18,
              color: GlobalColor.textColor,
            ),
          ),
        ),
        SizedBox(height: 20),
        Card(
          elevation: 0,
          color: GlobalColor.cardColor,
          child: Column(
            children: [
              SizedBox(
                height: 15,
                width: double.infinity,
              ),
              SizedBox(
                width: 360,
                child: Center(
                  child: Container(
                    child: TextFormField(
                      controller: companyNameController,
                      onChanged: (value) {
                        if (value.length > 3) {
                          companyNameValid.value = true;
                        } else {
                          companyNameValid.value = false;
                        }
                      },
                      style: TextStyle(
                        fontSize: 23,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Company Name',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        hintStyle: TextStyle(
                            height: 1,
                            fontSize: 20,
                            color: GlobalColor.buttonColor),
                      ),
                      keyboardType: TextInputType.name,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              SizedBox(
                width: 360,
                child: Center(
                  child: Container(
                    child: TextFormField(
                      controller: companyPhoneController,
                      onChanged: (value) {
                        if (value.length == 10) {
                          if (value.startsWith('07') ||
                              value.startsWith('05') ||
                              value.startsWith('06')) {
                            companyPhoneValid.value = true;
                          }
                        } else {
                          companyPhoneValid.value = false;
                        }
                      },
                      style: TextStyle(fontSize: 23),
                      decoration: InputDecoration(
                        hintText: 'Company Phone Number',
                        suffix: Text('+213'),
                        suffixStyle: TextStyle(fontSize: 17),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        hintStyle: TextStyle(
                            height: 1,
                            fontSize: 20,
                            color: GlobalColor.buttonColor),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }

  Widget companyTypeService() {
    return Container(
      child: Column(
        children: [
          Container(
              child: Text(
            'Company type',
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: GlobalColor.buttonColor),
          )),
          SizedBox(
            height: 30,
          ),
          DropdownButtonFormField(
            elevation: 0,
            items: _services
                .map((e) => DropdownMenuItem(
                      child: Text(
                        e,
                        style: TextStyle(
                            fontSize: 23,
                            color: GlobalColor.buttonColor,
                            fontWeight: FontWeight.w400),
                      ),
                      value: e,
                    ))
                .toList(),
            onChanged: (value) {
              selected.value = value!;
            },
            icon: Icon(
              Icons.arrow_drop_down_rounded,
              color: Color.fromARGB(255, 219, 221, 222),
              size: 40,
            ),
            dropdownColor: GlobalColor.cardColor,
            decoration: InputDecoration(
              hintText: 'Service Type',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              hintStyle: TextStyle(
                  height: 1, fontSize: 20, color: GlobalColor.buttonColor),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: TextFormField(
              controller: companyDescriptionController,
              maxLines: 2,
              onChanged: (value) {},
              style: TextStyle(
                fontSize: 23,
              ),
              decoration: InputDecoration(
                hintText: 'Describe your company',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                hintStyle: TextStyle(
                    height: 1, fontSize: 20, color: GlobalColor.buttonColor),
              ),
              keyboardType: TextInputType.name,
            ),
          ),
        ],
      ),
    );
  }

  Widget descriptionApp() {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Text(
            'App description',
            style: TextStyle(
                color: GlobalColor.mainColor,
                fontSize: 30,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.all(8),
            child: Text(
              "lgali it's simple application that allow you to subscribe as simple user or like pro user which means"
              " that if you are simple user you will just discover the service that you want and send request if you need "
              "something , and with pro user you will offer your service in our application and the users will find you "
              "plus of that will contact you if they need you ",
              style: TextStyle(fontSize: 20, color: GlobalColor.textColor),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () async => {
              box.putAll({
                'firstName': userFirstNameController.value.text,
                'lastName': userLastNameController.value.text,
                'phone': userPhoneController.value.text,
              }),
              if (prtController.value)
                {
                  box.put('type', 'particular'),
                  result.add(await _repository.createUser(
                      box.get('id'),
                      userFirstNameController.value.text,
                      userLastNameController.value.text,
                      box.get('email'),
                      userPhoneController.value.text,
                      'particular')),
                  result.isEmpty
                      ? EasyLoading.show(status: 'wait please...')
                      : {Get.to(() => ProfilScreen())},
                }
              else if (proController.value)
                {
                  box.putAll({
                    'type': 'professional',
                    'companyName': companyNameController.value.text,
                    'companyPhone': companyPhoneController.value.text,
                    'companyService': selected.value,
                    'companyDescription':
                        companyDescriptionController.value.text
                  }),
                  result.add(await _repository.createUserWithCompany(
                      box.get('id'),
                      userFirstNameController.value.text,
                      userLastNameController.value.text,
                      box.get('email'),
                      userPhoneController.value.text,
                      'professional',
                      companyNameController.value.text,
                      companyPhoneController.value.text,
                      selected.value,
                      companyDescriptionController.value.text)),
                  result.isEmpty
                      ? EasyLoading.show(status: 'wait please...')
                      : {Get.to(() => DashBordScreen())},
                },
            },
            child: Container(
              alignment: Alignment.center,
              height: 55,
              width: 280,
              decoration: BoxDecoration(
                color: GlobalColor.validColor,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                'Create',
                style: TextStyle(
                    color: GlobalColor.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 23),
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool isCompletedStep() {
    if (currentStep.value == 0) {
      if (firstNameValid.value && lastNameValid.value && phoneValid.value) {
        print('validate');
        print(currentStep.value);
        return true;
      } else
        return false;
    }
    if (currentStep.value == 1) {
      if (prtController.value) {
        print('validate');
        print(currentStep.value);
        currentStep.value = 3;
        return true;
      } else if (proController.value) {
        return true;
      }
      return false;
    }
    if (currentStep.value == 2) {
      if (companyNameValid.value &&
          companyPhoneValid.value &&
          proController.value) {
        print('validate');
        print(currentStep.value);
        return true;
      } else
        return false;
    }
    if (currentStep.value == 3) {
      if (selected.value.isNotEmpty && proController.value) {
        print('validate');
        print(currentStep.value);
        return true;
      } else
        return false;
    }

    return false;
  }
}
