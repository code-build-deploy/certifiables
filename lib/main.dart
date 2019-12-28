import 'package:flutter/material.dart';

void main(){
  runApp(App());
}

class App extends StatefulWidget{
  @override
  AppState createState() => AppState();
}

class AppState extends State<App>{

  TextEditingController emailController = new TextEditingController();
  TextEditingController usernameController = new TextEditingController();
  TextEditingController wordChainController = new TextEditingController();

  bool theme = true;

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.pinkAccent,
        focusColor: Colors.pinkAccent
      ),
      home: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ClipPath(
                  clipper: Mclipper(),
                  child: Container(
                    height: 370.0,
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0.0, 10.0),
                        blurRadius: 10.0)
                    ]),
                    child: Stack(
                      children: <Widget>[
                        Container(
                          color: Colors.pinkAccent,
                          width: double.infinity,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              height: 50,
                            ),
                            Center(
                              child: Text(
                                "Certifiables",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 32
                                )
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Center(
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24
                    )
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30
                  ),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        autocorrect: false,
                        keyboardType: TextInputType.emailAddress,
                        textCapitalization: TextCapitalization.none,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(
                            color: Colors.pinkAccent
                          )
                        ),
                        controller: emailController,
                      ),
                      SizedBox(height: 12.0),
                      TextField(
                        autocorrect: false,
                        keyboardType: TextInputType.text,
                        textCapitalization: TextCapitalization.none,
                        decoration: InputDecoration(
                          labelText: 'Username',
                          labelStyle: TextStyle(
                            color: Colors.pinkAccent
                          )
                        ),
                        controller: usernameController,
                      ),
                      SizedBox(height: 12.0),
                      TextField(
                        keyboardType: TextInputType.text,
                        textCapitalization: TextCapitalization.none,
                        autocorrect: false,
                        decoration: InputDecoration(
                          labelText: 'Word Chain',
                          labelStyle: TextStyle(
                            color: Colors.pinkAccent
                          )
                        ),
                        controller: wordChainController,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.pinkAccent,
          onPressed: (){},
          child: Icon(
            Icons.chevron_right,
            color: Colors.white,
          ),
        ),
      )
    );
  }
}

class Mclipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, size.height - 150.0);

    var controlpoint = Offset(80.0, size.height);
    var endpoint = Offset(size.width / 1.5, size.height);

    path.quadraticBezierTo(
        controlpoint.dx, controlpoint.dy, endpoint.dx, endpoint.dy);

    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}