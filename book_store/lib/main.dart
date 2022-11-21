import 'package:book_store/book_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'book.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BookService()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final TextEditingController searchController = TextEditingController();

  void search(BookService bookService) {
    String keyword = searchController.text;
    if (keyword.isNotEmpty) {
      bookService.getBookList(keyword);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BookService>(builder: (context, bookService, child) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text(
            "Book Store",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          backgroundColor: Colors.white,
          bottom: PreferredSize(
            preferredSize: Size(0, 60),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: "책 이름을 입력하세요.",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.black,
                    ),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search),
                    color: Colors.black,
                    onPressed: () {
                      search(bookService);
                    },
                  ),
                ),
                onSubmitted: (value) {
                  search(bookService);
                },
              ),
            ),
          ),
        ),
        body: bookService.bookList.isEmpty
            ? Center(
                child: Text("검색어를 입력해주세요"),
              )
            : ListView.builder(
                itemCount: bookService.bookList.length,
                itemBuilder: (context, index) {
                  Book book = bookService.bookList[index];
                  return ListTile(
                    leading: Image.network(
                      book.thumbnail,
                      width: 80,
                      height: 80,
                    ),
                    title: Text(book.title),
                    subtitle: Text(book.subTitle),
                  );
                },
              ),
      );
    });
  }
}
