import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "This page doesn't exist",
              style: const TextStyle(fontSize: 30),
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton.icon(
              icon: const Icon(Icons.home_outlined),
              label: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Go back to the first page',
                  style: const TextStyle(fontSize: 20),
                ),
              ),
              onPressed: () => context.go('/'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Theme.of(context).primaryColor),
              ),
            )
          ],
        ),
      ),
    );
  }
}
