import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});
  @override
  _MainscreenState createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const DashboardContent(),
    const Center(child: Text("Messages Screen")),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        centerTitle: true,
      ),
      body: _screens[_currentIndex],
      floatingActionButton: FloatingActionButton(
          onPressed: () {},
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          backgroundColor: Colors.black,
          child: const Icon(
            Icons.add,
            color: Colors.white,
          )),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: "Dashboard",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: "Messages",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}

class DashboardContent extends StatefulWidget {
  const DashboardContent({super.key});
  @override
  _DashboardContentState createState() => _DashboardContentState();
}

class _DashboardContentState extends State<DashboardContent> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            children: [
              Text(
                "Next Client",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(Icons.calendar_month),
              Icon(Icons.person),
              Icon(Icons.schedule)
            ],
          ),
        ),
        Expanded(
          child: TableCalendar(
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
            calendarFormat: CalendarFormat.month,
            headerStyle: const HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
            ),
            calendarStyle: const CalendarStyle(
              todayDecoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              selectedDecoration: BoxDecoration(
                color: Colors.orange,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Settings"),
          bottom: const TabBar(
            tabs: [
              Tab(text: "Barber"),
              Tab(text: "Clients"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(child: Text("data"),),
            Center(child: const Text("data"),),
            // BarberTab(),
            // ClientsTab(),
          ],
        ),
      ),
    );
  }
}

class BarberTab extends StatelessWidget {
  const BarberTab({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListView(
        children: const [
          ListTile(
            leading: Icon(Icons.access_time),
            title: Text("9:00 AM - 10:00 AM"),
            trailing: Icon(Icons.edit),
          ),
          ListTile(
            leading: Icon(Icons.calendar_today),
            title: Text("Monday, Friday"),
            trailing: Icon(Icons.edit),
          ),
          ListTile(
            leading: Icon(Icons.cut),
            title: Text("Haircut & Beard Trim"),
            trailing: Icon(Icons.edit),
          ),
        ],
      ),
    );
  }
}

class ClientsTab extends StatelessWidget {
  const ClientsTab({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListView(
        children: const [
          ListTile(
            leading: CircleAvatar(child: Text("DN")),
            title: Text("Dan New"),
            subtitle: Text("Upcoming Appointment"),
          ),
          ListTile(
            leading: CircleAvatar(child: Text("JS")),
            title: Text("John Smith"),
            subtitle: Text("This Week"),
          ),
          ListTile(
            leading: CircleAvatar(child: Text("AS")),
            title: Text("Amy Smith"),
            subtitle: Text("New Client"),
          ),
        ],
      ),
    );
  }
}
