import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserServices {
  FirebaseUser user;
  static CollectionReference _userCollection =
      Firestore.instance.collection('users');
  static Future<void> updateUser(User user) async {
      await _userCollection.document(user.uid).setData({
        'uid': user.uid,
        'email': user.email,
        'name': user.name,
        'noHp': user.noHp ?? "",
        'role': user.role ?? "user",
        'alamat': user.alamat ?? "",
        'profilePicture': user.profilePicture ?? "",
        'selectedGender': user.selectedGender ?? "",
        'selectedBranch': user.selectedBranch ?? "",
        'status': user.status ?? "not active",
        'deviceId': user.deviceId ?? "",
      });
    }
  }
  
  class User {
    'Email Address': email,
    'Full Name': nama,
    'Phone Number': phoneNumber,
}