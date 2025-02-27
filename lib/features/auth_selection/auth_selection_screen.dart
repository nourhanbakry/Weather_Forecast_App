import 'package:cellula_project/features/auth_selection/widgets/auth_selection_body.dart';
import 'package:cellula_project/features/auth_selection/widgets/determine_position.dart';
import 'package:flutter/material.dart';

class AuthSelectionScreen extends StatefulWidget {
  const AuthSelectionScreen({super.key});

  @override
  State<AuthSelectionScreen> createState() => _AuthSelectionScreenState();
}

class _AuthSelectionScreenState extends State<AuthSelectionScreen> {
  @override
  void initState() {
    determinePosition();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthSelectionBody(),
    );
  }
}
