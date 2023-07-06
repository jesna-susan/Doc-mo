
import 'package:docmo/pages/rtosearch.dart';
import 'package:docmo/pages/rtosearchveh.dart';
import 'package:docmo/pages/rtoupdateuser.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:docmo/pages/login_page.dart';
import '../common/theme_helper.dart';
import 'front_page.dart';
import 'profile_page.dart';
import 'license_details.dart';
import 'rtocreatevehicle.dart';


class RtoPage extends StatelessWidget {

  final double _drawerIconSize = 24;
  final double _drawerFontSize = 17;

  const RtoPage({super.key});
  Key get _formKey => GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      appBar: AppBar(elevation: 0.0, backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          "DOC-MO",
          style: TextStyle(
              fontSize: 23),
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: Container(
          decoration:BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: const [0.0, 1.0],
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
                child: Container(
                  alignment: Alignment.bottomLeft,
                  child: const Text("Welcome",
                    style: TextStyle(fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                    Icons.home, size: _drawerIconSize, color: Theme.of(context).colorScheme.secondary),
                title: Text('Home',
                  style: TextStyle(fontSize: _drawerFontSize, color: Theme.of(context).colorScheme.secondary),
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => RtoPage()));
                },
              ),
              
              Divider(color: Theme.of(context).primaryColor, height: 1,),
              ListTile(
                leading: Icon(
                  Icons.support_agent_rounded, size: _drawerIconSize, color: Theme.of(context).colorScheme.secondary,),
                title: Text('Help And Support',
                  style: TextStyle(fontSize: _drawerFontSize, color: Theme.of(context).colorScheme.secondary),),
                onTap: () {
                  //Navigator.push(context, MaterialPageRoute(builder: (context) => const ForgotPasswordPage()),);
                },
              ),
              Divider(color: Theme.of(context).primaryColor, height: 1,),
              ListTile(
                leading: Icon(
                  Icons.help, size: _drawerIconSize, color: Theme.of(context).colorScheme.secondary,),
                title: Text('About Us',
                  style: TextStyle(fontSize: _drawerFontSize, color: Theme.of(context).colorScheme.secondary),),
                onTap: () {
                  //Navigator.push(context, MaterialPageRoute(builder: (context) => const ForgotPasswordVerificationPage()),);
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
      body: Container(
        padding: const EdgeInsets.only(left: 0),
        child: Column(
          children: [
            SizedBox(height: 50,),
            Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 1,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push( context, MaterialPageRoute( builder: (context) =>  UserDetailsPage()), );
                  },
                  child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Theme.of(context).colorScheme.secondary,),
                  child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Icon(Icons.car_rental,size: 60,color: Colors.white,),
                  Text("\nEnter User Details",style: TextStyle(color: Colors.white,fontSize: 15, fontWeight: FontWeight.bold),)
              ],),
              ),
                ),
              //   InkWell(
              //     onTap: () {
              //       //Navigator.push( context, MaterialPageRoute( builder: (context) =>  LicenceDetailsPage()), );
              //     },
              //     child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Theme.of(context).colorScheme.secondary,),
              // child: const Column(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //   Icon(Icons.document_scanner,size: 60,color: Colors.white,),
              //   Text("\nNew Licence",style: TextStyle(color: Colors.white,fontSize: 15, fontWeight: FontWeight.bold),)
              // ],),
              // ),
              //   ),
                InkWell(
                  onTap: () {
                    Navigator.push( context, MaterialPageRoute( builder: (context) =>  Rtoupdate()), );
                  },
                  child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Theme.of(context).colorScheme.secondary,),
                  child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Icon(Icons.car_rental,size: 60,color: Colors.white,),
                  Text("\nFine Issue",style: TextStyle(color: Colors.white,fontSize: 15, fontWeight: FontWeight.bold),)
              ],),
              ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push( context, MaterialPageRoute( builder: (context) =>  Rtosearch()), );
                  },
                  child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Theme.of(context).colorScheme.secondary,),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Icon(Icons.search,size: 60,color: Colors.white,),
                Text("\nSearch",style: TextStyle(color: Colors.white,fontSize: 20),)
              ],),
              ),
                ),
              ],
            ),
          ),
            /*SizedBox(height: 30.0),
                      Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.fromLTRB(20,0,20,0),
                                child: TextField(
                                  decoration: ThemeHelper().textInputDecoration('Vehicle No', 'Enter your vehicle no.'),
                                ),
                                decoration: ThemeHelper().inputBoxDecorationShaddow(),
                              ),
                              SizedBox(height: 20.0),
                              Container(
                                margin: const EdgeInsets.fromLTRB(20,0,20,0),
                                child: TextField(
                                  obscureText: true,
                                  decoration: ThemeHelper().textInputDecoration('Licence No', 'Enter your licencce no.'),
                                ),
                                decoration: ThemeHelper().inputBoxDecorationShaddow(),
                              ),
                              SizedBox(height: 20.0),
                              Container(
                                decoration: ThemeHelper().buttonBoxDecoration(context),
                                child: ElevatedButton(
                                  style: ThemeHelper().buttonStyle(),
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                                    child: Text('Search'.toUpperCase(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
                                  ),
                                  onPressed: (){
                                    //After successful login we will redirect to profile page. Let's create profile page now
                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => FrontPage()));
                                  },
                                ),
                              ),
                              
                              /*Container(
                                margin: const EdgeInsets.fromLTRB(10,0,10,20),
                                alignment: Alignment.topRight,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push( context, MaterialPageRoute( builder: (context) =>  UserDetailsPage()), );
                                  },
                                  child: const Text( "Add details of a user", style: TextStyle( color: Colors.grey, ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.fromLTRB(10,0,10,20),
                                alignment: Alignment.topRight,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push( context, MaterialPageRoute( builder: (context) =>  Rtoupdate()), );
                                  },
                                  child: const Text( "Update Fine details of a user", style: TextStyle( color: Colors.grey, ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.fromLTRB(10,0,10,20),
                                alignment: Alignment.topRight,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push( context, MaterialPageRoute( builder: (context) =>  Rtosearch()), );
                                  },
                                  child: const Text( "Search by license number", style: TextStyle( color: Colors.grey, ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.fromLTRB(10,0,10,20),
                                alignment: Alignment.topRight,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push( context, MaterialPageRoute( builder: (context) =>  Rtosearchvehicledetails()), );
                                  },
                                  child: const Text( "Search by vehicle engine number", style: TextStyle( color: Colors.grey, ),
                                  ),
                                ),
                              ),*/
                            ],
                          )
                      ),*/
          ],
        ),
      ),
    );
  }

}// Scaffold

class GridItem extends StatelessWidget {
  final String title;

  const GridItem({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      color: Colors.grey,
      child: Center(
        child: Text(
          title,
          style: TextStyle(fontSize: 18.0),
        ),
      ),
    );
  }
}