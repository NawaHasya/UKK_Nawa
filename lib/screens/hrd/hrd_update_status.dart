import 'package:flutter/material.dart';

class HrdUpdateStatusPage extends StatefulWidget {
  const HrdUpdateStatusPage({super.key});

  @override
  State<HrdUpdateStatusPage> createState() => _HrdUpdateStatusPageState();
}

class _HrdUpdateStatusPageState extends State<HrdUpdateStatusPage> {
  // Contoh data pelamar (bisa diganti nanti dari API)
  List<Map<String, String>> applicants = [
    {
      "name": "Arnawa Hasya Dian Satyatama",
      "position": "Frontend Developer",
      "email": "arnawahasya29@gmail.com",
      "status": "Pending",
      "date": "12 Okt 2025"
    },
    {
      "name": "Zaki Pratama",
      "position": "UI/UX Designer",
      "email": "zaki@gmail.com",
      "status": "Interview",
      "date": "10 Okt 2025"
    },
    {
      "name": "Brian Wiratama",
      "position": "Backend Developer",
      "email": "brian@gmail.com",
      "status": "Accepted",
      "date": "8 Okt 2025"
    },
  ];

  // Warna status
  Color _getStatusColor(String status) {
    switch (status) {
      case "Pending":
        return Colors.orangeAccent;
      case "Interview":
        return Colors.blueAccent;
      case "Accepted":
        return Colors.greenAccent;
      case "Rejected":
        return Colors.redAccent;
      default:
        return Colors.grey;
    }
  }

  // Dialog ubah status
  void _updateStatusDialog(int index) {
    String currentStatus = applicants[index]["status"]!;
    String selectedStatus = currentStatus;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF2A2A2A),
        title: const Text(
          "Update Status",
          style: TextStyle(color: Colors.yellowAccent, fontWeight: FontWeight.bold),
        ),
        content: DropdownButtonFormField<String>(
          value: selectedStatus,
          dropdownColor: const Color(0xFF2A2A2A),
          style: const TextStyle(color: Colors.white),
          items: const [
            DropdownMenuItem(value: "Pending", child: Text("Pending")),
            DropdownMenuItem(value: "Interview", child: Text("Interview")),
            DropdownMenuItem(value: "Accepted", child: Text("Accepted")),
            DropdownMenuItem(value: "Rejected", child: Text("Rejected")),
          ],
          decoration: const InputDecoration(
            labelText: "Status",
            labelStyle: TextStyle(color: Colors.white70),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.yellowAccent),
            ),
          ),
          onChanged: (value) => selectedStatus = value!,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel", style: TextStyle(color: Colors.white70)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.yellowAccent,
              foregroundColor: Colors.black,
            ),
            onPressed: () {
              setState(() {
                applicants[index]["status"] = selectedStatus;
              });
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.yellowAccent,
                  content: Text(
                    "Status ${applicants[index]['name']} diubah menjadi $selectedStatus",
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              );
            },
            child: const Text("Update"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E1E1E),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Update Applicant Status",
          style: TextStyle(
            color: Colors.yellowAccent,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: applicants.length,
          itemBuilder: (context, index) {
            final applicant = applicants[index];
            return Container(
              margin: const EdgeInsets.only(bottom: 15),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF2A2A2A),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.yellowAccent, width: 1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Nama dan posisi
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        applicant["name"]!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: _getStatusColor(applicant["status"]!),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          applicant["status"]!,
                          style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    applicant["position"]!,
                    style: const TextStyle(color: Colors.white70, fontSize: 15),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    applicant["email"]!,
                    style: const TextStyle(color: Colors.white54, fontSize: 14),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "Applied on: ${applicant["date"]!}",
                    style: const TextStyle(color: Colors.white38, fontSize: 13),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.edit, color: Colors.black),
                      label: const Text(
                        "Update Status",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellowAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () => _updateStatusDialog(index),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
