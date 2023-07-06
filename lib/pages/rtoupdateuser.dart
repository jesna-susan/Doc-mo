import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:docmo/common/theme_helper.dart';
import 'package:docmo/pages/widgets/header_widget.dart';

class Rtoupdate extends StatefulWidget {
  @override
  _RtoupdateState createState() => _RtoupdateState();
}

class _RtoupdateState extends State<Rtoupdate> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _fineissuedate01Controller = TextEditingController();
  final TextEditingController _fineissuedate02Controller = TextEditingController();
  final TextEditingController _fineissuedate03Controller = TextEditingController();
  final TextEditingController _finestatus01Controller = TextEditingController();
  final TextEditingController _finestatus02Controller = TextEditingController();
  final TextEditingController _finestatus03Controller = TextEditingController();
  // Add more TextEditingController for additional fields

  void _saveUserDetails() async {
    String name = _nameController.text.trim();
    String email = _emailController.text.trim();
    String fineissuedate01 = _fineissuedate01Controller.text.trim();
    String fineissuedate02 = _fineissuedate02Controller.text.trim();
    String fineissuedate03 = _fineissuedate03Controller.text.trim();
    String finestatus01 = _finestatus01Controller.text.trim();
    String finestatus02 = _finestatus02Controller.text.trim();
    String finestatus03 = _finestatus03Controller.text.trim();
    // Get values for additional fields

    

    // Save user details
    await saveUserDetails(name, email, fineissuedate01, fineissuedate02, fineissuedate03, finestatus01, finestatus02, finestatus03);
  }

  Future<void> saveUserDetails(String name, String email, String fineissuedate01, String fineissuedate02, String fineissuedate03, String finestatus01, String finestatus02, String finestatus03) async {
    // Get the current user ID
    String? userId = await getCurrentUserId(name, email);

    if (userId != null) {
      // Create a map of the fields to update
      Map<String, dynamic> fieldsToUpdate = {
        'name': name,
        'email': email,
        'fineissuedate01': fineissuedate01,
        'fineissuedate02': fineissuedate02,
        'fineissuedate03': fineissuedate03,
        'finestatus01': finestatus01,
        'finestatus02': finestatus02,
        'finestatus03': finestatus03,
        // Add additional fields here
      };

      // Update the fields in the existing document using the update method
      await FirebaseFirestore.instance.collection('Users').doc(userId).update(fieldsToUpdate);

      // Details saved successfully
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Success'),
            content: Text('User fine details saved successfully!'),
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

  Future<String?> getCurrentUserId(String name, String email) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Users')
        .where('name', isEqualTo: name)
        .where('email', isEqualTo: email)
        .limit(1)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      // User found, return the user ID
      return querySnapshot.docs.first.id;
    } else {
      // User not found
      return null;
    }
  }

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 150,
              child: const HeaderWidget(150, false, Icons.person_add_alt_1_rounded),
            ),
            
            Container(
              margin: const EdgeInsets.fromLTRB(25, 50, 25, 10),
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Form(
                    //key: _formKey,
                    child: Column(
                      children: [
                        GestureDetector(
                          child: Stack(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(
                                      width: 5, color: Colors.white),
                                  color: Colors.white,
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 20,
                                      offset: Offset(5, 5),
                                    ),
                                  ],
                                ),
                                child: Icon(
                                  Icons.edit_document,
                                  color: Colors.grey.shade300,
                                  size: 80.0,
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 30,),
                        const Text('Issuing Fine and Updating Status', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                        const SizedBox(height: 30,),
                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          child: TextFormField(
                            controller: _nameController,
                            decoration: ThemeHelper().textInputDecoration('Name'),
                          ),
                        ),
                        const SizedBox(height: 30,),
                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          child: TextFormField(
                            controller: _emailController,
                            decoration: ThemeHelper().textInputDecoration('Email'),
                          ),
                        ),
                        const SizedBox(height: 30,),
                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          child: TextFormField(
                            controller: _fineissuedate01Controller,
                            decoration: ThemeHelper().textInputDecoration('Fine Issue Date 1'),
                          ),
                        ),
                        const SizedBox(height: 30,),
                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          child: TextFormField(
                            controller: _finestatus01Controller,
                            decoration: ThemeHelper().textInputDecoration('Status of FIne 1'),
                          ),
                        ),
                        
                        const SizedBox(height: 30,),
                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          child: TextFormField(
                            controller: _fineissuedate02Controller,
                            decoration: ThemeHelper().textInputDecoration('Fine Issue Date 2'),
                          ),
                        ),
                        
                        const SizedBox(height: 30,),
                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          child: TextFormField(
                            controller: _finestatus02Controller,
                            decoration: ThemeHelper().textInputDecoration('Status of Fine 2'),
                          ),
                        ),
                        const SizedBox(height: 30,),
                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          child: TextFormField(
                            controller: _fineissuedate03Controller,
                            decoration: ThemeHelper().textInputDecoration('Fine Issue Date 3'),
                          ),
                        ),
                        const SizedBox(height: 30,),
                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          child: TextFormField(
                            controller: _finestatus03Controller,
                            decoration: ThemeHelper().textInputDecoration('Status of Fine 3'),
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        Container(
                          decoration: ThemeHelper().buttonBoxDecoration(context),
                          child: ElevatedButton(
                            style: ThemeHelper().buttonStyle(),
                            // ignore: sort_child_properties_last
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                              child: Text(
                                "Issue Fine".toUpperCase(),
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              
                            ),
                            onPressed: _saveUserDetails,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}