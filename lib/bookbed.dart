import 'package:flutter/material.dart';
import 'additional.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'centres.dart';
class bookbed extends StatefulWidget {
  final _auth= FirebaseAuth.instance;

  final int bv;
  bookbed({this.bv});
  int total_price=0;
  @override

  _bookbedState createState() => _bookbedState(bv);
}

class _bookbedState extends State<bookbed> {
  final _auth= FirebaseAuth.instance;
  final int bv;
  _bookbedState(this.bv);

  @override

  Widget build(BuildContext context) {



//     int a=m[bv];
    int a = beds[ m[bv] ];

//    int bb=b[0];
    return DefaultTabController(
      length:2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.hotel),text: 'BOOK BED'),
              Tab(icon: Icon(Icons.assignment),text: 'GUIDELINES',),
            ],
          ),
          title: Center(child: Text("QUARANTINE FACILITY APP")),
          backgroundColor: Colors.blue,

        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                ),
                child: Text(
                  'QUARANTINE FACILITY APP',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),

              ListTile(
                leading: Icon(Icons.email),
                title: Text('EMAIL'),
                subtitle: Text('$displayName'),
              ),

              ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                  onTap: (){
                    Navigator.pushNamed(context, 'setting');
                  }
              ),
              ListTile(
                leading: Icon(Icons.power_settings_new),

                title: Text('Logout'),
                onTap: () async {
                  _auth.signOut();
                  Navigator.popUntil(context, ModalRoute.withName('login'));
                },
              ),

            ],
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
              image:DecorationImage(

                image: AssetImage('images/hospi_background.jpg'),
                fit: BoxFit.cover,
//                    repeat: ImageRepeat.repeatY,

              )
          ),
          child: TabBarView(
            children: <Widget>[
              SafeArea(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Card(
                          child: Column(
                            children: <Widget>[
                              ListTile(
                                title: Text('BEDS AVAILABLE : ',style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),),

                              ),
                              Text('$a',style: TextStyle(
                                fontSize: 30,
                                color: Colors.blue,

                              ),),
                              ListTile(
                                title: Text('PRICE(PER BED) : ',style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),),

                              ),
                              Text('${price[m[bv]]}',style: TextStyle(
                                fontSize: 30,
                                color: Colors.blue,

                              ),),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[

                                  RaisedButton(
                                    color: Colors.lightBlue,

                                    child: Icon(
                                      Icons.remove,
                                      color: Colors.white,

                                    ),
                                    onPressed: (){
                                      setState(() {
                                        if(b[0]>0){

                                          b[0]--;
                                          beds[ m[bv] ] ++;
                                        }
                                        else{}
                                      });
                                    },
                                  ),
                                  SizedBox(
                                    width: 50,

                                  ),
                                  RaisedButton(
                                    color: Colors.lightBlue,
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,

                                    ),
                                    onPressed: (){
                                      setState(() {
                                        if(beds[ m[bv] ] >0) {
                                          if((beds[ m[bv] ] ) > 0 ) {
                                            b[0]++;
                                            beds[ m[bv] ] --;
                                          }
                                          else{
                                          }
                                        }
                                      }
                                      );
                                    },
                                  ),
                                ],
                              ),
                              Text('BEDS TO BE BOOKED : ${b[0]}',style: TextStyle(
                                color: Colors.blue,
                                fontSize: 20,
                              ),),

                              Center(
                                child: FlatButton(
                                  color: Colors.lightBlue,
                                  child: Text('BOOK BED',style: TextStyle(
                                    color: Colors.white,

                                  ),),
                                  onPressed: (){
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text('CONFIRMATION MESSAGE!!'),
                                          content:SingleChildScrollView(
                                              child:ListBody(
                                                children: <Widget>[
                                                  Text('No. Of Beds Booked: ${b[0]}',style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                  ),),
                                                  Text('PRICE TO PAY : ${(b[0])* price[m[bv]] }',style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                  ),),
                                                ],
                                              )
                                          ),
                                          actions: <Widget>[
                                            RaisedButton(
                                              color: Colors.lightBlue,
                                              child: Text('CONFIRM AND PROCEED TO PAYMENT',style: TextStyle(
                                                color: Colors.white,

                                              ),),
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                            ),
                                          ],

                                        );
                                      },
                                    );
                                  },
                                ),
                              )

                            ],

                          )
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Card(
                        child: Column(
                          children: <Widget>[
                            ListBody(
                              children: <Widget>[
                                Text('HOSPITAL DETAILS',style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,

                                ),),
                                Text(' '),
                                Text(hospi[bv],style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.blue,

                                ),),
                                Text(hospi_address[bv],style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 18,
                                ),),
                              ],
                            ),

                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(

                        child: Column(
                          children: <Widget>[
                            ListBody(
                              children: <Widget>[
                                Text('Currently Available Doctors Are: ' ,style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),),
                                Text(' '),

                                Text('* Dr. Sidhharth Pathak',style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.blue,

                                )),
                                Text('* Dr. Brijesh Arora',style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.blue,

                                )),
                                Text('* Dr. Neetu Mittal',style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.blue,

                                )),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: <Widget>[
                  Card(

                      child: ListTile(
                        leading: Image.asset('images/Tissue.png'),
                        title: Text('* Sneeze or cough?  Cover your nose and mouth with a tissue or use your elbow. ',style: TextStyle(
                          color: Colors.blue,
                        ),),
                      )
                  ),
                  Card(

                      child: ListTile(
                        leading: Image.asset('images/Wash-Hands.png'),

                        title: Text('* Wash your hands often with soap and water for at least 20 seconds.',style: TextStyle(
                          color: Colors.blue,
                        ),),
                      )
                  ),
                  Card(
                      child: ListTile(
                        leading:Image.asset('images/Disinfectant.png'),

                        title: Text('* Clean and disinfect surfaces around your home and work frequently.',style: TextStyle(
                          color: Colors.blue,
                        ),),

                      )
                  ),
                  Card(

                      child: ListTile(
                        leading : Image.asset('images/Social-Distancing.png'),
                        title: Text('* Keep at least 6 feet between yourself and others if you must be in public.',style: TextStyle(
                          color: Colors.blue,
                        ),),

                      )
                  ),
                  Card(

                      child: ListTile(
                        leading: Image.asset('images/Pandemic-Flu.png'),

                        title:Text('* Wear a cloth face covering over your mouth and nose when around others.',style: TextStyle(
                          color: Colors.blue,
                        ),),
                      )
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}


