import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.logout,
              color: Colors.red[900],
            ),
            onPressed: () {
              Get.offAllNamed('/');
            },
          ),
        ],
      ),
      body: Center(
        child: Text(
          'Welcome!',
          style: TextStyle(fontSize: 20.sp),
        ),
      ),
    );
  }
}
