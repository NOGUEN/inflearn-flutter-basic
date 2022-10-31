import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> dataList = [
      {
        "category": "수제버거",
        "imgUrl": "https://i.ibb.co/VtK43vv/burger.jpg",
      },
      {
        "category": "건강식",
        "imgUrl": "https://i.ibb.co/2KbN5pV/soup.jpg",
      },
      {
        "category": "한식",
        "imgUrl": "https://i.ibb.co/KXJD0rN/korean-meals.jpg",
      },
      {
        "category": "디저트",
        "imgUrl": "https://i.ibb.co/9Yn3t0w/tiramisu.jpg",
      },
      {
        "category": "피자",
        "imgUrl": "https://i.ibb.co/P9nKtt2/pizza.jpg",
      },
      {
        "category": "볶음밥",
        "imgUrl": "https://i.ibb.co/3svVzM1/shakshuka.jpg",
      },
    ];

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        title: Text(
          "Food Recipe",
          style: TextStyle(
            color: Colors.black,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {
                print("go to mypage");
              },
              icon: Icon(Icons.person_outline))
        ],
      ),
      body: Column(
        children: [
          Padding(
              padding: EdgeInsets.all(8.0),
              child: searchTextField("상품을 검색해주세요.")),
          Expanded(
              child: ListView.builder(
                  itemCount: dataList.length,
                  itemBuilder: ((context, index) {
                    Map<String, dynamic> data = dataList[index];
                    String category = data["category"];
                    String imgUrl = data["imgUrl"];
                    return foodContainerButton(imgUrl, category);
                  })))
        ],
      ),
      drawer: appBarDrawer(),
    );
  }
}

class searchTextField extends StatelessWidget {
  final String hintText;
  const searchTextField(this.hintText, {super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          suffixIcon: IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              print('search icon pressed');
            },
          )),
    );
  }
}

class foodContainerButton extends StatelessWidget {
  final String imgUrl;
  final String category;
  const foodContainerButton(this.imgUrl, this.category, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.all(8.0),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.network(
              imgUrl,
              width: double.infinity,
              height: 120,
              fit: BoxFit.cover,
            ),
            Container(
              width: double.infinity,
              height: 120,
              color: Colors.black.withOpacity(0.5),
            ),
            Text(
              category,
              style: TextStyle(
                color: Colors.white,
                fontSize: 36,
              ),
            ),
          ],
        ));
  }
}

class appBarDrawer extends StatelessWidget {
  const appBarDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            margin: const EdgeInsets.all(0),
            decoration: BoxDecoration(
              color: Colors.amber,
            ),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  CircleAvatar(
                      radius: 36,
                      backgroundColor: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Image.network(
                          "https://i.ibb.co/CwzHq4z/trans-logo-512.png",
                          width: 62,
                        ),
                      )),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "NickName",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Email@email.com",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
          AspectRatio(
            aspectRatio: 12 / 4,
            child: PageView(
              children: [
                Image.network(
                  "https://i.ibb.co/Q97cmkg/sale-event-banner1.jpg",
                ),
                Image.network(
                  "https://i.ibb.co/GV78j68/sale-event-banner2.jpg",
                ),
                Image.network(
                  "https://i.ibb.co/R3P3RHw/sale-event-banner3.jpg",
                ),
                Image.network(
                  "https://i.ibb.co/LRb1VYs/sale-event-banner4.jpg",
                ),
              ],
            ),
          ),
          customListTile("구매내역"),
          customListTile("저장한 레시피")
        ],
      ),
    );
  }
}

class customListTile extends StatelessWidget {
  final String tileTitle;
  const customListTile(this.tileTitle, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        tileTitle,
        style: TextStyle(fontSize: 18),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: Colors.black,
      ),
      onTap: () {
        // 클릭시 drawer 닫기
        Navigator.pop(context);
      },
    );
  }
}
