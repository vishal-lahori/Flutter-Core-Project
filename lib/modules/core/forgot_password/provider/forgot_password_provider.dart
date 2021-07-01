import 'package:flutter/material.dart';
import 'package:flutter_core_eis/services/api_services/api_services.dart';

class ForgotPasswordProvider extends ChangeNotifier {
  // Business Logic
  ApiServices apiServices = ApiServices.apiServices;
  // Form Key
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  // Controllers
  TextEditingController emailController = TextEditingController();
}
