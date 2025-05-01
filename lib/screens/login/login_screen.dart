import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  Widget _buildLoginCard({
    required String title,
    required Color color,
    required String buttonText,
    required String logo1,
    required String logo2,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        color: color.withOpacity(0.1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Aquí afegim el títol dins del requadre
            Container(
              height: 40,
              width: double.infinity,
              decoration: BoxDecoration(
                color: color.withOpacity(0.3),
                borderRadius: BorderRadius.circular(8),
              ),
              alignment: Alignment.center,
              child: Text(
                'Login AS $title',
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
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
              child: Text(buttonText),
            ),
            const SizedBox(height: 10),
            const Text('OR'),
            const SizedBox(height: 10),
            // Botons amb logos de Google i Facebook
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage(logo1), // Logo Google
                ),
                SizedBox(width: 10),
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage(logo2), // Logo Facebook
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text("Are you not registered? Sign Up"),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Tornar enrere
          },
        ),
      ),
      body: Row(
        children: [
          _buildLoginCard(
            title: 'USER',
            color: Colors.blue,
            buttonText: 'LOGIN',
            logo1: 'assets/google_logo.png', // Afegir el logo de Google a la carpeta assets
            logo2: 'assets/facebook_logo.png', // Afegir el logo de Facebook a la carpeta assets
          ),
          const VerticalDivider(width: 1, thickness: 1),
          _buildLoginCard(
            title: 'TEACHER',
            color: Colors.red,
            buttonText: 'LOGIN',
            logo1: 'assets/google_logo.png', // Afegir el logo de Google a la carpeta assets
            logo2: 'assets/facebook_logo.png', // Afegir el logo de Facebook a la carpeta assets
          ),
        ],
      ),
    );
  }
}
