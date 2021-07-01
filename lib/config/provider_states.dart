import 'package:flutter_core_eis/config/theme_config/theme_provider.dart';
import 'package:flutter_core_eis/modules/core/forgot_password/provider/forgot_password_provider.dart';
import 'package:flutter_core_eis/modules/core/login/provider/login_provider.dart';
import 'package:flutter_core_eis/modules/core/signup/provider/signup_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class ProviderState {
  List<SingleChildWidget> providerStateList = [
    // All the change notifiers will be created here.

    ChangeNotifierProvider<DarkThemeProvider>(
        create: (_) => DarkThemeProvider()),

    ChangeNotifierProvider<LoginProvider>(create: (_) => LoginProvider()),
    ChangeNotifierProvider<SignUpProvider>(create: (_) => SignUpProvider()),
    ChangeNotifierProvider<ForgotPasswordProvider>(
        create: (_) => ForgotPasswordProvider()),
  ];
}
