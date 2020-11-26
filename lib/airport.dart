import 'package:flutter/material.dart';
import 'centres.dart';
import 'additional.dart';

class state extends StatefulWidget {

  @override
  _stateState createState() => _stateState();
}

class _stateState extends State<state> {

  @override
  int s_value=1;
  int c_value=11;

  Map<int,int> m = { 1:11 , 2:21 , 3:31 , 4:41 };

  Map<int,String> airp ={
    11: "SAFDARJUNG AIRPORT" ,
    12: "IGI AIRPORT" ,
    21: "PATHANKOT AIRPORT" ,
    22: "LUDHIANA AIRPORT" ,
    31: "PANTNAGAR AIRPORT" ,
    32: "JOLLY GRANT AIRPORT" ,
    41: "MORADABAD AIRPORT" ,
    42: "LUCKNOW AIRPORT" ,
  };

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              onTap: (){
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
        child: SafeArea(
            child:Center(
              child: Container(
                height:500,
                width:350,
                child: Card(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 100,
                      ),
                      Text("Select Your State",style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue
                      ),),
                      Container(
//              margin: EdgeInsets.all(50),
                          child:DropdownButton(
                            dropdownColor: Colors.white,
                            iconSize: 50,
                            iconDisabledColor: Colors.red,
                            iconEnabledColor: Colors.blue,
                            value: s_value,
                            items: [
                              DropdownMenuItem(
                                child: Text("DELHI",style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.blue,
                                ),),
                                value: 1,
                              ),
                              DropdownMenuItem(
                                child: Text("PUNJAB",style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.blue,

                                )),
                                value: 2,
                              ),
                              DropdownMenuItem(
                                child: Text("UTTARAKHAND",style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.blue,

                                )),
                                value: 3,
                              ),
                              DropdownMenuItem(
                                child: Text("UTTARPRADESH",style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.blue,

                                )),
                                value: 4,
                              ),
                            ],
                            onChanged:(value){
                              setState(() {
                                s_value=value;
                                c_value= value*10 +1 ;
                              });
                            },
                          )
                      ),

                      SizedBox(
                        height: 20,
                      ),
                      Text("Select the",style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,

                      ),),
//
                      Text(" Destination Airport",style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,

                      ),),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
//              margin: EdgeInsets.all(50),
                          child:DropdownButton(
                            dropdownColor: Colors.white,
                            iconSize: 50,
                            iconDisabledColor: Colors.red,
                            iconEnabledColor: Colors.blue,
                            value: c_value,
                            items: [
                              DropdownMenuItem(
                                child: Text( airp[s_value*10 +1] , style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.blue,

                                ),),
                                value: s_value*10 +1,
                              ),

                              DropdownMenuItem(

                                child: Text( airp[s_value*10 + 2], style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.blue,

                                ),),
                                value: s_value*10 + 2,
                              ),
                            ],
                            onChanged:(value){
                              setState(() {
                                c_value=value;
                              });
                            },
                          )
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      FlatButton(

                        color: Colors.lightBlue,
                        child: Text("PROCEED",style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.white,

                        ),),
                        onPressed: (){
                          A result=A(c_value);
                         Navigator.push(
                           context,
                           MaterialPageRoute(builder: (context) =>centres(pv:result.val)
                           ),
                         );
                        },
                      )
                    ],
                  ),
                ),
              ),
            )
        ),
      ),
    );
  }
}
