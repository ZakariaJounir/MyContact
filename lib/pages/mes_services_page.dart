import 'package:flutter/material.dart';

class MesServicesPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                color: Colors.lightBlue.shade800,
                margin: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                height: 40,
                width: double.infinity,
                child: Text(
                  "SERVICES RÉALISÉS",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),

              ),
              Column(
                children: [
                  Text("Manipulation",
                    style: TextStyle(
                        color: Colors.lightBlue.shade800,
                        fontSize: 26
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    height: 300,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/icons/coupon1.png')
                      ),
                    ),
                  ),
                  Text("DATE D'UTILISATION:30 AOÚT 2020",
                    style: TextStyle(
                        color: Colors.lightBlue.shade800,
                        fontSize: 16
                    ),
                  ),
                  btnWidget(),
                  Text("Confort",
                    style: TextStyle(
                        color: Colors.lightBlue.shade800,
                        fontSize: 24
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    height: 300,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/icons/coupon2.png')
                      ),
                    ),
                  ),
                  Text("DATE D'UTILISATION: 13 FÉFRIER 2021",
                    style: TextStyle(
                        color: Colors.lightBlue.shade800,
                        fontSize: 16
                    ),
                  ),
                  btnWidget()
                ],

              ),
            ],
          ),
        )
    );
  }
}
Widget btnWidget(){
  return Container(
    height: 30,
    width: 240,
    margin: EdgeInsets.all(10),
    alignment: Alignment.center,
    child: Text(
      "JE DONNE MON AVIS",
      style: TextStyle(
          color: Colors.lightBlue.shade800,
          fontSize: 20
      ),
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(26),
      border: Border.all(
        color: Colors.lightBlue.shade800,
        width: 2,
      ),

    ),
  );
}