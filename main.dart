import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int currentIndex = 0;

  DateTime today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),

      body: SafeArea(
        child: IndexedStack(
          index: currentIndex,
          children: [
            dashboardPage(),
            const Center(
              child: Text(
                "Tasks Screen",
                style: TextStyle(color: Colors.white),
              ),
            ),
            const Center(
              child: Text(
                "Notes Screen",
                style: TextStyle(color: Colors.white),
              ),
            ),
            const Center(
              child: Text(
                "Timer Screen",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        backgroundColor: const Color(0xFF111827),
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.white54,

        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.task_alt),
            label: "Tasks",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.note_alt),
            label: "Notes",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timer),
            label: "Timer",
          ),
        ],
      ),
    );
  }

  Widget dashboardPage() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          Text(
            "Good Evening 👋",
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            "Stay consistent today.",
            style: GoogleFonts.poppins(
              color: Colors.white70,
            ),
          ),

          const SizedBox(height: 25),

          Row(
            children: [

              Expanded(
                child: statCard(
                  "Tasks",
                  "12",
                  Icons.task_alt,
                ),
              ),

              const SizedBox(width: 15),

              Expanded(
                child: statCard(
                  "Streak",
                  "7",
                  Icons.local_fire_department,
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          Container(
            padding: const EdgeInsets.all(16),

            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.08),
              borderRadius: BorderRadius.circular(20),
            ),

            child: TableCalendar(
              focusedDay: today,
              firstDay: DateTime.utc(2020),
              lastDay: DateTime.utc(2035),

              selectedDayPredicate: (day) {
                return isSameDay(today, day);
              },

              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  today = selectedDay;
                });
              },

              calendarStyle: const CalendarStyle(
                todayDecoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                selectedDecoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
                defaultTextStyle: TextStyle(
                  color: Colors.white,
                ),
              ),

              headerStyle: const HeaderStyle(
                titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
                formatButtonVisible: false,
                leftChevronIcon:
                    Icon(Icons.chevron_left, color: Colors.white),
                rightChevronIcon:
                    Icon(Icons.chevron_right, color: Colors.white),
              ),
            ),
          ),

          const SizedBox(height: 20),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),

            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.08),
              borderRadius: BorderRadius.circular(20),
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: const [

                Text(
                  "Today's Goals",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),

                SizedBox(height: 15),

                ListTile(
                  leading: Icon(
                    Icons.check_circle,
                    color: Colors.green,
                  ),
                  title: Text(
                    "Physics Revision",
                    style: TextStyle(color: Colors.white),
                  ),
                ),

                ListTile(
                  leading: Icon(
                    Icons.circle_outlined,
                    color: Colors.white70,
                  ),
                  title: Text(
                    "Chemistry Notes",
                    style: TextStyle(color: Colors.white),
                  ),
                ),

                ListTile(
                  leading: Icon(
                    Icons.circle_outlined,
                    color: Colors.white70,
                  ),
                  title: Text(
                    "Math Practice",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget statCard(
    String title,
    String value,
    IconData icon,
  ) {
    return Container(
      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.08),
        borderRadius: BorderRadius.circular(20),
      ),

      child: Column(
        children: [
          Icon(
            icon,
            size: 35,
            color: Colors.white,
          ),

          const SizedBox(height: 10),

          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 5),

          Text(
            title,
            style: const TextStyle(
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }
}