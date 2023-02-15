import 'package:flutter/material.dart';
import 'package:lgali/utils/global.color.dart';

class UserView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(

      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: Container(
          height: 120,
        decoration:  BoxDecoration(
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(8),bottomLeft: Radius.circular(8)),
     color: GlobalColor.mainColor,
        ),
          child: SafeArea(
            child: Center(
              child: Text("Register",
              style: TextStyle(
                fontSize: 40,
                color: Colors.white
              ),
              ),
            ),
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(7),
        child: Column(
          children: [
            CircleAvatar(
              child: IconButton(
                onPressed: (){},
                icon: Icon(Icons.add_a_photo),
              ),
            radius: 40,
            //backgroundImage: AssetImage('assets/images/person.jpeg')
            ),
      SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
            hintText: 'First Name',
        labelStyle: TextStyle(
            color: GlobalColor.textColor,
            fontSize: 18,
            fontWeight: FontWeight.w600),
          border: OutlineInputBorder()  ),
              keyboardType: TextInputType.name,
            ),
            SizedBox(height:10 ),
            TextFormField(
              decoration: InputDecoration(
                  hintText: 'Last Name',
                  labelStyle: TextStyle(
                      color: GlobalColor.textColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                  border: OutlineInputBorder()  ),
              keyboardType: TextInputType.name,
            ),
            SizedBox(height:10 ),
            TextFormField(
              decoration: InputDecoration(
                  hintText: 'Phone Number',
                  labelStyle: TextStyle(
                      color: GlobalColor.textColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                  border: OutlineInputBorder()  ),
              keyboardType: TextInputType.name,
            ),
            SizedBox(height:10 ),
            TextFormField(
              decoration: InputDecoration(
                  hintText: 'Oussama@gmail.com',
                  labelStyle: TextStyle(
                      color: GlobalColor.textColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                  border: OutlineInputBorder()  ),
              keyboardType: TextInputType.name,
            ),
            SizedBox(height: 50,),
            InkWell(
              onTap: () => {},
              child: Container(
                alignment: Alignment.center,
                height: 55,
                decoration: BoxDecoration(
                    color: GlobalColor.mainColor,
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: [
                      BoxShadow(
                        color: GlobalColor.mainColor.withOpacity(0.7),
                        blurRadius: 10,
                      )
                    ]),
                child: Text(
                  'Valid',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),

    ));
  }
}
