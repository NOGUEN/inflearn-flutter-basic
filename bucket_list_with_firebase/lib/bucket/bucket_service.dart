import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class BucketService extends GetxController {
  final bucketCollection = FirebaseFirestore.instance.collection('bucket');

  Future<QuerySnapshot> read(String uid) async {
    return bucketCollection.where('uid', isEqualTo: uid).get();
  }

  void create(String job, String uid) async {
    await bucketCollection.add({
      'uid': uid,
      'job': job,
      'isDone': false,
    });
    update();
  }

  void updateBucket(String docId, bool isDone) async {
    await bucketCollection.doc(docId).update({'isDone': isDone});
    update();
  }

  void delete(String docId) async {
    await bucketCollection.doc(docId).delete();
    update();
  }
}
