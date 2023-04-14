import 'package:flutter/material.dart';

class ErrorItem extends StatelessWidget {
  const ErrorItem({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error,
            size: 100,
            color: Colors.grey[300],
          ),
          const Text(
            'Something went wrong\n Check connection and try again',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
