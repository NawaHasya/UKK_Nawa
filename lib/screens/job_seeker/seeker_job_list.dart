import 'package:buamal/wigdets/job_card.dart';
import 'package:flutter/material.dart';

class SeekerJobList extends StatelessWidget {
  const SeekerJobList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E1E1E),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "All Job Listings",
          style: TextStyle(
            color: Colors.yellowAccent,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.yellowAccent),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Search bar
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF2A2A2A),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Search for jobs...",
                  hintStyle: TextStyle(color: Colors.white54),
                  prefixIcon:
                      Icon(Icons.search, color: Colors.yellowAccent, size: 26),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 15),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // ✅ Daftar job list — sudah ditambahkan 'applicants'
            Expanded(
              child: ListView(
                children: [
                  JobCard(
                    title: "Frontend Developer",
                    company: "PT Telkom Indonesia",
                    location: "Bandung, Jawa Barat",
                    salary: "Rp 8.000.000 / bulan",
                    applicants: 42,
                  ),
                  JobCard(
                    title: "UI/UX Designer",
                    company: "Gojek Indonesia",
                    location: "Jakarta Selatan",
                    salary: "Rp 10.000.000 / bulan",
                    applicants: 55,
                  ),
                  JobCard(
                    title: "Mobile Developer (Flutter)",
                    company: "Traveloka",
                    location: "Yogyakarta",
                    salary: "Rp 9.500.000 / bulan",
                    applicants: 38,
                  ),
                  JobCard(
                    title: "Backend Engineer",
                    company: "Tokopedia",
                    location: "Jakarta Barat",
                    salary: "Rp 11.000.000 / bulan",
                    applicants: 60,
                  ),
                  JobCard(
                    title: "Project Manager",
                    company: "Bukalapak",
                    location: "Depok, Jawa Barat",
                    salary: "Rp 12.500.000 / bulan",
                    applicants: 25,
                  ),
                  JobCard(
                    title: "Data Analyst",
                    company: "Shopee Indonesia",
                    location: "Tangerang Selatan",
                    salary: "Rp 10.200.000 / bulan",
                    applicants: 48,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
