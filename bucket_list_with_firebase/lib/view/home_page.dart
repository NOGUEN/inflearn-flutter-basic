import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';
import 'package:get/get.dart';
import '../auth/auth_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController jobController = TextEditingController();

  final AuthService controller = Get.put(AuthService());
  @override
  Widget build(BuildContext context) {
    return homeScaffold(context, jobController);
  }
}

Scaffold homeScaffold(
    BuildContext context, TextEditingController jobController) {
  return Scaffold(
    appBar: homeAppBar(context),
    body: homeBody(jobController),
  );
}

AppBar homeAppBar(BuildContext context) {
  return AppBar(
    title: Text("버킷 리스트"),
    actions: [
      homeAppBarLogoutButton(context),
    ],
  );
}

TextButton homeAppBarLogoutButton(BuildContext context) {
  return TextButton(
    child: Text(
      "로그아웃",
      style: TextStyle(
        color: Colors.white,
      ),
    ),
    onPressed: homeAppBarSignOutOnPressed(context),
  );
}

homeAppBarSignOutOnPressed(BuildContext context) {
  print("sign out");
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => LoginPage()),
  );
}

Column homeBody(jobController) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(8),
        child: toDoTextFieldWithPlusButton(jobController),
      ),
      Divider(height: 1),
      toDoListView(),
    ],
  );
}

Row toDoTextFieldWithPlusButton(TextEditingController jobController) {
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
          // create bucket
          if (jobController.text.isNotEmpty) {
            print("create bucket");
          }
        },
      ),
    ],
  );
}

Expanded toDoListView() {
  return Expanded(
    child: ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        String job = "$index";
        bool isDone = false;
        return toDoListViewTile(job, isDone);
      },
    ),
  );
}

ListTile toDoListViewTile(String job, bool isDone) {
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
        // 삭제 버튼 클릭시
      },
    ),
    onTap: () {
      // 아이템 클릭하여 isDone 업데이트
    },
  );
}
