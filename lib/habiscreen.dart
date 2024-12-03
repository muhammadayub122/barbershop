import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  late final ValueNotifier<List<Event>> _selectedEvents;
  late final CalendarFormat _calendarFormat;

  @override
  void initState() {
    super.initState();
    _calendarFormat = CalendarFormat.month;
    _selectedEvents = ValueNotifier([]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(decoration: BoxDecoration(border: Border.all(width: 1)),),
          TableCalendar(
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: DateTime.now(),
            calendarStyle: CalendarStyle(
                todayDecoration:
                    BoxDecoration(color: Colors.black, shape: BoxShape.circle)),
            calendarFormat: _calendarFormat,
            eventLoader: (day) {
              return _getEventsForDay(day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {});
            },
          ),
        ],
      ),
    );
  }

  List<Event> _getEventsForDay(DateTime day) {
    return [];
  }
}

class Event {
  final String title;
  Event(this.title);
}