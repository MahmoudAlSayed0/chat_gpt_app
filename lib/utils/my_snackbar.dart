import 'package:flutter/material.dart';

void mySnackBar(String message, BuildContext ctx, {bool isError = true}) {
  ScaffoldMessenger.of(ctx).showSnackBar(
    SnackBar(
      backgroundColor: isError ? Colors.red : Colors.green,
      content: Text(
        message,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
      duration: const Duration(seconds: 4),
      margin: const EdgeInsets.all(8)
          .copyWith(bottom: MediaQuery.of(ctx).viewInsets.bottom + 8),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      dismissDirection: DismissDirection.horizontal,
    ),
  );
}
