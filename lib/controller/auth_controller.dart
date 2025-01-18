import 'dart:developer';
import 'package:get/get.dart';
import 'package:login_registration/model/register_user_response.dart';
import 'package:login_registration/model/verify_response.dart';
import 'package:login_registration/service/srevice.dart';

import '../model/registeruser.dart';

class AuthController extends GetxController {
  var otpsend = false.obs;
  String token = "";
  VerifyResponse response = VerifyResponse();
  RegisterUserResponse userResponse = RegisterUserResponse();

  Service service = Service();

  void sendOtp(String phone) {
    service.sendOtp(phone).then((response) {
      otpsend.value = true;
    }).catchError((error) {
      // Log any error that occurs
      log("sendOtp error: $error");
    });
  }

  void verifyOtp(String phone, String otp) async {
    try {
      response = await service.verifyOtp(phone, otp);
      // Log the response from the verifyOtp API
      log("verifyOtp response: ${response.toJson()}");

      token = response.token ?? "";
    } catch (error) {
      // Log any error that occurs
      log("verifyOtp error: $error");
    }
  }

  void registerUser(RegisterUserPayload payload) async {
    try {
      userResponse = await service.registerUser(payload);
      // Log the response from the registerUser  API
      log("registerUser  response: ${userResponse.toJson()}");
    } catch (error) {}
  }
}
