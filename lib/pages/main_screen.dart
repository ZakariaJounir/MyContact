// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_apptest/pages/login_page.dart';
import 'package:flutter_apptest/pages/welcome_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'mes_information_page.dart';
import 'mes_services_page.dart';
import 'mes_offres_page.dart';
import 'mes_dossiers_page.dart';
import 'my_drawer_header.dart';

void main() {
  runApp(const MainScreen());
}

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'My Contact'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var currentPage = DrawerSections.WelcomePage;
  String token = "";  
  
  @override
  void initState() {
    super.initState();
    getCred();
  }

  void getCred() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      token = pref.getString("login")!;
    });
  }
  @override
  Widget build(BuildContext context) {

    var container;
    if(currentPage == DrawerSections.WelcomePage){
      container = WelcomePage();
    }else if(currentPage == DrawerSections.MesInformations){
      container = MesInformationsPage();
    }else if(currentPage == DrawerSections.MesServices){
      container = MesServicesPage();
    }else if(currentPage == DrawerSections.MesOffres){
      container = MesOffresPage();
    }else if(currentPage == DrawerSections.MesDossiers){
      container = MesDossiersPage();
    }
    return Scaffold(
      appBar: AppBar(
     
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                const MyDrawerHeader(),
                MyDrawerList(),
              ],
            ),
          ),
        ),
      ),
      body: container,
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }


  // ignore: non_constant_identifier_names
  Widget MyDrawerList() {
    return Container(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        children: [
          menuItem(1, "MES INFORMATIONS", Icons.info_sharp,
              currentPage == DrawerSections.MesInformations ? true : false),
          menuItem(2, "MES SERVICE", Icons.design_services,
              currentPage == DrawerSections.MesServices ? true : false),
          menuItem(3, "MES OFFRES", Icons.sell,
              currentPage == DrawerSections.MesOffres ? true : false),
          menuItem(4, "MES DEOSSIERS DE PARTICIPATION", Icons.folder_open,
              currentPage == DrawerSections.MesDossiers ? true : false),
          menuItem(5, "DÉCONNEXION", Icons.logout,
              currentPage == DrawerSections.Deconnexion ? true : false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected? Colors.lightBlueAccent : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if(id == 1){
              currentPage = DrawerSections.MesInformations;
            }else if(id == 2){
              currentPage = DrawerSections.MesServices;
            }else if(id == 3){
              currentPage = DrawerSections.MesOffres;
            }else if(id == 4){
              currentPage = DrawerSections.MesDossiers;
            }else if(id == 5){
              logout();
            
            }
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                  child: Icon(
                    icon,
                    size: 20,
                    color: Colors.black,
                  )
              ),
              Expanded(
                  flex: 3,
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
  void logout(){
   Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => LoginPage()),
                   (route) => false);
}
}
enum DrawerSections{
  WelcomePage,
  MesInformations,
  MesServices,
  MesOffres,
  MesDossiers,
  Deconnexion,
}

