import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

import 'login_page.dart';
import '../auth/auth_service.dart';
import '../bucket/bucket_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController jobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BucketService>(
      builder: (bucketService) {
        return GetBuilder<AuthService>(
          builder: (authService) {
            final user = authService.currentUser();
            return Scaffold(
              appBar: AppBar(
                title: Text("버킷 리스트"),
                actions: [
                  logoutButton(authService, context),
                ],
              ),
              body: bucketTextFieldAndBucketList(
                  jobController, bucketService, user),
            );
          },
        );
      },
    );
  }
}

TextButton logoutButton(AuthService authService, context) {
  return TextButton(
    child: Text(
      "로그아웃",
      style: TextStyle(
        color: Colors.white,
      ),
    ),
    onPressed: () {
      authService.signOut();

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    },
  );
}

Column bucketTextFieldAndBucketList(
    TextEditingController jobController, BucketService bucketService, user) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(8),
        child:
            bucketTextFieldAndCreateButton(jobController, bucketService, user),
      ),
      Divider(height: 1),
      Expanded(
        child: bucketListFutureBuilder(bucketService, user),
      ),
    ],
  );
}

Row bucketTextFieldAndCreateButton(
    TextEditingController jobController, BucketService bucketService, user) {
  return Row(
    children: [
      Expanded(
        child: TextField(
          controller: jobController,
          decoration: InputDecoration(
            hintText: "하고 싶은 일을 입력해주세요.",
          ),
        ),
      ),
      ElevatedButton(
        child: Icon(Icons.add),
        onPressed: () {
          if (jobController.text.isNotEmpty) {
            bucketService.create(jobController.text, user!.uid);
          }
        },
      ),
    ],
  );
}

FutureBuilder<QuerySnapshot> bucketListFutureBuilder(
    BucketService bucketService, user) {
  return FutureBuilder<QuerySnapshot>(
    future: bucketService.read(user!.uid),
    builder: (context, snapshot) {
      final documents = snapshot.data?.docs ?? [];
      if (documents.isEmpty) {
        return Center(child: Text("버킷 리스트를 작성해주세요."));
      }
      return bucketListView(documents, bucketService);
    },
  );
}

ListView bucketListView(List<QueryDocumentSnapshot<Object?>> documents,
    BucketService bucketService) {
  return ListView.builder(
    itemCount: documents.length,
    itemBuilder: (context, index) {
      final doc = documents[index];
      String job = doc.get('job');
      bool isDone = doc.get('isDone');
      return bucketListTile(job, isDone, bucketService, doc);
    },
  );
}

ListTile bucketListTile(String job, bool isDone, BucketService bucketService,
    QueryDocumentSnapshot<Object?> doc) {
  return ListTile(
    title: Text(
      job,
      style: TextStyle(
        fontSize: 24,
        color: isDone ? Colors.grey : Colors.black,
        decoration: isDone ? TextDecoration.lineThrough : TextDecoration.none,
      ),
    ),
    trailing: IconButton(
      icon: Icon(CupertinoIcons.delete),
      onPressed: () {
        bucketService.delete(doc.id);
      },
    ),
    onTap: () {
      bucketService.updateBucket(doc.id, !isDone);
    },
  );
}
