import 'package:flutter/material.dart';
import 'login.dart';
import 'main.dart';
import 'additional.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class signup extends StatefulWidget {
  @override

  _signupState createState() => _signupState();
}

class _signupState extends State<signup> {

  final _auth=FirebaseAuth.instance;

  String email;
  String password;


  final myController = TextEditingController();
  final myController2=TextEditingController();
  final myController3=TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    myController2.dispose();
    myController3.dispose();

    super.dispose();
  }

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
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Center(
              child: Container(
                height: 450,
                child: Card(
//            color: Colors.white12,
                  child: Column(

                    children: <Widget>[

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: <Widget>[
                          Text("USERNAME",style: TextStyle(
                            color: Colors.blue,
                          ),),
                          TextFormField(
                            onChanged: (value){
                              email=value;
                            },
                            controller: myController,

                            cursorColor: Colors.blue,

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
                            controller: myController2,
                            cursorColor: Colors.blue,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              border: OutlineInputBorder(
                              ),


                            ),
                          ),
                          Text("CONFIRM PASSWORD",style: TextStyle(
                            color: Colors.blue,
                          ),),
                          TextFormField(
                            controller: myController3,
                            cursorColor: Colors.blue,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Confirm Password',
                              border: OutlineInputBorder(
                              ),


                            ),
                          ),

                          SizedBox(
                            height: 30,
                          ),
                        ],
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
                              if(myController2.text == myController3.text) {
                                final newUser = await _auth.createUserWithEmailAndPassword(email: email, password: password);
                                displayName=email;
                                if (newUser != null) {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text('SIGN-UP SUCCESSFUL!!'),
                                        content: SingleChildScrollView(
                                            child: ListBody(
                                              children: <Widget>[
                                                Text('PROCEED TO LOGIN ',
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
                              }
                              else{
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text('UNSUCCESSFUL!!'),
                                      content:SingleChildScrollView(
                                          child:ListBody(
                                            children: <Widget>[
                                              Text('PLEASE ENTER SAME PASSWORD IN BOTH THE FIELDS',style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),),
                                            ],

                                          )
                                      ),
                                      actions: <Widget>[
                                        RaisedButton(
                                          color:Colors.lightBlue,
                                          child: Text('BACK',style: TextStyle(
                                            color: Colors.white,
                                          ),),
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

//                            setState(() {
//
//                              if(myController2.text == myController3.text){
//
//
//
//
//                              }
//                              else{
//
//                              }
//                            });


                          },
                        ),
                      ),

                      Text("Existing User?",style: TextStyle(
                        fontSize: 20,
                      ),),
                      Container(
                          child: FlatButton(
                            color: Colors.lightBlue,

                            child: Text("LOGIN",style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,


                            ),),
                            onPressed: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => login()),
                              );
                            },
                          )
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


