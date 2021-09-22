import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MesOffresPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return buildListView();
  }
}

ListView buildListView(){
  return ListView.builder(
      itemCount: 10,
      itemBuilder: (_,index){
        return ListItem("assets/images/offre2.JPG", "40 EURO");
      });
}

Widget ListItem(String imgSrc, String price ){
  return Card(
      child: Center(child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            height: 300,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(imgSrc)
              ),
            ),
          ),
          Text(price)
        ],
      ),
      )
  );
}

