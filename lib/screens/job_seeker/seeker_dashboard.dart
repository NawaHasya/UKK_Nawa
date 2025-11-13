import 'package:buamal/wigdets/job_card.dart';
import 'package:flutter/material.dart';
import 'seeker_profile.dart';
import 'seeker_portfolio.dart';
import 'seeker_job_list.dart';

class SeekerDashboard extends StatefulWidget {
  const SeekerDashboard({super.key});

  @override
  State<SeekerDashboard> createState() => _SeekerDashboardState();
}

class _SeekerDashboardState extends State<SeekerDashboard> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    _HomePage(),
    SeekerPortfolio(),
    SeekerProfile(),
  ];

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF1E1E1E),
        selectedItemColor: const Color(0xFFFFE100),
        unselectedItemColor: Colors.white60,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.work_outline), label: "Portfolio"),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "Profile"),
        ],
      ),
    );
  }
}

class _HomePage extends StatelessWidget {
  const _HomePage();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🧑‍💼 Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Location",
                      style: TextStyle(color: Colors.white54, fontSize: 13),
                    ),
                    Row(
                      children: [
                        Icon(Icons.location_on, color: Color(0xFFFFE100), size: 18),
                        SizedBox(width: 4),
                        Text(
                          "Malang, Indonesia",
                          style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
                CircleAvatar(
                  backgroundColor: const Color(0xFFFFE100),
                  radius: 20,
                  child: IconButton(
                    icon: const Icon(Icons.notifications_none, color: Colors.black),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),

            // 🔍 Search bar
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF1E1E1E),
                borderRadius: BorderRadius.circular(15),
              ),
              child: const TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: Color(0xFFFFE100)),
                  hintText: "Search for jobs...",
                  hintStyle: TextStyle(color: Colors.white54),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ),
            const SizedBox(height: 30),

            // 💼 Suggested Jobs Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Suggested Jobs",
                  style: TextStyle(
                    color: Color(0xFFFFE100),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const SeekerJobList()));
                  },
                  child: const Text(
                    "See All",
                    style: TextStyle(color: Colors.white70, fontSize: 14, decoration: TextDecoration.underline),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),

            // 🔹 Horizontal Scroll
            SizedBox(
              height: 220,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  JobCard(
                    title: "UI Designer",
                    company: "Briosoft Solutions",
                    location: "Jakarta",
                    salary: "Rp 7–9 Jt / bulan",
                    applicants: 122,
                  ),
                  JobCard(
                    title: "Frontend Developer",
                    company: "Telkom Indonesia",
                    location: "Bandung",
                    salary: "Rp 8–10 Jt / bulan",
                    applicants: 88,
                  ),
                  JobCard(
                    title: "Mobile Developer (Flutter)",
                    company: "Gojek",
                    location: "Remote",
                    salary: "Rp 10–12 Jt / bulan",
                    applicants: 203,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // 🕐 Recent Jobs
            const Text(
              "Recent Jobs",
              style: TextStyle(
                color: Color(0xFFFFE100),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),

            Column(
              children: const [
                JobCard(
                  title: "React Developer",
                  company: "Amplify Avenue",
                  location: "Surabaya",
                  salary: "Rp 8.000.000 / bulan",
                  applicants: 46,
                ),
                JobCard(
                  title: "Graphic Designer",
                  company: "Kreasi Studio",
                  location: "Yogyakarta",
                  salary: "Rp 6.000.000 / bulan",
                  applicants: 72,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
