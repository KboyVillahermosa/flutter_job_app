import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'auth/auth_page.dart';  // Make sure this path is correct

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Supabase.initialize(
    url: 'https://orbpkkhlbplyewcpitct.supabase.co',  // Replace with your actual URL
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9yYnBra2hsYnBseWV3Y3BpdGN0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDU4NTQ3ODksImV4cCI6MjA2MTQzMDc4OX0.IhaJoOi98tHW4T9WXwb7aZwkQRcjDSa4vrkD1oTizmc',  // Replace with your actual key
  );
  
  runApp(const MyApp());
}

// Access client anywhere in your app
final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Local Service Marketplace',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const AuthPage(),  // This should navigate to your AuthPage
    );
  }
}
