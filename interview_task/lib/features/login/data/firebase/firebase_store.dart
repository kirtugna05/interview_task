import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:interview_task/features/login/data/models/song_model.dart';


import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseServices {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  
  Stream<List<SongModel>> getUserList() {
    return _firestore.collection('user')
        .snapshots()
        .map((snapshot) => snapshot.docs
        .map((doc) => SongModel.fromJson(doc.data() as Map<String, dynamic>))
        .toList());
  }

 
}
