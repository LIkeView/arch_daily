import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'Activity/MainScreen.dart';
import 'Animation/FadeAnimation.dart';
import 'Model/ApiResponse.dart';
import 'package:http/http.dart' as http;

void main() => runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    )
);

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}
Future<ApiResponse> createUser(String name, String jobTitle) async{
  final String apiUrl = "http://www.eatfresh.cc/arch_daily/api/login";

  final response = await http.post(apiUrl, body: {
    "email_or_phones": name,
    "password": jobTitle
  });

  if(response.statusCode == 200){
    final String responseString = response.body;

    return apiResponseFromJson(responseString);
  }else{
    return null;
  }
}

class _LoginPageState extends State<LoginPage> {
  ApiResponse _apiResponse;

  final TextEditingController email_phone_control = TextEditingController();
  final TextEditingController passController = TextEditingController();

  Widget _submitButton() {
    return InkWell(
      onTap: () async {
        final String name = email_phone_control.text;
        final String jobTitle = passController.text;
        final ApiResponse apiResponse = await createUser(name, jobTitle);
        setState(() {
          _apiResponse = apiResponse;
        });
        if (apiResponse.resCode == 1) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MainScreen()));
          Toast.show(
              apiResponse.resMessage, context, duration: Toast.LENGTH_SHORT,
              gravity: Toast.BOTTOM);
        }
        else {
          Toast.show(
              apiResponse.resMessage, context, duration: Toast.LENGTH_SHORT,
              gravity: Toast.BOTTOM);
        }
      },
      child: Container(
        width: MediaQuery
            .of(context)
            .size
            .width,
        padding: EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.shade200,
                  offset: Offset(2, 4),
                  blurRadius: 5,
                  spreadRadius: 2)
            ],
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color.fromRGBO(143, 148, 251, 1),
                  Color.fromRGBO(143, 148, 251, .6),
                ]
            )),
        child: Text(
          'Login',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Container(
              child: Column(
                children: <Widget>[
                  Container(
                    height: 400,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/background.png'),
                            fit: BoxFit.fill
                        )
                    ),
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          left: 30,
                          width: 80,
                          height: 200,
                          child: FadeAnimation(1, Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/light-1.png')
                                )
                            ),
                          )),
                        ),
                        Positioned(
                          left: 140,
                          width: 80,
                          height: 150,
                          child: FadeAnimation(1.3, Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/light-2.png')
                                )
                            ),
                          )),
                        ),
                        Positioned(
                          right: 40,
                          top: 40,
                          width: 80,
                          height: 150,
                          child: FadeAnimation(1.5, Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/images/clock.png')
                                )
                            ),
                          )),
                        ),
                        Positioned(
                          child: FadeAnimation(1.6, Container(
                            margin: EdgeInsets.only(top: 50),
                            child: Center(
                              child: Text("Arch Daily", style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold),),
                            ),
                          )),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(30.0),
                    child: Column(
                      children: <Widget>[
                        FadeAnimation(1.8, Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromRGBO(143, 148, 251, .2),
                                    blurRadius: 20.0,
                                    offset: Offset(0, 10)
                                )
                              ]
                          ),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(
                                        color: Colors.grey[100]))
                                ),
                                child: TextField(
                                  controller: email_phone_control,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Email or Phone number",
                                      hintStyle: TextStyle(
                                          color: Colors.grey[400])
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(8.0),
                                child: TextField(
                                  controller: passController,

                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Password",
                                      hintStyle: TextStyle(
                                          color: Colors.grey[400])
                                  ),
                                ),
                              )
                            ],
                          ),
                        )),
                        SizedBox(height: 30,),
                        _submitButton(),
//                        FadeAnimation(2,
//                            Container(
//                              height: 50,
//                              decoration: BoxDecoration(
//                                  borderRadius: BorderRadius.circular(10),
//                                  gradient: LinearGradient(
//                                      colors: [
//                                        Color.fromRGBO(143, 148, 251, 1),
//                                        Color.fromRGBO(143, 148, 251, .6),
//                                      ]
//                                  )
//                              ),
//                              child: Center(
//                              ),
//                            )),
                        SizedBox(height: 70,),
                        FadeAnimation(1.5, Text("Forgot Password?",
                          style: TextStyle(
                              color: Color.fromRGBO(143, 148, 251, 1)),)),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
      );
  }
}