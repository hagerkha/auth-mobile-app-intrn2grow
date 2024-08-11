import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _rememberMe = false; // Track "Remember me" checkbox state
  bool _passwordVisible = false; // Track password visibility

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff), // Background color set to white
      body: Column(
        children: [
          Expanded(
            flex: 0, // Allows the image to take up more space
            child: Container(
              width: double.infinity, // Ensures the image fills the width
              child: Image.asset(
                'assets/png.jpg',
                fit: BoxFit.cover, // Fills the container while preserving aspect ratio
              ),
            ),
          ),
          const SizedBox(height: 20), // Space between image and text
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Align(
              alignment: Alignment.center, // Aligns text to the center
              child: Text(
                "Log in to your account",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold, // Bold text style
                  color: Colors.black, // Black color for text
                ),
              ),
            ),
          ),
          const SizedBox(height: 20), // Add space between text and text fields
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextField(
                  label: "Username",
                  hint: "Enter username",
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      // Logic to clear username input
                    },
                  ),
                ),
                const SizedBox(height: 10), // Space between text fields
                CustomTextField(
                  label: "Password",
                  hint: "Enter password",
                  obscureText: !_passwordVisible, // Toggle password visibility
                  suffixIcon: IconButton(
                    icon: Icon(
                      _passwordVisible ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _passwordVisible = !_passwordVisible; // Toggle state
                      });
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: _rememberMe,
                          onChanged: (value) {
                            setState(() {
                              _rememberMe = value!;
                            });
                          },
                        ),
                        const Text("Remember me"),
                      ],
                    ),
                    TextButton(
                      onPressed: () {
                        // Logic for forget password
                      },
                      child: const Text("Forget password?"),
                    ),
                  ],
                ),
                const SizedBox(height: 20), // Space before the login button
                Center(
                  child: SizedBox(
                    width: double.infinity, // Make the button fill the available width
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue, // Blue color for button
                        padding: const EdgeInsets.symmetric(vertical: 16), // Increase button height
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0), // Rounded corners
                        ),
                      ),
                      onPressed: () {
                        // Navigate to the new page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NewPage(),
                          ),
                        );
                      },
                      child: const Text(
                        "Log in",
                        style: TextStyle(fontSize: 18), // Text size for the button
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20), // Space between buttons
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account?"),
                      TextButton(
                        onPressed: () {
                          // Navigate to the sign-up page
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const SignUpPage()),
                          );
                        },
                        child: const Text("Sign up"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 0, // Fills remaining space
            child: Container(),
          ),
        ],
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String label;
  final String hint;
  final bool obscureText;
  final Widget? suffixIcon;

  const CustomTextField({
    Key? key,
    required this.label,
    required this.hint,
    this.obscureText = false,
    this.suffixIcon,
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
            color: Colors.black87, // Darker shade of black for labels
          ),
        ),
        const SizedBox(height: 5), // Space between label and text field
        TextField(
          obscureText: obscureText, // Hide text for password fields
          decoration: InputDecoration(
            hintText: hint,
            suffixIcon: suffixIcon, // Add the provided suffix icon
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0), // Rounded corners
              borderSide: BorderSide(
                color: Colors.grey.shade400, // Light gray border color
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0), // Rounded corners
              borderSide: const BorderSide(
                color: Colors.blueAccent, // Blue border color when focused
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff), // Background color set to white
      body: Column(
        children: [
          Expanded(
            flex: 0, // Allows the image to take up more space
            child: Container(
              width: double.infinity, // Ensures the image fills the width
              child: Image.asset(
                'assets/png.jpg',
                fit: BoxFit.cover, // Fills the container while preserving aspect ratio
              ),
            ),
          ),
          const SizedBox(height: 20), // Space between image and text
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Align(
              alignment: Alignment.center, // Aligns text to the center
              child: Text(
                "Sign up for a new account",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold, // Bold text style
                  color: Colors.black, // Black color for text
                ),
              ),
            ),
          ),
          const SizedBox(height: 20), // Add space between text and text fields
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextField(
                  label: "Email",
                  hint: "Enter email",
                ),
                const SizedBox(height: 10), // Space between text fields
                CustomTextField(
                  label: "Username",
                  hint: "Enter username",
                ),
                const SizedBox(height: 10), // Space between text fields
                CustomTextField(
                  label: "Password",
                  hint: "Enter password",
                  obscureText: true,
                ),
                const SizedBox(height: 20), // Space before the sign-up button
                Center(
                  child: SizedBox(
                    width: double.infinity, // Make the button fill the available width
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue, // Blue color for button
                        padding: const EdgeInsets.symmetric(vertical: 16), // Increase button height
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0), // Rounded corners
                        ),
                      ),
                      onPressed: () {
                        // Navigate to the new page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NewPage(),
                          ),
                        );
                      },
                      child: const Text(
                        "Sign up",
                        style: TextStyle(fontSize: 18), // Text size for the button
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 0, // Fills remaining space
            child: Container(),
          ),
        ],
      ),
    );
  }
}

class NewPage extends StatelessWidget {
  const NewPage({Key? key}) : super(key: key);

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
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  label: "Username",
                  hint: "Enter username",
                ),
                CustomTextField(
                  label: "Gender",
                  hint: "Enter gender",
                ),
                const SizedBox(height: 20),
                Center(
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
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
                        style: TextStyle(fontSize: 18),

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
