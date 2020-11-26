import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'additional.dart';
import 'bookbed.dart';
class centres extends StatelessWidget {
  final _auth= FirebaseAuth.instance;

  @override

  centres({this.pv});
  final int pv;

  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(

            tabs: [
              Tab(icon: Icon(Icons.airline_seat_individual_suite_rounded),text: 'PRIVATE'),
              Tab(icon: Icon(Icons.airline_seat_individual_suite_rounded),text: 'GOVERNMENT',),
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
            children:[ SafeArea(
              child: SingleChildScrollView(
                child: Column(

                  children: <Widget>[

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                          shadowColor: Colors.white,
                          child: Column(

                            children: <Widget>[
                              Image(
                                image: AssetImage('images/Hospital Pics/Image${(pv)*10 +1}.jpg'),
                              ),
                              ListTile(

                                leading: Icon(Icons.local_hospital,color: Colors.blue,),
                                title: Text(hospi[(pv)*10 +1 ],style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.blue,
                                ),),
                                subtitle:Text(hospi_address[(pv)*10 +1] ,style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.blue,
                                ),),

                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,

                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: RaisedButton(
                                        color:Colors.lightBlue,
                                        child: Text('CHECK ',style: TextStyle(
                                          color: Colors.white,
                                        )),
                                        splashColor: Colors.black12,
                                        onPressed:(){
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => bookbed(bv:(pv)*10 +1)
                                            ),
                                          );
                                        }
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )
                      ),
                    ),
                  ],
                ),
              ),

            ),
              SafeArea(
                child: SingleChildScrollView(
                  child: Column(

                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Card(
                            shadowColor: Colors.white,
                            child: Column(
                              children: <Widget>[
                                Image.asset('images/Hospital Pics/Image${(pv)*10 +2}.jpg'),
                                ListTile(

                                  leading: Icon(Icons.local_hospital,color: Colors.blue,),
                                  title: Text(hospi[pv*10 +2],style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.blue,
                                  ),),
                                  subtitle:Text( hospi_address[pv*10 +2],style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.blue,
                                  ), ),

                                ),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: RaisedButton(
                                          child: Text('CHECK ',style: TextStyle(
                                            color: Colors.white,
                                          )),
                                          color:Colors.lightBlue,
                                          splashColor: Colors.black12,
                                          onPressed:(){
//                                  Navigator.pushNamed(context, 'bookbed',{bv:pv});
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => bookbed(bv:(pv)*10 +2)
                                              ),
                                            );
                                          }
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            )
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ]
          ),
        ),
      ),
    );
  }
}


