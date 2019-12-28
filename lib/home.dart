import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'login.dart';

class Home extends StatefulWidget{

  final name, email, chain;
  Home({this.name, this.email, this.chain});

  @override
  HomeState createState() => HomeState(name: name, email: email, chain: chain);
}

class HomeState extends State<Home>{

  String name, email, chain;
  HomeState({this.name, this.email, this.chain});

  TextEditingController titleController = new TextEditingController();
  TextEditingController peopleController = new TextEditingController();
  TextEditingController awardedController = new TextEditingController();

  void _showDialog(String message) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Incorrect Data"),
          content: new Text("$message"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          InkWell(
            onTap: (){
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (BuildContext context) => LoginScreen())
              );
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              child: Icon(Icons.power_settings_new),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 60,
              ),
              Text(
                "Create Certificate",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black
                ),
              ),
              SizedBox(
                height: 64,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    TextField(
                      autocorrect: false,
                      keyboardType: TextInputType.text,
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration(
                        labelText: 'Title',
                        labelStyle: TextStyle(
                          color: Colors.pinkAccent
                        )
                      ),
                      controller: titleController,
                    ),
                    SizedBox(height: 25.0),
                    TextField(
                      autocorrect: false,
                      keyboardType: TextInputType.text,
                      textCapitalization: TextCapitalization.none,
                      decoration: InputDecoration(
                        labelText: 'People Incharge',
                        labelStyle: TextStyle(
                          color: Colors.pinkAccent
                        )
                      ),
                      controller: peopleController,
                    ),
                    SizedBox(height: 25.0),
                    TextField(
                      keyboardType: TextInputType.text,
                      textCapitalization: TextCapitalization.none,
                      autocorrect: false,
                      decoration: InputDecoration(
                        labelText: 'Awarded to',
                        labelStyle: TextStyle(
                          color: Colors.pinkAccent
                        )
                      ),
                      controller: awardedController,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          Map data = {
            "name": name,
            "email": email,
            "chain": chain,
            "title": titleController.text,
            "people": peopleController.text,
            "assigned": awardedController.text
          };
          var temp = json.encode(data);
          var url = "http://localhost:8000/certificate/";
          http.post(url, body: temp).then((response){
            var t = response.body;
            var jsonResult = json.decode(t.toString());
            var result = jsonResult["result"];
            if (result == "okay"){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (BuildContext context) => Success(title: titleController.text, reciever: awardedController.text))
              );
            }
            else{
              _showDialog("Details not found.");
            }
          });
        },
        child: Icon(Icons.chevron_right),
      ),
    );
  }
}

class Success extends StatelessWidget{

  Success({this.title, this.reciever});

  final title, reciever;
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Status"
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 32
                ),
                child: Text(
                  "Request for certificate for $reciever titled $title generated at ${new DateTime.now()}"
                ),
              ),
              SizedBox(
                height: 40,
              )
            ],
          ),
        ),
      ),
    );
  }

}