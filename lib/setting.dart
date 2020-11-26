import 'package:flutter/material.dart';
import 'additional.dart';
import 'package:firebase_auth/firebase_auth.dart';
class setting extends StatefulWidget {
  @override

  _settingState createState() => _settingState();
}

class _settingState extends State<setting> {
  final _auth=FirebaseAuth.instance;

  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("QUARANTINE FACILITY APP")),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        decoration: BoxDecoration(
            image:DecorationImage(
              image: AssetImage('images/hospi_background.jpg'),
              fit: BoxFit.cover,
            )
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Center(
              child: Container(
                height: 250,
                child: Card(
//            color: Colors.white12,
                  child: Column(
                    children: <Widget>[
                      Text("RESET PASSWORD",style: TextStyle(
                        fontSize: 30,
                        color: Colors.blue,
                      ),),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("USERNAME",style: TextStyle(
                              color: Colors.blue,
                            ),),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              onChanged: (value){
                                email=value;
                              },
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                              // controller: myController,

                              cursorColor: Colors.blue,
                              decoration: InputDecoration(
                                labelText: 'Username',
                                border: OutlineInputBorder(
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                      ),
                      Container(

                        child: FlatButton(
                          color: Colors.lightBlue,
                          child: Text("SUBMIT",style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),),
                          onPressed: () async{
                            try{
                              await _auth.sendPasswordResetEmail(email: email);
                              displayName=email;
                              {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text('RESET PASSWORD!!'),
                                      content: SingleChildScrollView(
                                          child: ListBody(
                                            children: <Widget>[
                                              Text('PASSWORD RESET EMAIL HAS BEEN SENT TO $email',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),),
                                            ],
                                          )
                                      ),
                                      actions: <Widget>[
                                        RaisedButton(
                                          color: Colors.lightBlue,
                                          child: Text(
                                            'PROCEED TO LOGIN', style: TextStyle(
                                            color: Colors.white,
                                          ),),
                                          onPressed: () {
                                            Navigator.popUntil(context, ModalRoute.withName('login'));
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                            }
                            catch(e){
                              print(e);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}