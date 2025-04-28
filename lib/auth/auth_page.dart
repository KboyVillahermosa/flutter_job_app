import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../main.dart';
import '../home/home_page.dart';
import 'login_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  User? _user;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _getAuth();
    supabase.auth.onAuthStateChange.listen((data) {
      setState(() {
        _user = data.session?.user;
      });
    });
  }

  Future<void> _getAuth() async {
    try {
      setState(() {
        _isLoading = true;
      });
      _user = supabase.auth.currentUser;
    } catch (e) {
      debugPrint('Error getting auth: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Show loading indicator while checking auth
    if (_isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }
    
    // Redirect to HomePage or LoginPage based on auth status
    return _user != null ? const HomePage() : const LoginPage();
  }
}