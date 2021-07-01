import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_core_eis/constants/shared_pref_keys.dart';
import 'package:flutter_core_eis/services/api_endpoints/api_endpoints.dart';
import 'package:flutter_core_eis/services/api_services/api_services.dart';
import 'package:flutter_core_eis/utils/appUtils.dart';

class LoginProvider extends ChangeNotifier {
  // Business Logic
  ApiServices apiServices = ApiServices.apiServices;
  // Form Key
  GlobalKey<FormState> loginEmailFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> loginPasswordFormKey = GlobalKey<FormState>();

  // Controllers
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  // Others
  bool? checkboxValue = false;
  bool? isMasked = false;

  // LoginAPI
  void loginFun(String email, String password) async {
    Map<String, dynamic> postData = {
      "email": email,
      "password": password,
    };

    try {
      Response response = await apiServices.providePostRequest(
          APIEndpoints.loginUser, postData);

      if (response.statusCode == 200 || response.statusCode == 201) {
        // Navigate to dashboard
        print("Response -- ${response.data}");
        if (response.data[SharedPrefKeys.access_token] != null) {
          Navigator.pushNamedAndRemoveUntil(
              AppUtils().routeObserver.navigator!.context,
              "/dashboard",
              (route) => false);
        }
      } else {
        // Show error message from the API.
        print("Response error -- $response");
      }
    } catch (e) {
      throw e;
    }
  }

  // Change checkbox value
  void changeCheckBoxValue(bool? value) {
    checkboxValue = value;
    notifyListeners();
  }

  // Change masking
  void changeMasking() {
    isMasked == true ? isMasked = false : isMasked = true;
    notifyListeners();
  }
}
