import 'package:flutter/material.dart';

import 'global.color.dart';

class Categories extends StatelessWidget {
  Widget buildCard(String image, String jobName) => Column(
        children: [
          Container(
            width: 130,
            height: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: GlobalColor.greenColor,
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.fill,
                )),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            jobName,
            style: TextStyle(fontSize: 16),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      child: ListView(
        children: [
          SizedBox(
            width: 5,
          ),
          Column(
            children: [
              Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: GlobalColor.greenColor,
                      image: DecorationImage(
                        image: AssetImage("assets/images/jobs/doctor.jpg"),
                        fit: BoxFit.fill,
                      ))),
              SizedBox(
                height: 5,
              ),
              Text(
                "Doctors",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: GlobalColor.buttonColor,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            children: [
              Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: GlobalColor.greenColor,
                    image: DecorationImage(
                      image: AssetImage("assets/images/jobs/pharmacie.jpg"),
                      fit: BoxFit.fill,
                    )),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "pharmacies",
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            children: [
              Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: GlobalColor.greenColor,
                    image: DecorationImage(
                      image: AssetImage("assets/images/jobs/dentist.jpg"),
                      fit: BoxFit.fill,
                    )),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "dentists",
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            children: [
              Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: GlobalColor.greenColor,
                    image: DecorationImage(
                      image: AssetImage("assets/images/jobs/veterinarian.jpg"),
                      fit: BoxFit.fill,
                    )),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "veterinarians",
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            children: [
              Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: GlobalColor.greenColor,
                    image: DecorationImage(
                      image: AssetImage("assets/images/jobs/babysitter.jpg"),
                      fit: BoxFit.fill,
                    )),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "babysitters",
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            children: [
              Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: GlobalColor.greenColor,
                    image: DecorationImage(
                      image: AssetImage("assets/images/jobs/lawyer.jpg"),
                      fit: BoxFit.fill,
                    )),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "lawyers",
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            children: [
              Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: GlobalColor.greenColor,
                    image: DecorationImage(
                      image: AssetImage("assets/images/jobs/mechanic.jpg"),
                      fit: BoxFit.fill,
                    )),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "mechanics",
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            children: [
              Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: GlobalColor.greenColor,
                    image: DecorationImage(
                      image: AssetImage("assets/images/jobs/plumber.jpg"),
                      fit: BoxFit.fill,
                    )),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "plumbers",
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          SizedBox(
            width: 10,
          ),
        ],
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}


 /*  buildCard("", "doctor"),
    buildCard("", "pharmacie"),
    buildCard("", "dentist"),
    buildCard("", "babysitter"),
    buildCard("assets/images/jobs/veterinarian.png", "veterinarian"),
    buildCard("assets/images/jobs/lawyer.png", "lawyer"),
    buildCard("assets/images/jobs/plumber.png", "plumber"),
    buildCard("assets/images/jobs/mechanic.png", "mechanic"), */