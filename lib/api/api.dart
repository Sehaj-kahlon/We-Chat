import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class APIs {
  //for authentication
  static FirebaseAuth auth = FirebaseAuth.instance;
  //for accessing coud firestore database
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
}
