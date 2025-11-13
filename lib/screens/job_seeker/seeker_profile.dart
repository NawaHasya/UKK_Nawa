import 'package:flutter/material.dart';

class SeekerProfile extends StatefulWidget {
  const SeekerProfile({super.key});

  @override
  State<SeekerProfile> createState() => _SeekerProfileState();
}

class _SeekerProfileState extends State<SeekerProfile> {
  bool isEditing = false;

  final nameController = TextEditingController(text: "Arnawa Hasya Dian Satyatama");
  final emailController = TextEditingController(text: "arnawahasya29@gmail.com");
  final skillController = TextEditingController(text: "Flutter • UI/UX Design • Photography • Videography");
  final expController = TextEditingController(text: "Frontend Developer Intern at PT Telkom Indonesia\nAug 2024 - Present");
  final eduController = TextEditingController(text: "SMK Telkom Malang — Rekayasa Perangkat Lunak\n2023 - 2025");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111111),
      appBar: AppBar(
        backgroundColor: const Color(0xFF111111),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "My Profile",
          style: TextStyle(
            color: Color(0xFFFFE100),
            fontWeight: FontWeight.bold,
            fontFamily: "Poppins",
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              isEditing ? Icons.check_circle_outline : Icons.edit_outlined,
              color: Colors.yellowAccent,
            ),
            onPressed: () {
              setState(() {
                isEditing = !isEditing;
                if (!isEditing) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: Colors.yellowAccent,
                      content: Text(
                        "Profile updated successfully!",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  );
                }
              });
            },
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            // FOTO PROFIL
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.yellowAccent, width: 3),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/profile.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                if (isEditing)
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.yellowAccent,
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(6),
                    child: const Icon(Icons.camera_alt, color: Colors.black, size: 22),
                  ),
              ],
            ),
            const SizedBox(height: 20),

            // NAMA
            _buildProfileTextField(nameController, "Full Name", Icons.person_outline, editable: isEditing),
            const SizedBox(height: 10),

            // EMAIL
            _buildProfileTextField(emailController, "Email", Icons.email_outlined, editable: false),
            const SizedBox(height: 25),

            // CARD DETAIL
            _buildSectionCard("Skills", skillController, editable: isEditing),
            _buildSectionCard("Experience", expController, editable: isEditing),
            _buildSectionCard("Education", eduController, editable: isEditing),

            const SizedBox(height: 30),

            // Tombol Simpan / Edit
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: isEditing
                  ? ElevatedButton.icon(
                      key: const ValueKey(1),
                      onPressed: () {
                        setState(() => isEditing = false);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: Colors.yellowAccent,
                            content: Text(
                              "Profile changes saved!",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        );
                      },
                      icon: const Icon(Icons.save, color: Colors.black),
                      label: const Text(
                        "Save Changes",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Poppins",
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellowAccent,
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                    )
                  : ElevatedButton(
                      key: const ValueKey(2),
                      onPressed: () {
                        setState(() => isEditing = true);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellowAccent,
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      child: const Text(
                        "Edit Profile",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Poppins",
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  // ====================  COMPONENTS  ====================

  Widget _buildProfileTextField(TextEditingController controller, String label, IconData icon, {bool editable = true}) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF222222),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.yellowAccent.withOpacity(0.4), width: 1),
      ),
      child: TextField(
        controller: controller,
        enabled: editable,
        style: const TextStyle(color: Colors.white, fontSize: 16, fontFamily: "Poppins"),
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.yellowAccent),
          labelText: label,
          labelStyle: const TextStyle(color: Colors.yellowAccent, fontFamily: "Poppins"),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
        ),
      ),
    );
  }

  Widget _buildSectionCard(String title, TextEditingController controller, {bool editable = true}) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF222222),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.yellowAccent.withOpacity(0.5), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.yellowAccent,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: "Poppins",
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: controller,
            enabled: editable,
            maxLines: null,
            style: const TextStyle(color: Colors.white70, fontSize: 15, fontFamily: "Poppins"),
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: "Enter your details here...",
              hintStyle: TextStyle(color: Colors.white38),
            ),
          ),
        ],
      ),
    );
  }
}
