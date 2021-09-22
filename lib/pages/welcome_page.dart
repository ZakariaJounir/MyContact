import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Text(
                "Bienvenue dans votre espace clients",
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.black87
                ),
              ),
              const SizedBox(height: 10),
              FittedBox(
                child: Image.asset("assets/images/bienvenue_img.png"),
                fit: BoxFit.fitWidth,

              ),
              boxItem("assets/icons/services_icon.png","MES SERVICES",Colors.lightBlue.shade700),
              boxItem("assets/icons/dossiers_icon.png","MES DOSSIERS DE PARTICIPATION",Colors.lightBlue.shade700),
              boxItem("assets/icons/remboursements_icon.png","MES REMBOURSEMENTS",Colors.lightBlue.shade700),
              boxItem("assets/icons/informations_icon.png","MES INFORMATIONS",Colors.lightBlue.shade900),
              boxItem("assets/icons/modalites_icon.png","MODALITÉS-CGU",Colors.lightBlue.shade900),


            ],
          ),
        )
    );

  }
}
Widget boxItem(String imgSrc, String title, Color color){
  return Container(
    padding: const EdgeInsets.all(10),
    margin: const EdgeInsets.only(left: 20,top: 4,right: 20,bottom:10),
    decoration: BoxDecoration(

      borderRadius: BorderRadius.circular(10.0),
      color: color,
    ),

    child: Column(

      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          height: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                image: AssetImage(imgSrc)
            ),
          ),
        ),
        Text(title,
          style: const TextStyle(color:Colors.white,fontSize: 20),
        ),
      ],
    ),
  );
}
