import 'package:flutter/material.dart';
import 'package:markti/core/routes_manager/routes.dart';

import '../../../../core/cache/secure_storage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Welcome to the Home Page!'),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/details');
              },
              child: const Text('Go to Details Page'),
            ),
            ElevatedButton(
              onPressed: () async{
                await secureStorage.delete(key: "token");
                Navigator.pushNamed(context, Routes.signIn);
              },
              child: const Text('logout'),
            ),
          ],
        ),
      ),
    );
  }
}
