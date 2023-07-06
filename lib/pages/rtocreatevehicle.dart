import 'package:docmo/common/theme_helper.dart';
import 'package:docmo/pages/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserDetailsPage extends StatefulWidget {
  @override
  _UserDetailsPageState createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _chasisNoController = TextEditingController();
  final TextEditingController _dlnoController = TextEditingController();
  final TextEditingController _registrationnoController = TextEditingController();
  final TextEditingController _fineissuedate01Controller = TextEditingController();
  final TextEditingController _fineissuedate02Controller = TextEditingController();
  final TextEditingController _fineissuedate03Controller = TextEditingController();
  final TextEditingController _finestatus01Controller = TextEditingController();
  final TextEditingController _finestatus02Controller = TextEditingController();
  final TextEditingController _finestatus03Controller = TextEditingController();
  final TextEditingController _insurancecompController = TextEditingController();
  final TextEditingController _insurancepolicynoController = TextEditingController();
  final TextEditingController _insuranceuptoController = TextEditingController();
  final TextEditingController _issuedateController = TextEditingController();
  final TextEditingController _licenseauthController = TextEditingController();
  final TextEditingController _licensenameController = TextEditingController();
  final TextEditingController _makernameController = TextEditingController();
  final TextEditingController _licensevalController = TextEditingController();
  final TextEditingController _modelnameController = TextEditingController();
  final TextEditingController _puccnoController = TextEditingController();
  final TextEditingController _regauthorityController = TextEditingController();
  final TextEditingController _regdateController = TextEditingController();
  final TextEditingController _swdofController = TextEditingController();
  final TextEditingController _taxuptoController = TextEditingController();

  void _saveUserDetails() async {
    String name = _nameController.text.trim();
    String email = _emailController.text.trim();
    String chasisNo = _chasisNoController.text.trim();
    String dlno = _dlnoController.text.trim();
    String registrationno = _registrationnoController.text.trim();
    String fineissuedate01 = _fineissuedate01Controller.text.trim();
    String fineissuedate02 = _fineissuedate02Controller.text.trim();
    String fineissuedate03 = _fineissuedate03Controller.text.trim();
    String finestatus01 = _finestatus01Controller.text.trim();
    String finestatus02 = _finestatus02Controller.text.trim();
    String finestatus03 = _finestatus03Controller.text.trim();
    String insurancecomp = _insurancecompController.text.trim();
    String insurancepolicyno = _insurancepolicynoController.text.trim();
    String insuranceupto = _insuranceuptoController.text.trim();
    String issuedate = _issuedateController.text.trim();
    String licenseauth = _licenseauthController.text.trim();
    String licensename = _licensenameController.text.trim();
    String licenseval = _licensevalController.text.trim();
    String makername = _makernameController.text.trim();
    String modelname = _modelnameController.text.trim();
    String puccno = _puccnoController.text.trim();
    String regauthority = _regauthorityController.text.trim();
    String regdate = _regdateController.text.trim();
    String swdof = _swdofController.text.trim();
    String taxupto = _taxuptoController.text.trim();
    String phone = _phoneController.text.trim();

    // if (name.isEmpty || email.isEmpty || phone.isEmpty || chasisNo.isEmpty || dlno.isEmpty || registrationno.isEmpty || fineissuedate01.isEmpty || fineissuedate02.isEmpty || fineissuedate03.isEmpty || finestatus01.isEmpty || finestatus02.isEmpty || finestatus03.isEmpty|| insurancecomp.isEmpty
    // || insurancepolicyno.isEmpty|| insuranceupto.isEmpty|| issuedate.isEmpty|| licenseauth.isEmpty|| licensename.isEmpty|| licenseval.isEmpty|| makername.isEmpty|| modelname.isEmpty|| puccno.isEmpty|| regauthority.isEmpty || regdate.isEmpty || swdof.isEmpty || taxupto.isEmpty) {
    //   showDialog(
    //     context: context,
    //     builder: (BuildContext context) {
    //       return AlertDialog(
    //         title: Text('Error'),
    //         content: Text('Please fill in all fields.'),
    //         actions: <Widget>[
    //           TextButton(
    //             child: Text('OK'),
    //             onPressed: () {
    //               Navigator.of(context).pop();
    //             },
    //           ),
    //         ],
    //       );
    //     },
    //   );
    //   return;
    // }

    await saveUserDetails(name, email, phone, chasisNo, dlno, registrationno, fineissuedate01, fineissuedate02, fineissuedate03, finestatus01, finestatus02, finestatus03, insurancecomp, insurancepolicyno, insuranceupto, issuedate, licenseauth, licensename, licenseval, makername, modelname, puccno, regauthority, regdate, swdof, taxupto);
  }

    Future<void> saveUserDetails(String name, String email, String phone, String chasisNo, String dlno, String registrationno, String fineissuedate01, String fineissuedate02, String fineissuedate03, String finestatus01, String finestatus02, String finestatus03, String insurancecomp, String insurancepolicyno, String insuranceupto, String issuedate, String licenseauth, String licensename, String licenseval, String makername, String modelname, String puccno, String regauthority, String regdate, String swdof, String taxupto) async {
    // Get the current user ID
    String? userId = await getCurrentUserId(name, email);

    if (userId != null) {
      // Save the user details as a new document in the 'Users' collection
      Map<String, dynamic> additionalFields = {
        'chasisNo': chasisNo,
        'dlno': dlno,
        'registrationno': registrationno,
        'fineissuedate01': fineissuedate01,
        'fineissuedate02': fineissuedate02,
        'fineissuedate03': fineissuedate03,
        'finestatus01': finestatus01,
        'finestatus02': finestatus02,
        'finestatus03': finestatus03,
        'insurancecomp': insurancecomp,
        'insurancepolicyno': insurancepolicyno,
        'insuranceupto': insuranceupto,
        'issuedate': issuedate,
        'licenseauth': licenseauth,
        'licensename': licensename,
        'licenseval': licenseval,
        'makername': makername,
        'modelname': modelname,
        'puccno': puccno,
        'regauthority': regauthority,
        'regdate': regdate,
        'swdof': swdof,
        'taxupto': taxupto,
        //'field5': field5,

        // Add additional fields here
      };

      await FirebaseFirestore.instance.collection('Users').doc(userId).set({
        'name': name,
        'email': email,
        'phone': phone,
        'chasisNo': chasisNo,
        'dlno': dlno,
        'registrationno': registrationno,
        'fineissuedate01': fineissuedate01,
        'fineissuedate02': fineissuedate02,
        'fineissuedate03': fineissuedate03,
        'finestatus01': finestatus01,
        'finestatus02': finestatus02,
        'finestatus03': finestatus03,
        'insurancecomp': insurancecomp,
        'insurancepolicyno': insurancepolicyno,
        'insuranceupto': insuranceupto,
        'issuedate': issuedate,
        'licenseauth': licenseauth,
        'licensename': licensename,
        'licenseval': licenseval,
        'makername': makername,
        'modelname': modelname,
        'puccno': puccno,
        'regauthority': regauthority,
        'regdate': regdate,
        'swdof': swdof,
        'taxupto': taxupto,
        ...additionalFields,
      });

      // Details saved successfully
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Success'),
            content: Text('User details saved successfully!'),
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
      return querySnapshot.docs.first.id;
    } else {
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
                              ),
                              // Container(
                              //   padding: const EdgeInsets.fromLTRB(80, 80, 0, 0),
                              //   child: Icon(
                              //     Icons.add_circle,
                              //     color: Colors.grey.shade700,
                              //     size: 25.0,
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 30,),
                        const Text('Vehicle Registration', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
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
                            controller: _phoneController,
                            decoration: ThemeHelper().textInputDecoration('Phone'),
                          ),
                        ),
                        const SizedBox(height: 30,),
                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          child: TextFormField(
                            controller: _chasisNoController,
                            decoration: ThemeHelper().textInputDecoration('Chasis Number'),
                          ),
                        ),
                        
                        const SizedBox(height: 30,),
                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          child: TextFormField(
                            controller: _registrationnoController,
                            decoration: ThemeHelper().textInputDecoration('Vehicle Registration Number'),
                          ),
                        ),
                        
                        const SizedBox(height: 30,),
                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          child: TextFormField(
                            controller: _insurancecompController,
                            decoration: ThemeHelper().textInputDecoration('Insurance Company'),
                          ),
                        ),
                        const SizedBox(height: 30,),
                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          child: TextFormField(
                            controller: _insurancepolicynoController,
                            decoration: ThemeHelper().textInputDecoration('Insurance Policy Number'),
                          ),
                        ),
                        const SizedBox(height: 30,),
                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          child: TextFormField(
                            controller: _insuranceuptoController,
                            decoration: ThemeHelper().textInputDecoration('Insurance valid up to'),
                          ),
                        ),
                        const SizedBox(height: 30,),
                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          child: TextFormField(
                            controller: _modelnameController,
                            decoration: ThemeHelper().textInputDecoration('Model Name'),
                          ),
                        ),
                        const SizedBox(height: 30,),
                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          child: TextFormField(
                            controller: _puccnoController,
                            decoration: ThemeHelper().textInputDecoration('Pollution Control Number'),
                          ),
                        ),
                        const SizedBox(height: 30,),
                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          child: TextFormField(
                            controller: _regauthorityController,
                            decoration: ThemeHelper().textInputDecoration('Registration Authority'),
                          ),
                        ),
                        const SizedBox(height: 30,),
                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          child: TextFormField(
                            controller: _taxuptoController,
                            decoration: ThemeHelper().textInputDecoration('Tax valid up to'),
                          ),
                        ),
                        const SizedBox(height: 30,),
                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          child: TextFormField(
                            controller: _makernameController,
                            decoration: ThemeHelper().textInputDecoration('Maker Name'),
                          ),
                        ),
                        const SizedBox(height: 30,),
                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          child: TextFormField(
                            controller: _regdateController,
                            decoration: ThemeHelper().textInputDecoration('Registration date'),
                          ),
                        ),

                        const SizedBox(height: 30,),
                        const Text('License Registration', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),

                        const SizedBox(height: 30,),
                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          child: TextFormField(
                            controller: _issuedateController,
                            decoration: ThemeHelper().textInputDecoration('Issue Date'),
                          ),
                        ),
                        const SizedBox(height: 30,),
                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          child: TextFormField(
                            controller: _licenseauthController,
                            decoration: ThemeHelper().textInputDecoration('License Authority'),
                          ),
                        ),
                        const SizedBox(height: 30,),
                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          child: TextFormField(
                            controller: _licensenameController,
                            decoration: ThemeHelper().textInputDecoration('License Name'),
                          ),
                        ),
                        const SizedBox(height: 30,),
                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          child: TextFormField(
                            controller: _licensevalController,
                            decoration: ThemeHelper().textInputDecoration('license Validity'),
                          ),
                        ),

                        
                        const SizedBox(height: 30,),
                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          child: TextFormField(
                            controller: _swdofController,
                            decoration: ThemeHelper().textInputDecoration('Name of the Relative'),
                          ),
                        ),
                        
                        const SizedBox(height: 30,),
                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          child: TextFormField(
                            controller: _dlnoController,
                            decoration: ThemeHelper().textInputDecoration('Driving license Number'),
                          ),
                        ),

                        const SizedBox(height: 30,),
                        const Text('Fine Issue', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),

                        const SizedBox(height: 30,),
                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          child: TextFormField(
                            controller: _fineissuedate01Controller,
                            decoration: ThemeHelper().textInputDecoration('Fine Issue Date 01'),
                          ),
                        ),
                        const SizedBox(height: 30,),
                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          child: TextFormField(
                            controller: _fineissuedate02Controller,
                            decoration: ThemeHelper().textInputDecoration('Fine Issue Date 02'),
                          ),
                        ),
                        const SizedBox(height: 30,),
                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          child: TextFormField(
                            controller: _fineissuedate03Controller,
                            decoration: ThemeHelper().textInputDecoration('Fine Issue Date 03'),
                          ),
                        ),
                        const SizedBox(height: 30,),
                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          child: TextFormField(
                            controller: _finestatus01Controller,
                            decoration: ThemeHelper().textInputDecoration('Fine Status 01'),
                          ),
                        ),
                        const SizedBox(height: 30,),
                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          child: TextFormField(
                            controller: _finestatus02Controller,
                            decoration: ThemeHelper().textInputDecoration('Fine Status 02'),
                          ),
                        ),
                        const SizedBox(height: 30,),
                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          child: TextFormField(
                            controller: _finestatus03Controller,
                            decoration: ThemeHelper().textInputDecoration('Fine Status 03'),
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
                                "Register".toUpperCase(),
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
                        // SizedBox(height: 40,),
                        // Container(
                        //         margin: const EdgeInsets.fromLTRB(10,0,10,20),
                        //         alignment: Alignment.topRight,
                        //         child: GestureDetector(
                        //           onTap: () {
                        //             Navigator.push( context, MaterialPageRoute( builder: (context) =>  UserDetailsPage()), );
                        //           },
                        //           child: const Text( "Register New Vehicle", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue, ),
                        //           ),
                        //         ),
                        //       ),
                        // SizedBox(height: 40,)
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
