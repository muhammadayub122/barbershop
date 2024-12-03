
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
    const Center(child: Text("Settings Screen")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
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
  State<DashboardContent> createState() => _DashboardContentState();
}

class _DashboardContentState extends State<DashboardContent> {
  final List<String> items = ['Month', 'Agenda View'];
  String _selectedItem = 'Month';

  void _onDropdownChanged(String? value) {
    if (value == null) return;

    setState(() {
      _selectedItem = value;
    });


    if (value == 'Agenda View') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const AgendaViewScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Next appointment",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Icon(Icons.person),
                      SizedBox(height: 8),
                      Text("John D."),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.calendar_month),
                      SizedBox(height: 8),
                      Text("Mon, Aug 12"),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(height: 8),
                      Text("1 PM"),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Calendar",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              children: [
                const Spacer(),

DropdownButton<String>(
                  value: _selectedItem,
                  items: items.map((String item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(item),
                    );
                  }).toList(),
                  onChanged: _onDropdownChanged,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TableCalendar(
                firstDay: DateTime.utc(2020, 1, 1),
                lastDay: DateTime.utc(2030, 12, 31),
                focusedDay: DateTime.now(),
                headerStyle: const HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                ),
                calendarStyle: const CalendarStyle(
                  todayDecoration: BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                  selectedDecoration: BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class AgendaViewScreen extends StatelessWidget {
  const AgendaViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Agenda View"),
        centerTitle: true,
        actions: [
          DropdownButton<String>(
            value: 'Agenda View',
            underline: Container(),
            items: const [
              DropdownMenuItem(
                value: 'Month',
                child: Text("Month"),
              ),
              DropdownMenuItem(
                value: 'Agenda View',
                child: Text("Agenda View"),
              ),
            ],
            onChanged: (value) {
              if (value == 'Month') {
                Navigator.pop(context);
              }
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Calendar",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        
        ],
      ),
    );
  }

        
}
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
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
       
            BarberTab(),
             ClientsTab(),
            ],
          ),
        ), 
      ),
    );
  }
}

class BarberTab extends StatelessWidget {
  const BarberTab({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView(
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
    );
  }
}

class ClientsTab extends StatelessWidget {
  const ClientsTab({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView(
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
    );
  }
}