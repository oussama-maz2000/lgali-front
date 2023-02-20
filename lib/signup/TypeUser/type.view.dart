import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lgali/company/company.view.dart';
import 'package:lgali/model/credential.model.dart';
import 'package:lgali/signup/registration/registration.view.dart';
import 'package:lgali/signup/TypeUser/type.controller.dart';
import 'package:lgali/utils/global.color.dart';
import 'package:line_icons/line_icons.dart';



class TypeUser extends GetView<TypeController> {
  final _typeCon = Get.put(TypeController());
  final data=Get.put(PersonData());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        child: Stack(
          children: [
            Positioned(
              left: 1,
              right: 340,
              height: 40,
              top: 5,
              child: RawMaterialButton(
                onPressed: () {
                  Get.back();
                },
                elevation: 2.0,
                fillColor: Colors.white,
                child: Icon(LineIcons.arrowLeft, size: 25),
                shape: CircleBorder(),
              ),
            ),
            Positioned(
                top: 75,
                left: 92,
                child: Text(
                  "Type of Account",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: GlobalColor.buttonColor
                  ),
                )),
           Positioned(
               top: 120,
               left: 80,
               right: 80,

               child: Text('Choose the type of your account, be careful to change it impossible',
               style: TextStyle(
                 fontSize: 15,
                 color: GlobalColor.textColor
               ),)),
            Positioned(
                top: 210,
                left: 8,
                child: Container(
                  color: GlobalColor.cardColor,
                  child: InkWell(
                    onTap: (){
                      data.storage.write('usertype', 'particular');
                      Get.to(()=>RegistrationView());
                    },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Card(
                            elevation: 0,
                            color: controller.cardColor,
                            child: CircleAvatar(
                              backgroundImage: AssetImage('assets/images/prt.png'),
                              radius: 65,
                            ),
                          ),
                          SizedBox(
                            width: 20,

                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10,),
                              Text(
                                'I am a particular',
                                style: TextStyle(
                                    color: GlobalColor.buttonColor,
                                    fontSize: 26,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(height: 20,),
                              Text(
                                'Find a service online, access',
                                style: TextStyle(
                                    color: GlobalColor.textColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300),
                              ),
                              SizedBox(height: 1,),
                              Text(
                                ' companies and more',
                                style: TextStyle(
                                    color: GlobalColor.textColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300),
                              ),

                            ],
                          )
                        ],
                      )),
                )),
            Positioned(
                top:380,
                left: 8,
                child: Container(
                  color: GlobalColor.cardColor,
                  child: InkWell(
                      onTap: (){
                        data.storage.write('usertype', 'professional');
                        Get.off(()=>CompanyView());
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Card(
                            elevation: 0,
                            color: controller.cardColor,
                            child: CircleAvatar(
                              backgroundImage: AssetImage('assets/images/pro.png'),
                              radius: 65,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10,),
                              Text(
                                'I am a professional',
                                style: TextStyle(
                                    color: GlobalColor.buttonColor,
                                    fontSize: 26,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(height: 20,),
                              Text(
                                'The easiest way to raise',
                                style: TextStyle(
                                    color: GlobalColor.textColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300),
                              ),
                              SizedBox(height: 1,),
                              Text(
                                ' your service online',
                                style: TextStyle(
                                    color: GlobalColor.textColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300),
                              ),

                            ],
                          )
                        ],
                      )),
                ))
          ],
        ),
      ),
    ));
  }
}
