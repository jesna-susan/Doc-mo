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


class samplee extends StatefulWidget {
  const samplee({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _sampleeState();
  }
}

class _sampleeState extends State<samplee> {
  final double _drawerIconSize = 24;
  final double _drawerFontSize = 17;

  late User? _user;
  late Stream<DocumentSnapshot<Map<String, dynamic>>> _userDataStream;

  @override
  void initState() {
    super.initState();
    _user = FirebaseAuth.instance.currentUser;
    // _userDataStream = FirebaseFirestore.instance
    //     .collection('Users')
    //     .doc(_user!.uid)
    //     .snapshots();
    _userDataStream = FirebaseFirestore.instance
    .collection('Users')
    .doc(_user!.uid)
    .snapshots();

_userDataStream.listen((snapshot) {
  if (!snapshot.exists) {
    // Document doesn't exist, update _userDataStream to listen to the new document
    _userDataStream = FirebaseFirestore.instance
        .collection('Users')
        .doc('newDocumentID') // Replace 'newDocumentID' with the newly created document's ID
        .snapshots();

    setState(() {
      // Update the UI with the new data
    });
  }
});




  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Vehicle Details",
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
            String name = userData['name'];
            String chasisNo = userData['chasisNo'];
            String registrationno = userData['registrationno'];
            String makername = userData['makername'];
            String modelname = userData['modelname'];
            String regdate = userData['regdate'];
            String taxupto = userData['taxupto'];
            String insurancecomp = userData['insurancecomp'];
            String insurancepolicyno = userData['insurancepolicyno'];
            String insuranceupto = userData['insuranceupto'];
            String puccno = userData['puccno'];
            String regauthority = userData['regauthority'];
            String swdof = userData['swdof'];
            

            return Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Column(
                  children: [
                    const SizedBox(height: 20,),
                    const Text('Virtual RC', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                    const SizedBox(height: 10,),
                    Container(
                      padding: const EdgeInsets.only(top: 40),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.only(left: 8.0, bottom: 4.0),
                            alignment: Alignment.topLeft,
                            child: const Text(
                              "Owner Details",
                              style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Card(
                            child: Container(
                              alignment: Alignment.topLeft,
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      ...ListTile.divideTiles(
                                        color: Colors.grey,
                                        tiles: [
                                           ListTile(
                                            contentPadding: EdgeInsets.symmetric(
                                                horizontal: 12, vertical: 0),
                                            title: const Text("Name"),
                                            subtitle: Text(name),
                                          ),
                                           ListTile(
                                            title: Text("Son/Wife/Daughter of"),
                                            subtitle: Text(swdof),
                                          ),

                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 70,left: 8.0, bottom: 4.0),
                            alignment: Alignment.topLeft,
                            child: const Text(
                              "Vehicle Information",
                              style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Card(
                            child: Container(
                              alignment: Alignment.topLeft,
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      ...ListTile.divideTiles(
                                        color: Colors.grey,
                                        tiles: [
                                           ListTile(
                                leading: Icon(Icons.person),
                                title: const Text("Name of Owner"),
                                subtitle: Text(name),
                              ),
                              ListTile(
                                //leading: Icon(Icons.confirmation_number),
                                title: const Text("Chassis No."),
                                subtitle: Text(chasisNo),
                              ),
                              ListTile(
                                            title: Text("Registration Number"),
                                            subtitle: Text(registrationno),
                                          ),
                                          ListTile(
                                            title: Text("Maker Name"),
                                            subtitle: Text(makername),
                                          ),
                                          ListTile(
                                            title: Text("Model Name"),
                                            subtitle: Text(modelname),
                                          ),
                                          ListTile(
                                            title: Text("Registration Date"),
                                            subtitle: Text(regdate),
                                          ),
                                          ListTile(
                                            title: Text("Tax Valid UpTo"),
                                            subtitle: Text(taxupto),
                                          ),
                                          ListTile(
                                            title: Text("Insurance Company"),
                                            subtitle: Text(insurancecomp),
                                          ),
                                          ListTile(
                                            title: Text("Insurance Policy No."),
                                            subtitle: Text(insurancepolicyno),
                                          ),
                                          ListTile(
                                            title: Text("Insurance Valid UpTo"),
                                            subtitle: Text(insuranceupto),
                                          ),
                                          ListTile(
                                            title: Text("PUCC No."),
                                            subtitle: Text(puccno),
                                          ),
                                          ListTile(
                                            title: Text("Registering Authority"),
                                            subtitle: Text(regauthority),
                                          ),
                                        ],
                                      ),
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
                    )
                  ],
                ),
              );
          },
        ),
      ),
    );
  }
}



