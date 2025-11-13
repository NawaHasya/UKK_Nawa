import 'package:flutter/material.dart';

class SeekerPortfolio extends StatelessWidget {
  const SeekerPortfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E1E1E),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "My Portfolio",
          style: TextStyle(
            color: Colors.yellowAccent,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Here’s a collection of your work and experience.",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 25),

            // Daftar portofolio (card)
            Expanded(
              child: ListView(
                children: const [
                  PortfolioCard(
                    project: "Mental Health App (Sedjiwa)",
                    role: "Frontend Developer • Flutter",
                    year: "2024",
                  ),
                  PortfolioCard(
                    project: "Job Seeker Platform (HireLink)",
                    role: "UI/UX Designer • Figma",
                    year: "2025",
                  ),
                  PortfolioCard(
                    project: "Marketing Video Project",
                    role: "Videographer • Editor",
                    year: "2023",
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // Tombol Add Portfolio
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellowAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: Colors.yellowAccent,
                      content: Text(
                        "Add Portfolio clicked!",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.add, color: Colors.black),
                label: const Text(
                  "Add Portfolio",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
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

class PortfolioCard extends StatelessWidget {
  final String project;
  final String role;
  final String year;

  const PortfolioCard({
    super.key,
    required this.project,
    required this.role,
    required this.year,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF2A2A2A),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.yellowAccent, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            project,
            style: const TextStyle(
              color: Colors.yellowAccent,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            role,
            style: const TextStyle(color: Colors.white70, fontSize: 15),
          ),
          const SizedBox(height: 6),
          Text(
            year,
            style: const TextStyle(color: Colors.white54, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
