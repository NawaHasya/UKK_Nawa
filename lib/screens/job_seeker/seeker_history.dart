import 'package:flutter/material.dart';

class SeekerHistory extends StatelessWidget {
  const SeekerHistory({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> applications = [
      {
        "title": "Frontend Developer",
        "company": "PT Telkom Indonesia",
        "status": "Accepted",
        "date": "10 Okt 2025",
      },
      {
        "title": "UI/UX Designer",
        "company": "Gojek Indonesia",
        "status": "Pending",
        "date": "7 Okt 2025",
      },
      {
        "title": "Mobile Developer (Flutter)",
        "company": "Traveloka",
        "status": "Rejected",
        "date": "2 Okt 2025",
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E1E1E),
        elevation: 0,
        title: const Text(
          "Application History",
          style: TextStyle(
            color: Colors.yellowAccent,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.yellowAccent),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: applications.length,
          itemBuilder: (context, index) {
            final app = applications[index];
            final statusColor = _getStatusColor(app["status"]!);

            return Container(
              margin: const EdgeInsets.only(bottom: 15),
              decoration: BoxDecoration(
                color: const Color(0xFF2A2A2A),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.white10),
              ),
              child: ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                title: Text(
                  app["title"]!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 4),
                    Text(
                      app["company"]!,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          app["date"]!,
                          style: const TextStyle(
                            color: Colors.white38,
                            fontSize: 12,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            color: statusColor.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: statusColor, width: 1),
                          ),
                          child: Text(
                            app["status"]!,
                            style: TextStyle(
                              color: statusColor,
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // 🎨 Fungsi warna status
  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case "accepted":
        return Colors.greenAccent;
      case "pending":
        return Colors.yellowAccent;
      case "rejected":
        return Colors.redAccent;
      default:
        return Colors.white;
    }
  }
}
