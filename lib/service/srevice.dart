import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:login_registration/m/register_user_response.dart';

import 'package:login_registration/m/verify_response.dart';

import '../m/registeruser.dart';

class Service extends GetxService {
  final dio = Dio();
  String token = "";

  Future<void> sendOtp(String phone) async {
    try {
      String url =
          "http://ec2-3-110-123-252.ap-south-1.compute.amazonaws.com/api/passengers/sendOtp";
      await dio.post(url, data: {"phone": phone});
    } catch (e) {
      log("Error sending OTP: ${e.toString()}");
      throw Exception("Failed to send OTP");
    }
  }

  Future<VerifyResponse> verifyOtp(String phone, String otp) async {
    String url =
        "http://ec2-3-110-123-252.ap-south-1.compute.amazonaws.com/api/passengers/verifyOtp";
    Map<String, String> payload = {"phone": phone, "otp": otp};
    VerifyResponse verifyResponse = VerifyResponse();
    try {
      var response = await dio.post(url, data: payload);
      if (response.statusCode == 200) {
        verifyResponse = VerifyResponse.fromJson(response.data);
        token = verifyResponse.token ?? "";
      } else {
        log("Error verifying OTP: ${response.statusCode} - ${response.data}");
        throw Exception("Failed to verify OTP: ${response.data['message']}");
      }
    } catch (e) {
      log("Error during OTP verification: ${e.toString()}");
      throw Exception("Failed to verify OTP");
    }
    return verifyResponse;
  }

  Future<RegisterUserResponse> registerUser(RegisterUserPayload payload) async {
    String url =
        "http://ec2-3-110-123-252.ap-south-1.compute.amazonaws.com/api/passengers/details";
    RegisterUserResponse userResponse = RegisterUserResponse();
    try {
      log("Registering user with payload: ${payload.toJson()}");
      var response = await dio.post(
        url,
        data: payload.toJson(),
        options: Options(headers: {
          'Authorization': 'Bearer $token', // Ensure the token is valid
        }),
      );

      if (response.statusCode == 200) {
        userResponse = RegisterUserResponse.fromJson(response.data);
      } else {
        log("Error during registration: ${response.statusCode} - ${response.data}");
        throw Exception("Failed to register user: ${response.data['message']}");
      }
    } catch (e) {
      log("Error during registration: ${e.toString()}");
      throw Exception("Failed to register user");
    }
    return userResponse;
  }
}
