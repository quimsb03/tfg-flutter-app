import 'dart:async';
import 'package:flutter/material.dart';
import 'register_screen.dart'; // Assegura't d'importar la pantalla de registre

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final List<Color> _backgroundColors = [
    Colors.blue.shade100,
    Colors.purple.shade100,
    Colors.pink.shade100,
    Colors.red.shade100,
    Colors.orange.shade100,
    Colors.yellow.shade100,
    Colors.green.shade100,
    Colors.teal.shade100,
    Colors.cyan.shade100,
    Colors.indigo.shade100,
  ];
  int _currentColorIndex = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      setState(() {
        _currentColorIndex = (_currentColorIndex + 1) % _backgroundColors.length;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: AnimatedContainer(
        duration: const Duration(seconds: 2),
        curve: Curves.easeInOut,
        color: _backgroundColors[_currentColorIndex],
        child: Center(
          child: Container(
            width: 350,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.9),
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Login',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                const TextField(
                  decoration: InputDecoration(labelText: 'Email'),
                ),
                const SizedBox(height: 10),
                const TextField(
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('LOGIN'),
                ),
                const SizedBox(height: 10),
                const Text('OR'),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage('assets/google_logo.png'),
                      backgroundColor: Colors.transparent,
                    ),
                    SizedBox(width: 10),
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage('assets/facebook_logo.png'),
                      backgroundColor: Colors.transparent,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    // Navegar a la pantalla de registre
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const RegisterScreen()),
                    );
                  },
                  child: const Text(
                    "Are you not registered? Sign Up",
                    style: TextStyle(fontSize: 16, color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
