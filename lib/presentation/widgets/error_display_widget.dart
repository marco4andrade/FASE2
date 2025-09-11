import 'package:flutter/material.dart';

class ErrorDisplayWidget extends StatelessWidget {
  final String errorMessage;
  final VoidCallback onClearError;

  const ErrorDisplayWidget({
    super.key,
    required this.errorMessage,
    required this.onClearError,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Icon(Icons.error, color: Colors.red, size: 48),
        const SizedBox(height: 16),
        Text(
          errorMessage,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.red),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: onClearError,
          child: const Text('Limpiar Error'),
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}
