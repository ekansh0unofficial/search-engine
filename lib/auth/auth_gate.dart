import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'authserivce.dart';

class AuthGate extends StatefulWidget {
  const AuthGate({super.key});

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  bool _isLoading = true;
  final _auth = FirebaseAuth.instance;
  User? _currentUser;

  @override
  void initState() {
    super.initState();
    _initAuth();
  }

  Future<void> _initAuth() async {
    await Authservice().signInAnonymous();
    setState(() {
      _isLoading = false;
      _currentUser = _auth.currentUser;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const Center(child: CircularProgressIndicator())
        : Scaffold(
            appBar: AppBar(title: const Text("Hello World")),
            body: Center(
              child: Text("UID: ${_currentUser?.uid ?? "Not signed in"}"),
            ),
          );
  }
}
