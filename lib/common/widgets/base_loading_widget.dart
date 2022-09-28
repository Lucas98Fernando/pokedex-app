import 'package:flutter/material.dart';

class BaseLoading extends StatelessWidget {
  const BaseLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Image.asset('assets/images/pokeball.png'),
            ),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
