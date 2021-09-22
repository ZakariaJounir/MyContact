import 'package:flutter/material.dart';


class MyDrawerHeader extends StatefulWidget {
  const MyDrawerHeader({Key? key}) : super(key: key);

  @override
  _MyDrawerHeaderState createState() => _MyDrawerHeaderState();
}

class _MyDrawerHeaderState extends State<MyDrawerHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlue.shade700,
      width: double.infinity,
      height:200 ,
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            height: 80,
            decoration: BoxDecoration(
              shape:BoxShape.circle,
              image: DecorationImage(
              image: AssetImage('assets/images/profile.jpg')
              ),
            ),
          ),
          Text("Bonjour Name ",style: TextStyle(color:Colors.white,fontSize: 20),),
          Text(" fullname@example.com ",style: TextStyle(color:Colors.grey[200],fontSize: 14),),
        ],
      ),
    );
  }
}
