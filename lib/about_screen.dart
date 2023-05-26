import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AboutDialog(
                applicationName: 'Movie App',
                applicationVersion: '1.0.0+1',
                applicationIcon: CircleAvatar(
                  child: Image.asset(
                    'assets/tmdb.jpg',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
                applicationLegalese: '© 2023 DanielShahzada. All rights reserved.',
              ),
            );
          },
          child: const Text('Show About Dialog'),
        ),
      ),
    );
  }
}


