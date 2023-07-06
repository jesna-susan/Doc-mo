import 'package:flutter/material.dart';

class NotificationSettingScreen extends StatefulWidget {
  @override
  _NotificationSettingScreenState createState() =>
      _NotificationSettingScreenState();
}

class _NotificationSettingScreenState extends State<NotificationSettingScreen> {
  bool _isNotificationEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      appBar: AppBar(elevation: 0.0, backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          "Notification Settings",
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
              'Manage your notification preferences',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            SwitchListTile(
              title: Text('Enable Notifications'),
              value: _isNotificationEnabled,
              onChanged: (value) {
                setState(() {
                  _isNotificationEnabled = value;
                });
              },
            ),
            SizedBox(height: 16.0),
            ListTile(
              title: Text('Notification Sound'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Handle notification sound settings
              },
            ),
           
            
          ],
        ),
      ),
    );
  }
}

