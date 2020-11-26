import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'state.dart';
import 'signup.dart';
import 'additional.dart';
import 'centres.dart';
class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {

  final _auth= FirebaseAuth.instance;

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
//                    repeat: ImageRepeat.repeatY,

            )
        ),
        child: SafeArea(
          child:Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Container(
                height: 280,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("USERNAME",style: TextStyle(
                              color: Colors.blue,
                            ),),
                            TextFormField(
                              cursorColor: Colors.blue,
                              onChanged:(value) {
                                email=value;
                              },

                              decoration: InputDecoration(
                                labelText: 'Username',
                                border: OutlineInputBorder(
                                ),


                              ),
                            ),
                            Text("PASSWORD",style: TextStyle(
                              color: Colors.blue,
                            ),),
                            TextFormField(
                              onChanged: (value){
                                password=value;
                              },

                              cursorColor: Colors.blue,
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                border: OutlineInputBorder(
                                ),


                              ),
                            ),
                          ],),
                        SizedBox(
                          height: 20,
                        ),
                        FlatButton(
                          color: Colors.lightBlue,

                          child: Text("LOGIN",style: TextStyle(
                              color: Colors.white,
                              fontSize: 20
                          ),),
                          onPressed: () async{
                            try{
                              final user= await _auth.signInWithEmailAndPassword(email: email, password: password);
                              displayName=email;
                              if (user != null) {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text('LOGIN SUCCESSFUL!!'),
                                      content: SingleChildScrollView(
                                          child: ListBody(
                                            children: <Widget>[
                                              Text('PROCEED TO BOOKING ',
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
                                            'PROCEED', style: TextStyle(
                                            color: Colors.white,
                                          ),),
                                          onPressed: () {
                                            Navigator.pushNamed(
                                                context, 'airport');
                                          },

                                        ),
                                      ],

                                    );
                                  },
                                );
                              }

                              else{
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text('LOGIN UNSUCCESSFUL!!'),
                                      content:SingleChildScrollView(
                                          child:ListBody(
                                            children: <Widget>[
                                              Text('ENTER CORRECT USERNAME OR PASSWORD',style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),),
                                            ],

                                          )
                                      ),
                                      actions: <Widget>[
                                        RaisedButton(
                                          child: Text('BACK'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
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
                      ],
                    ),
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
