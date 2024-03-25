import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile Page")),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Container(
              child: Text(
                "Subscribe to Our Newsletter!",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            new Image.asset("assets/images/newsletter.jpg"),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border
                    .all(), // Optionally, you can specify border properties
              ),
              child: TextField(
                  // TextField properties...
                  ),
            )
          ],
        ),
      ),
    );
  }
}
