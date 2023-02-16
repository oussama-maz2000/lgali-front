import 'package:flutter/material.dart';
import 'package:lgali/utils/global.color.dart';

class RegistrationView extends StatelessWidget {
  const RegistrationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 40),
            Text(
              "Registration",
              style: TextStyle(
                fontSize: 24,
                color: GlobalColor.buttonColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Please enter your information to validate your profile",
              style: TextStyle(
                fontSize: 16,
                color: GlobalColor.textColor,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(height: 20),

            Card(
              elevation: 5,
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
                          style: TextStyle(
                            fontSize: 23,
                          ),
                          autofocus: true,
                          decoration: InputDecoration(
                            hintText: 'Full Name',
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
                          style: TextStyle(fontSize: 23),
                          autofocus: true,
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
                  SizedBox(
                    height: 12,
                  ),
                  SizedBox(
                    width: 360,
                    child: Center(
                      child: Container(
                        child: TextFormField(
                          obscureText: true,
                          style: TextStyle(fontSize: 23),
                          autofocus: true,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            hintStyle: TextStyle(
                                height: 1,
                                fontSize: 20,
                                color: GlobalColor.buttonColor),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  InkWell(
                    onTap: () => {},
                    child: Container(
                      alignment: Alignment.center,
                      height: 55,
                      width: 360,
                      decoration: BoxDecoration(
                        color: GlobalColor.buttonColor,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        'Proceed',
                        style: TextStyle(
                            color: GlobalColor.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 23),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),

          ],
        ),
      ),
    ));
  }
}
