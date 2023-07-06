import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Object?> fetchVehicleDetails(String userId) async {
    try {
      DocumentSnapshot snapshot =
          await _firestore.collection('users').doc(userId).collection('vehicledetails').doc('vehicle').get();
      if (snapshot.exists) {
        Object? vehicleDetails = snapshot.data();
        return vehicleDetails;
      } else {
        return null;
      }
    } catch (e) {
      print('Error fetching vehicle details: $e');
      return null;
    }
  }
}
