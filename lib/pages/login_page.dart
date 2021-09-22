
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_apptest/ProgressHUD.dart';
import 'package:flutter_apptest/api/login_api_service.dart';
import 'package:flutter_apptest/model/login_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'main_screen.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool hidePassword = true;
  bool isApiCallProcess = false;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  LoginRequestModel loginRequestModel = LoginRequestModel(email: '', password: '');
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
  
  // loginRequestModel =  LoginRequestModel(password: '', email: '');
  }


  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
        key: const Key("u"),
        child: _uiSetup(context),
        inAsyncCall: isApiCallProcess,
        opacity: 0.3,
      valueColor: const AlwaysStoppedAnimation<Color>(Colors.blueAccent),
    );
  }

  Widget _uiSetup(BuildContext context) {
    return Scaffold(
        body:AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light,
            child: Stack(
            children: <Widget>[
            Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
            gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
            Color(0xFF6CA8F1),
            Color(0xFF274046)
        ]
    )
    ),
      key: scaffoldKey,
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 120),
            const Text(
                "BIENVENUE SUR MYCONTACT",
                style:TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                )
            ),
            const Text(
                "Votre programme de fidélite ACUVUE",
                style:TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                )
            ),
            Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,

                  padding: const EdgeInsets.only(left:40,bottom: 300,top: 60,right: 40),
                  margin:  const EdgeInsets.symmetric(vertical: 35, horizontal: 0),

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,

                    boxShadow: [
                      BoxShadow(
                          color: Theme.of(context).hintColor.withOpacity(0.2),
                          offset: const Offset(0, 10),
                          blurRadius: 20)
                    ],
                  ),
                  child: Form(
                    key: globalFormKey,
                    child: Column(
                      children: <Widget>[
                        //const SizedBox(height: 25),
                        Text(
                          "IDENTIFIEZ-VOUS",
                          style: TextStyle(
                                     fontSize: 24.0,
                                     fontWeight: FontWeight.w700,
                                     color: Colors.lightBlue.shade800,
                          ),
                        ),
                        const SizedBox(height: 30),
                        buildEmailField(),
                        const SizedBox(height: 20),
                        buildPasswordField(),
                        buildForgotPassBtn(),
                        const SizedBox(height: 10),
                        buildLoginBtn(),
                        const SizedBox(height: 5),
                        const Text("Je N'ai pas encore de compte MyContact"),
                        buildRegisterBtn(),
                       
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
    ]
    ),
    ),
    );
  }
  
  Widget buildEmailField(){
    return TextFormField(
        style:
        TextStyle(color: Colors.lightBlue.shade800),
        keyboardType: TextInputType.emailAddress,
        onSaved: (input) => loginRequestModel.email = input!,

        decoration:  InputDecoration(
          hintText: "LOGIN",
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.lightBlue.shade800
                      .withOpacity(0.2))),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.lightBlue.shade800
              )
          ),
          prefixIcon: Icon(
            Icons.email,
            color: Colors.lightBlue.shade800,
          ),
        ),
      );
  }
  
  Widget buildPasswordField(){
  return TextFormField(
        style:
        TextStyle(color: Colors.lightBlue.shade800),
        keyboardType: TextInputType.text,
        onSaved: (input) =>
        loginRequestModel.password = input!,
        // validator: (input) => input!.length < 3
        //     ? "Password should be more than 3 characters"
        //     : null,
        obscureText: hidePassword,
        decoration:  InputDecoration(
          hintText: "MOT DE PASSE",
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.lightBlue.shade800
                      .withOpacity(0.2))),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.lightBlue.shade800)),
          prefixIcon: Icon(
            Icons.lock,
            color: Colors.lightBlue.shade800,
          ),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                hidePassword = !hidePassword;
              });
            },
            color: Colors.lightBlue.shade800
                .withOpacity(0.4),
            icon: Icon(hidePassword
                ? Icons.visibility_off
                : Icons.visibility),
          ),
        ),
      );
  }

  Widget buildLoginBtn(){
        return FlatButton(
        padding: EdgeInsets.symmetric(
            vertical: 12, horizontal: 80),
        onPressed: () {
          if (validateAndSave()) {
            print(loginRequestModel.toJson());
            setState(() {
              isApiCallProcess = true;
            });

            APIService apiService = new APIService();
            apiService.login(loginRequestModel).then((value) {
              if (value != null) {
                setState(() {
                  isApiCallProcess = false;
                });

                if (value.token.isNotEmpty) {
                
                  Navigator.push(context, MaterialPageRoute(builder: (context) => new MainScreen()));

                } else {
                  Fluttertoast.showToast(
                      msg: "User not found",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.blueAccent,
                      textColor: Colors.white,
                      fontSize: 16.0
                  );

                }
              }
            });
          }
        },
        child: Text(
          "C'EST PARTI!",
          style: TextStyle(color: Colors.white),
        ),
        color: Colors.lightBlue.shade800,
        shape: StadiumBorder(),
      );
  }

  Widget buildForgotPassBtn(){
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: () => print("Forgot Password Pressed"),
        padding:EdgeInsets.only(right: 0),
        child: Text(
          "Identifiant ou mot de passe oublié?",
          style: TextStyle(
              color: Colors.lightBlue.shade800,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
  
  Widget buildRegisterBtn(){
    return Container(
      alignment: Alignment.center,
      child: FlatButton(
        onPressed: () => print("register new account"),
       // padding:EdgeInsets.only(right: 0),
        child: Text(
          "Je M'inscrire",
          style: TextStyle(
              color: Colors.lightBlue.shade800,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
  
  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (globalFormKey.currentState!.validate()) {
      globalFormKey.currentState!.save();
      return true;
    }
    return false;
  }
}

