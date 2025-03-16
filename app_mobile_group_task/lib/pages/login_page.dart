import 'package:flutter/material.dart';
import 'home_page.dart'; // Pastikan ini sudah diimport

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isHiddenPassword = true;

  void _login() {
    String username = usernameController.text;
    String password = passwordController.text;

    if (username == "fulan" && password == "fulan") {
      // Pindah ke HomePage dengan membawa username
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(username: username), // Kirim username
        ),
      );
    } else {
      // Jika login gagal
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Username atau password salah!"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9C46A), // Warna latar belakang
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/upnLogo.png', height: 120),
              const SizedBox(height: 20),
              const Text(
                "Login",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF452C25),
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                "Login untuk mengakses lebih banyak fitur.",
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF6D4C3D),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  prefixIcon:
                      const Icon(Icons.person, color: Color(0xFF452C25)),
                  hintText: "Username",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: passwordController,
                obscureText: _isHiddenPassword,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock, color: Color(0xFF452C25)),
                  hintText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isHiddenPassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: const Color(0xFF452C25),
                    ),
                    onPressed: () {
                      setState(() {
                        _isHiddenPassword = !_isHiddenPassword;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 25),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _login,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF264653),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: const Text(
                    "Login",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
