import 'package:flutter/material.dart';

class StoreActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color backgroundColor;
  final bool isLoading;
  final Future<void> Function()? onPressed;

  const StoreActionButton({
    super.key,
    required this.icon,
    required this.label,
    required this.backgroundColor,
    required this.isLoading,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: isLoading ? null : onPressed,
        icon: Icon(icon),
        label: Text(label),
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
      ),
    );
  }
}
