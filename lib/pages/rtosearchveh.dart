import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Rtosearchvehicledetails extends StatefulWidget {
  @override
  _RtosearchvehicledetailsState createState() => _RtosearchvehicledetailsState();
}

class _RtosearchvehicledetailsState extends State<Rtosearchvehicledetails> {
  final TextEditingController _registrationnoController = TextEditingController();
  String _licenseOwnerName = '';
  String _licenseOwnerEmail = '';
  String _chasisNo = '';
  String _registrationno = '';
  String _makername = '';
  String _modelname = '';
  String _regdate = '';
  String _taxupto = '';
  String _insurancecomp = '';
  String _insurancepolicyno = '';
  String _insuranceupto = '';
  String _puccno = '';
  String _regauthority = '';

  void _fetchUserDetails() async {
    String registrationno = _registrationnoController.text.trim();

    if (registrationno.isEmpty) {
      // Ensure license number is filled
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Please enter the vehicle registration number.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      return;
    }

    // Fetch user details based on license number
    QueryDocumentSnapshot? userSnapshot = await getCurrentUserByLicense(registrationno);

    if (userSnapshot != null) {
      // User found, update the state with fetched details
      setState(() {
        _licenseOwnerName = userSnapshot.get('name');
        _licenseOwnerEmail = userSnapshot.get('email');
        _chasisNo = userSnapshot.get('chasisNo');
        _registrationno = userSnapshot.get('registrationno');
        _makername = userSnapshot.get('makername');
        _modelname = userSnapshot.get('modelname');
        _regdate = userSnapshot.get('regdate');
        _taxupto = userSnapshot.get('taxupto');
        _insurancecomp = userSnapshot.get('insurancecomp');
        _insuranceupto = userSnapshot.get('insuranceupto');
        _puccno = userSnapshot.get('puccno');
        _regauthority = userSnapshot.get('regauthority');
      });

      // Display user details
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('User Details'),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('Name: $_licenseOwnerName'),
                Text('Email: $_licenseOwnerEmail'),
                Text('Chasis Number: $_chasisNo'),
                Text('Vehicle Registration Number: $_registrationno'),
                Text('Maker Name: $_makername'),
                Text('Model Name: $_modelname'),
                Text('Registration Date: $_regdate'),
                Text('Tax valid up to: $_taxupto'),
                Text('Insurance Company: $_insurancecomp'),
                Text('Insurance valid up to: $_insuranceupto'),
                Text('Insurance Policy Number: $_insurancepolicyno'),
                Text('Pollution Control Number: $_puccno'),
                Text('Registration Authority: $_regauthority'),

              ],
            ),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else {
      // User not found
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('User not found!'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  Future<QueryDocumentSnapshot?> getCurrentUserByLicense(String registrationno) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Users')
        .where('registrationno', isEqualTo: registrationno)
        .limit(1)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      // User with matching license number found
      return querySnapshot.docs.first;
    } else {
      // User not found
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vehicle Details'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _registrationnoController,
              decoration: InputDecoration(labelText: 'Vehicle Registration  Number'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Fetch User Details'),
              onPressed: _fetchUserDetails,
            ),
          ],
        ),
      ),
    );
  }
}
