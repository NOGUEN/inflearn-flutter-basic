import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController jobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("버킷 리스트"),
        actions: [
          TextButton(
            child: Text(
              "로그아웃",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () {
              print("sign out");
              // 로그인 페이지로 이동
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          /// 입력창
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                /// 텍스트 입력창
                Expanded(
                  child: TextField(
                    controller: jobController,
                    decoration: InputDecoration(
                      hintText: "하고 싶은 일을 입력해주세요.",
                    ),
                  ),
                ),

                /// 추가 버튼
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
            ),
          ),
          Divider(height: 1),

          /// 버킷 리스트
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                String job = "$index";
                bool isDone = false;
                return ListTile(
                  title: Text(
                    job,
                    style: TextStyle(
                      fontSize: 24,
                      color: isDone ? Colors.grey : Colors.black,
                      decoration: isDone
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                  // 삭제 아이콘 버튼
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
              },
            ),
          ),
        ],
      ),
    );
  }
}
