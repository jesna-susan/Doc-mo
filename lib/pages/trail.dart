
import 'package:docmo/pages/rtocreatevehicle.dart';
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
      body: Column(
        children: [
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: [
                InkWell(
                  onTap: () {
                    // Handle item 1 click
                    print('Item 1 clicked!');
                  },
                  child: GridItem(title: 'Item 1'),
                ),
                InkWell(
                  onTap: () {
                    // Handle item 2 click
                    print('Item 2 clicked!');
                  },
                  child: GridItem(title: 'Item 2'),
                ),
                InkWell(
                  onTap: () {
                    // Handle item 3 click
                    print('Item 3 clicked!');
                  },
                  child: GridItem(title: 'Item 3'),
                ),
                InkWell(
                  onTap: () {
                    // Handle item 4 click
                    print('Item 4 clicked!');
                  },
                  child: GridItem(title: 'Item 4'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}// 
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
