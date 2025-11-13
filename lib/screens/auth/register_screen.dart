import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../job_seeker/seeker_dashboard.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();

  String selectedGender = "MALE";
  DateTime? selectedDate;
  bool showForm = false;
  String selectedRole = "";
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 🌆 Background
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/splash.jpeg"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // 🔹 Konten utama
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 400),
            child:
                showForm ? _buildRegisterForm(context) : _buildRoleSelection(),
          ),
        ],
      ),
    );
  }

  // 🟡 STEP 1: PILIH ROLE
  Widget _buildRoleSelection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text: "Hire",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: "Link",
                  style: TextStyle(
                      color: Color(0xFFFFE100),
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          const Center(
            child: Text(
              "Select Role",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(height: 50),

          // Company
          GestureDetector(
            onTap: () => setState(() {
              selectedRole = "Company";
              showForm = true;
            }),
            child: _roleCard(
              color: const Color(0xFFFFE100),
              icon: Icons.business_center,
              title: "Company",
              subtitle: "Job posting",
              iconColor: Colors.white,
              textColor: Colors.black,
            ),
          ),
          const SizedBox(height: 20),

          // Society
          GestureDetector(
            onTap: () => setState(() {
              selectedRole = "Society";
              showForm = true;
            }),
            child: _roleCard(
              color: Colors.white,
              icon: Icons.person_outline,
              title: "Society",
              subtitle: "Search and apply for jobs",
              iconColor: Colors.black,
              textColor: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _roleCard({
    required Color color,
    required IconData icon,
    required String title,
    required String subtitle,
    required Color iconColor,
    required Color textColor,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: iconColor, size: 40),
          const SizedBox(height: 10),
          Text(title,
              style: TextStyle(
                  color: textColor, fontSize: 20, fontWeight: FontWeight.bold)),
          Text(subtitle,
              style:
                  TextStyle(color: textColor.withOpacity(0.8), fontSize: 14)),
        ],
      ),
    );
  }

  // 🟡 STEP 2: FORM REGISTER
  Widget _buildRegisterForm(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 70),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () => setState(() => showForm = false),
              icon: const Icon(Icons.arrow_back, color: Colors.white),
            ),
            const SizedBox(height: 10),

            // Title
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: "Hire",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: "Link",
                    style: TextStyle(
                        color: Color(0xFFFFE100),
                        fontSize: 32,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),

            const Text("Create Account",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.w600)),
            const SizedBox(height: 30),

            _buildInputField(nameController, "Full name", Icons.person_outline),
            const SizedBox(height: 15),
            _buildInputField(emailController, "Email", Icons.email_outlined),
            const SizedBox(height: 15),
            _buildInputField(passwordController, "Password", Icons.lock_outline,
                obscureText: true),
            const SizedBox(height: 15),
            _buildInputField(phoneController, "Phone", Icons.phone),
            const SizedBox(height: 15),
            _buildDatePicker(context),
            const SizedBox(height: 15),
            _buildGenderDropdown(),
            const SizedBox(height: 15),
            _buildInputField(
                addressController, "Address", Icons.location_on_outlined),
            const SizedBox(height: 35),

            // 🟨 Tombol Sign Up (tanpa API)
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFE100),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  elevation: 0,
                ),
                onPressed: isLoading
                    ? null
                    : () async {
                        setState(() => isLoading = true);
                        await Future.delayed(const Duration(seconds: 1));
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("✅ Register Berhasil (Simulasi)"),
                          ),
                        );
                        setState(() => isLoading = false);

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const SeekerDashboard()),
                        );
                      },
                child: isLoading
                    ? const CircularProgressIndicator(color: Colors.black)
                    : const Text(
                        "Sign Up",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🔹 Custom Input Field
  Widget _buildInputField(
      TextEditingController controller, String hint, IconData icon,
      {bool obscureText = false}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Container(
        color: Colors.white,
        child: TextField(
          controller: controller,
          obscureText: obscureText,
          style: const TextStyle(color: Colors.black),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.black54),
            prefixIcon: Icon(icon, color: Colors.black),
            border: InputBorder.none,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          ),
        ),
      ),
    );
  }

  // 📅 Date Picker
  Widget _buildDatePicker(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Container(
        color: Colors.white,
        child: ListTile(
          leading: const Icon(Icons.calendar_today, color: Colors.black),
          title: Text(
            selectedDate == null
                ? "Select Date of Birth"
                : DateFormat('yyyy-MM-dd').format(selectedDate!),
            style: const TextStyle(color: Colors.black87),
          ),
          onTap: () async {
            final picked = await showDatePicker(
              context: context,
              initialDate: DateTime(2010),
              firstDate: DateTime(1980),
              lastDate: DateTime.now(),
            );
            if (picked != null) {
              setState(() => selectedDate = picked);
            }
          },
        ),
      ),
    );
  }

  // ⚧ Gender Dropdown
  Widget _buildGenderDropdown() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: DropdownButtonFormField<String>(
          value: selectedGender,
          items: const [
            DropdownMenuItem(value: "MALE", child: Text("Male")),
            DropdownMenuItem(value: "FEMALE", child: Text("Female")),
          ],
          decoration: const InputDecoration(
              border: InputBorder.none, icon: Icon(Icons.wc)),
          onChanged: (val) => setState(() => selectedGender = val!),
        ),
      ),
    );
  }
}
