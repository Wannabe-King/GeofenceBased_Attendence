import 'package:flutter/material.dart';
import 'package:geo_attendance_system/src/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:geo_attendance_system/src/services/geofencing.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    GeoFencing(
      service: GeoFencingService(),
      child: App(),
    ),
  );
}

// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';

// import 'package:firebase_database/firebase_database.dart';

// Future<bool> isDataUploaded(String locationName) async {
//   final DatabaseReference _databaseReference = FirebaseDatabase.instance.ref();

//   try {
//     final DataSnapshot snapshot = await _databaseReference
//         .child("location")
//         .child(locationName)
//         .once()
//         .then((event) => event.snapshot);

//     if (snapshot.exists) {
//       print("Data for ${snapshot.value} exists in the database.");
//       return true;
//     } else {
//       print("Data for $locationName does not exist in the database.");
//       return false;
//     }
//   } catch (e) {
//     print("Error checking data: $e");
//     return false;
//   }
// }

// Future<void> populateManagerData(Map<String, dynamic> UserData) async {
//   // Reference to the Firebase Realtime Database
//   final DatabaseReference databaseReference =
//       FirebaseDatabase.instance.ref('managers');

//   try {
//     // Iterate over the location data and add it to the database
//     for (String officeId in UserData.keys) {
//       await databaseReference.child(officeId).set(UserData[officeId]);
//     }
//     print('Location data populated successfully.');
//   } catch (e) {
//     print('Error populating location data: $e');
//   }
// }

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();

//   Map<String, dynamic> managerData = {
//     "manager1": {
//       "designation": "Director Indus AutoMotive",
//       "name": "Hardik Gupta"
//     },
//     "manager2": {"designation": "CEO Facebook", "name": "Mark Zuckerberg"}
//   };

//   // String locationName = "office15";
//   // bool isUploaded = await isDataUploaded(locationName);

//   // if (isUploaded) {
//   //   print("The data for $locationName is already uploaded.");
//   // } else {
//   //   print("The data for $locationName is missing. Please upload it.");
//   // }
//   await populateManagerData(managerData);
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: Text("Populate Firebase Data")),
//         body: Center(child: Text("Firebase Initialized")),
//       ),
//     );
//   }
// }
