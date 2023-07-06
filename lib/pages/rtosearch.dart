
import 'package:docmo/common/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Rtosearch extends StatefulWidget {
  @override
  _RtosearchState createState() => _RtosearchState();
}

class _RtosearchState extends State<Rtosearch> {
  final TextEditingController _dlnoController = TextEditingController();
  final TextEditingController _registrationnoController = TextEditingController();
  String _licenseOwnerName = '';
  String _licenseOwnerEmail = '';
  String _licenseissuedate = '';
  String _licensenumber = '';
  String _licenseValidity = '';
  String _licenseAuthority = '';
  String _fineissuedate01 = '';
  String _fineissuedate02 = '';
  String _fineissuedate03 = '';
  String _finestatus01 = '';
  String _finestatus02 = '';
  String _finestatus03 = '';
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
    String dlno = _dlnoController.text.trim();

    if (dlno.isEmpty) {
      // Ensure license number is filled
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Please enter a license number.'),
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
    QueryDocumentSnapshot? userSnapshot = await getCurrentUserByLicense(dlno);

    if (userSnapshot != null) {
      // User found, update the state with fetched details
      setState(() {
        _licenseOwnerName = userSnapshot.get('name');
        _licenseOwnerEmail = userSnapshot.get('email');
        _licenseissuedate = userSnapshot.get('issuedate');
        _licensenumber = userSnapshot.get('dlno');
        _licenseValidity = userSnapshot.get('licenseval');
        _licenseAuthority = userSnapshot.get('licenseauth');
        _fineissuedate01 = userSnapshot.get('fineissuedate01');
        _fineissuedate02 = userSnapshot.get('fineissuedate02');
        _fineissuedate03 = userSnapshot.get('fineissuedate03');
        _finestatus01 = userSnapshot.get('finestatus01');
        _finestatus02 = userSnapshot.get('finestatus02');
        _finestatus03 = userSnapshot.get('finestatus03');
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
                Text('License Issue Date: $_licenseissuedate'),
                Text('License Number: $_licensenumber'),
                Text('License Validity: $_licenseValidity'),
                Text('License Authority: $_licenseAuthority'),
                Text('Fine issue Date 01: $_fineissuedate01'),
                Text('Fine Issue Date 02: $_fineissuedate02'),
                Text('Fine Issue Date 03: $_fineissuedate03'),
                Text('Fine Status 01: $_finestatus01'),
                Text('Fine Status 02: $_finestatus02'),
                Text('Fine Status 03: $_finestatus03'),
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

  void _fetchVehicleDetails() async {
    String registrationno = _registrationnoController.text.trim();

    if (registrationno.isEmpty) {
      // Ensure license number is filled
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Please enter a vehicle number.'),
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
    QueryDocumentSnapshot? userSnapshot = await getCurrentUserByVehicle(registrationno);

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
        _insurancepolicyno = userSnapshot.get('insurancepolicyno');
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
                Text('Engine Number: $_registrationno'),
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

  Future<QueryDocumentSnapshot?> getCurrentUserByLicense(String dlno) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Users')
        .where('dlno', isEqualTo: dlno)
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

  Future<QueryDocumentSnapshot?> getCurrentUserByVehicle(String registrationno) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Users')
        .where('registrationno', isEqualTo:registrationno)
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
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      appBar: AppBar(elevation: 0.0, backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          "DOC-MO",
          style: TextStyle(
              fontSize: 23),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            SizedBox(height: 20,),
            TextField(
              controller: _dlnoController,
              decoration: ThemeHelper().textInputDecoration('Licence No', 'Enter your licencce no.'),
            ),
            SizedBox(height: 10),
            Container(
              decoration: ThemeHelper().buttonBoxDecoration(context),
              child: ElevatedButton(
                style: ThemeHelper().buttonStyle(),
                child: Text('Fetch User Details', style: TextStyle(color: Colors.white),),
                onPressed: _fetchUserDetails,
              ),
            ),
            SizedBox(height: 50),
            TextField(
              controller: _registrationnoController,
              decoration: ThemeHelper().textInputDecoration('Vehicle No', 'Enter your vehicle no.'),
            ),
            SizedBox(height: 10),
            Container(
              decoration: ThemeHelper().buttonBoxDecoration(context),
              child: ElevatedButton(
                style: ThemeHelper().buttonStyle(),
                child: Text('Fetch Vehicle Details', style: TextStyle(color: Colors.white),),
                onPressed: _fetchVehicleDetails,
              ),
            ),
          ],
        ),
      ),
    );
  }
}






