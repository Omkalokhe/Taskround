import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/auth_controller.dart';
import '../model/registeruser.dart';


class RegisterScreen extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController referralCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text ('Register')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(labelText: 'Phone Number'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: referralCodeController,
              decoration: InputDecoration(labelText: 'Referral Code'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                if (nameController.text.isEmpty || emailController.text.isEmpty || 
                    phoneController.text.isEmpty || referralCodeController.text.isEmpty) {
                  Get.snackbar("Error", "Please fill in all fields");
                  return;
                }
                RegisterUserPayload payload = RegisterUserPayload(
                  name: nameController.text,
                  email: emailController.text,
                  phone: phoneController.text,
                  refferalCode: referralCodeController.text,
                );

                try {
                  authController.registerUser (payload);
                  Get.snackbar("Success", "User  registered successfully");
                } catch (error) {
                  Get.snackbar("Error", error.toString());
                }
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}