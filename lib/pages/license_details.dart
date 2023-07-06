import 'package:docmo/pages/samplee.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:docmo/pages/front_page.dart';
import 'package:docmo/pages/login_page.dart';
import '../common/theme_helper.dart';
import 'profile_page.dart';
import 'license_details.dart';
import 'fine_page.dart';
import 'settingscreen.dart';
import 'package:docmo/services/datadase.dart';


class Driverdetails extends StatefulWidget {
  const Driverdetails({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _DriverdetailsState();
  }
}

class _DriverdetailsState extends State<Driverdetails> {
  final double _drawerIconSize = 24;
  final double _drawerFontSize = 17;

  late User? _user;
  late Stream<DocumentSnapshot<Map<String, dynamic>>> _userDataStream;

  @override
  void initState() {
    super.initState();
    _user = FirebaseAuth.instance.currentUser;
    _userDataStream = FirebaseFirestore.instance
        .collection('Users')
        .doc(_user!.uid)
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Driver Details",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        elevation: 0.5,
        iconTheme: const IconThemeData(color: Colors.white),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                Theme.of(context).primaryColor,
                Theme.of(context).colorScheme.secondary,
              ],
            ),
          ),
        ),
      ),
      drawer: Drawer(
        child: Container(
          decoration:BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.0, 1.0],
                  colors: [
                    Theme.of(context).primaryColor.withOpacity(0.2),
                    Theme.of(context).colorScheme.secondary.withOpacity(0.5),
                  ]
              )
          ) ,
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: const [0.0, 1.0],
                    colors: [ Theme.of(context).primaryColor, Theme.of(context).colorScheme.secondary,
                    ],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                    'Welcome',
                    style: TextStyle(fontSize: _drawerFontSize, color: Colors.white),
                  ),
                  FutureBuilder<DocumentSnapshot>(
                    future: FirebaseFirestore.instance.collection('Users').doc(_user!.uid).get(),
                    builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasData) {
                          Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
                          String name = data['name'];
                          String email = data['email'];
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                name,
                                style: TextStyle(fontSize: _drawerFontSize, color: Colors.white),
                              ),
                              Text(
                                email,
                                style: TextStyle(fontSize: _drawerFontSize, color: Colors.white),
                              ),
                            ],
                          );
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        }
                      }
                      return CircularProgressIndicator();
                    },
                  ),
                  ],
                ),

              ),
              ListTile(
                leading: Icon(
                    Icons.home, size: _drawerIconSize, color: Theme.of(context).colorScheme.secondary),
                title: Text('Home',
                  style: TextStyle(fontSize: _drawerFontSize, color: Theme.of(context).colorScheme.secondary),
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => FrontPage()));
                },
              ),
              Divider(color: Theme.of(context).primaryColor, height: 1,),
              ListTile(
                leading: Icon(Icons.person_outlined, size: _drawerIconSize, color: Theme.of(context).colorScheme.secondary,),
                title: Text(
                  'My Profile', style: TextStyle(fontSize: 17, color: Theme.of(context).colorScheme.secondary),),
                onTap: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfilePage()));
                },
              ),
              Divider(color: Theme.of(context).primaryColor, height: 1,),
              ListTile(
                leading: Icon(
                    Icons.newspaper_outlined, size: _drawerIconSize, color: Theme.of(context).colorScheme.secondary),
                title: Text('My Transactions',
                  style: TextStyle(fontSize: _drawerFontSize, color: Theme.of(context).colorScheme.secondary),
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const FinePayment()),);
                },
              ),
              Divider(color: Theme.of(context).primaryColor, height: 1,),
              ListTile(
                leading: Icon(Icons.edit_document, size: _drawerIconSize,
                    color: Theme.of(context).colorScheme.secondary),
                title: Text('Driver Details',
                  style: TextStyle(fontSize: _drawerFontSize, color: Theme.of(context).colorScheme.secondary),),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Driverdetails()),);
                },
              ),
              Divider(color: Theme.of(context).primaryColor, height: 1,),
              ListTile(
                leading: Icon(Icons.car_crash_outlined, size: _drawerIconSize,
                    color: Theme.of(context).colorScheme.secondary),
                title: Text('Vehicle Details',
                  style: TextStyle(fontSize: _drawerFontSize, color: Theme.of(context).colorScheme.secondary),),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>  samplee()),);
                },
              ),Divider(color: Theme.of(context).primaryColor, height: 1,),
              ListTile(
                leading: Icon(
                  Icons.settings, size: _drawerIconSize, color: Theme.of(context).colorScheme.secondary,),
                title: Text('Settings',
                  style: TextStyle(fontSize: _drawerFontSize, color: Theme.of(context).colorScheme.secondary),),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsScreen()),);
                },
              ),
              Divider(color: Theme.of(context).primaryColor, height: 1,),
              ListTile(
                leading: Icon(
                  Icons.logout_rounded, size: _drawerIconSize, color: Theme.of(context).colorScheme.secondary,),
                title: Text('Logout',
                  style: TextStyle(fontSize: _drawerFontSize, color: Theme.of(context).colorScheme.secondary),),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()),);
                },
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
          stream: _userDataStream,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (!snapshot.hasData || !snapshot.data!.exists) {
              return Center(
                child: Text('No data available'),
              );
            }

            Map<String, dynamic> userData = snapshot.data!.data() as Map<String, dynamic>;
            String licensename = userData['licensename'];
            String swdof = userData['swdof'];
            String issuedate = userData['issuedate'];
            String dlno = userData['dlno'];
            String licenseval = userData['licenseval'];
            String licenseauth = userData['licenseauth'];
            

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const SizedBox(height: 20,),
                  const Text('Indian Union Driving License Issued by State of Kerala', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                  const SizedBox(height: 10,),
                  Container(
                    padding: const EdgeInsets.only(top: 60),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.only(left: 8.0, bottom: 4.0),
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "License Information",
                            style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'License Details',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                leading: Icon(Icons.person),
                                title: const Text("DL Number Holder Name"),
                                subtitle: Text(licensename),
                              ),
                              ListTile(
                                //leading: Icon(Icons.confirmation_number),
                                title: const Text("Son/Wife/Daughter of"),
                                subtitle: Text(swdof),
                              ),
                              ListTile(
                                            title: Text("Issue date"),
                                            subtitle: Text(issuedate),
                                          ),
                                          ListTile(
                                            title: Text("DL No."),
                                            subtitle: Text(dlno),
                                          ),
                                          ListTile(
                                            title: Text("License Validity"),
                                            subtitle: Text(licenseval),
                                          ),
                                          ListTile(
                                            title: Text("Licensing Authority"),
                                            subtitle: Text(licenseauth),
                                          ),
                                          
                              // Add more ListTile widgets for other fields
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                                          Container(
                            decoration: ThemeHelper().buttonBoxDecoration(context),
                            child: ElevatedButton(
                              style: ThemeHelper().buttonStyle(),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                                child: Text('Return To Home'.toUpperCase(), style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
                              ),
                              onPressed: (){
                                //After successful login we will redirect to profile page. Let's create profile page now
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => FrontPage()));
                              },
                            ),
                          ),

                ],
              ),
                
            ),
                ],
            )
            );
                
          },
        ),
      ),
    );
  }
}



