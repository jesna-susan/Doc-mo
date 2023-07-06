import 'package:flutter/material.dart';
import '../common/theme_helper.dart';
import 'changepassword.dart';
import 'languagescreen.dart';
import 'notificationscreen.dart';
import 'profile_page.dart';
import 'login_page.dart';
import 'forgot_password_page.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      appBar: AppBar(elevation: 0.0, backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          "Settings",
          style: TextStyle(
              fontSize: 23),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'General',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            ListTile(
              leading: Icon(Icons.language),
              title: Text('Language'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Handle language settings
                Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              LanguageSettingScreen()));

              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.notifications),
              title: const Text('Notifications'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Handle notification settings
                Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              NotificationSettingScreen()));
              },
            ),
            SizedBox(height: 32.0),
            Text(
              'Account',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Handle profile settings
                Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ProfilePage()));
              },
            ),
            Divider(),
            ListTile(
              leading: const Icon(Icons.lock),
              title: Text('Change Password'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Handle change password settings
                 Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ChangePassword()));
              },
            ),
            const SizedBox(height: 32.0),
            Container(
                                decoration: ThemeHelper().buttonBoxDecoration(context),
                                child: ElevatedButton(
                                  style: ThemeHelper().buttonStyle(),
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
                                    child: Text('Logout'.toUpperCase(), style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),),
                                  ),
                                  onPressed: () {
                                    Navigator.push( context, MaterialPageRoute( builder: (context) => const LoginPage()), );
                                  },
                                ),
                              ),
          ],
        ),
      ),
    );
  }
}

