import 'package:flutter/material.dart';
import 'package:flutter_core_eis/services/api_services/api_services.dart';

class SignUpProvider extends ChangeNotifier {
  // Business Logic
  ApiServices apiServices = ApiServices.apiServices;
  // Form Key
  GlobalKey<FormState> signUpNameFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> signUpEmailFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> signUpPasswordFormKey = GlobalKey<FormState>();

  // Controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  // Others
  bool? isMasked = false;

  // LoginAPI
  // void signupFun(String email, String password) async {
  //   Map<String, dynamic> postData = {
  //     "email": email,
  //     "password": password,
  //   };

  //   try {
  //     Response response = await apiServices.providePostRequest(
  //         APIEndpoints.loginUser, postData);

  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       // Navigate to dashboard
  //     } else {
  //       // Show error message form the API.
  //     }
  //   } catch (e) {
  //     throw e;
  //   }
  // }

  // Change masking
  void changeMasking() {
    isMasked == true ? isMasked = false : isMasked = true;
    notifyListeners();
  }
}
