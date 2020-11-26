import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
class welcome extends StatefulWidget {
  @override
  _welcomeState createState() => _welcomeState();
}

class _welcomeState extends State<welcome> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),

      home: Scaffold(
        body:

        Container(
          decoration: BoxDecoration(
              image:DecorationImage(

                image: AssetImage('images/hospi_background.jpg'),
                fit: BoxFit.cover,
//                    repeat: ImageRepeat.repeatY,

              )
          ),
          child: SafeArea(

            child: Column(
//            mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                SizedBox(
                  height: 100,
                ),
                Text('WELCOME!',style: TextStyle(
                  color: Colors.blue,
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                ),),

                SizedBox(
                  height: 100,
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Card(
//                  margin: EdgeInsets.all(10),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ListBody(
                        children: <Widget>[
                          FlatButton(
                            color: Colors.lightBlueAccent,
                            child: Text('LOGIN',style: TextStyle(
                                color: Colors.white,
                                fontSize: 20
                            ),),

                            onPressed: (){
                              Navigator.pushNamed(context, 'login');
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          FlatButton(
                            color: Colors.lightBlueAccent,
                            child: Text('SIGN-UP',style: TextStyle(
                                color: Colors.white,
                                fontSize: 20
                            ),),
                            onPressed: (){
                              Navigator.pushNamed(context, 'sign-up');
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
