import 'package:flutter/material.dart';
import 'screens/question/question_screen.dart'; 
import 'screens/edit_quiz/edit_quiz_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Navigation App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navegamos a la pantalla QuestionScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const QuestionScreen()),
                );
              },
              child: const Text('Go to Question'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navegamos a la pantalla de editar el cuestionario
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const EditQuizScreen()),
                );
              },
              child: const Text('Edit Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
