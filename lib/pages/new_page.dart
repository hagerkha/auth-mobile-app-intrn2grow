import 'package:flutter/material.dart';

class NewPage extends StatelessWidget {
  final String username;
  final String password;
  final String email;

  const NewPage({
    Key? key,
    required this.username,
    required this.password,
    required this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff), // Background color set to white
      body: Column(
        children: [
          Expanded(
            flex: 0,
            child: Container(
              width: double.infinity,
              child: Image.asset(
                'assets/png.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "Ahmed Saber",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                CustomTextField(
                  label: "Email",
                  hint: "Enter email",
                  controller: TextEditingController(text: email),
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  label: "Username",
                  hint: "Enter username",
                  controller: TextEditingController(text: username),
                ),
                CustomTextField(
                  label: "Gender",
                  hint: "Enter gender",
                  controller: TextEditingController(),
                ),
                const SizedBox(height: 20),
                Center(
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      onPressed: () {
                        // Logic for log out
                      },
                      child: const Text(
                        "Log out",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white, // Text color for the button
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 0,
            child: Container(),
          ),
        ],
      ),
    );
  }
}

// Ensure CustomTextField is defined somewhere in your project
class CustomTextField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;

  const CustomTextField({
    Key? key,
    required this.label,
    required this.hint,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 5),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(
                color: Colors.grey.shade400,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(
                color: Colors.blue,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
