import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile Page")),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Subscribe to Our Newsletter!",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.asset("assets/images/newsletter.jpg",
                    fit: BoxFit.cover),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter your email',
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Get.dialog(
                      AlertDialog(
                        title: Text('Alert'),
                        content: Text('Subscribe to our newsletter?'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              // Close Alert Dialog
                              Get.back();
                            },
                            child: Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              // Perform subscription logic
                              // Close Alert Dialog
                              Get.back();
                            },
                            child: Text('Subscribe'),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Text("Subscribe to our newsletter"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
