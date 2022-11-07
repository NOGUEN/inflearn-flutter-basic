import 'package:flutter/material.dart';
import 'package:one_line_diary/diary_service.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

import 'diary_service.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => DiaryService()),
    ],
    child: OneLineDiary(),
  ));
}

class OneLineDiary extends StatelessWidget {
  const OneLineDiary({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CalendarFormat calenderFormat = CalendarFormat.month;
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Consumer<DiaryService>(
      builder: ((context, value, child) {
        //List<Diary> diaryList = diaryService.getByDate(selectedDate);
        return Scaffold(
          appBar: AppBar(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                TableCalendar(
                  firstDay: DateTime.utc(2010, 10, 16),
                  lastDay: DateTime.utc(2030, 3, 14),
                  focusedDay: selectedDate,
                  onFormatChanged: (format) {
                    setState(() {
                      calenderFormat = format;
                    });
                  },
                  /*eventLoader: (day) {
                    return 
                  },*/
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
