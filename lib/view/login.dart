import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:login_registration/controller/auth_controller.dart';
import 'package:sizer/sizer.dart';

import 'register.dart';


class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthController authController = AuthController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController otpController = TextEditingController();

  String phoneNumber = '';

  // To store the selected phone number with country code
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Text(
          'Login',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(), // Dismiss the keyboard
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 100.0,
                  backgroundImage: NetworkImage(
                      'https://media.istockphoto.com/id/1300845620/vector/user-icon-flat-isolated-on-white-background-user-symbol-vector-illustration.jpg?s=612x612&w=0&k=20&c=yBeyba0hUkh14_jgv1OKqIH0CCSWU_4ckRkAoy2p73o='), // Replace with your image path
                  // backgroundColor: Colors.grey[200],
                ),
                SizedBox(height: 4.h),
                IntlPhoneField(
                  controller: phoneController,
                  decoration: InputDecoration(
                    labelText: 'Phone no',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurpleAccent),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  initialCountryCode: 'IN', // Default country code
                  onChanged: (phone) {
                    phoneNumber = phone.completeNumber; // Full phone number
                  },
                ),
                SizedBox(height: 2.h),
                TextField(
                  controller: otpController,
                  decoration: InputDecoration(
                    labelText: 'OTP',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurpleAccent),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 4.h),
                ElevatedButton(
                  onPressed: () {
                     if (phoneController.text.isEmpty) {
                  Get.snackbar("Error", "Please enter your phone number");
                  return;
                }
                authController.sendOtp(phoneController.text);
              },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Text('Send OTP'),
                ),
                SizedBox(height: 2.h),
                 SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                if (otpController.text.isEmpty) {
                  Get.snackbar("Error", "Please enter the OTP");
                  return;
                }
                authController.verifyOtp(phoneController.text, otpController.text);
              },
              child: Text('Verify OTP'),
            ),
            SizedBox(height: 20),
                TextButton(
                  onPressed: () => Get.to(() => RegisterScreen()),
                  child: Text("Don't have an account? Register"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
