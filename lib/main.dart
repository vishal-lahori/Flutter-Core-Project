import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_core_eis/config/provider_states.dart';
import 'package:flutter_core_eis/config/theme_config/theme_provider.dart';
import 'package:flutter_core_eis/config/theme_config/themes.dart';
import 'package:flutter_core_eis/modules/core/forgot_password/view/forgot_password.dart';
import 'package:flutter_core_eis/modules/core/login/view/login_view.dart';
import 'package:flutter_core_eis/modules/core/signup/view/signup_view.dart';
import 'package:flutter_core_eis/modules/dashboard/view/dashboard_view.dart';
import 'package:flutter_core_eis/services/fcm_services/fcm_services.dart';
import 'package:flutter_core_eis/utils/appUtils.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());

  if (!kIsWeb) {
    FCMService().initializeFCMService();
  } else {
    FirebaseMessaging.instance.getToken().then(print);
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = new DarkThemeProvider();

  @override
  void initState() {
    super.initState();

    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.themePreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: ProviderState().providerStateList,
      child: Consumer<DarkThemeProvider>(
        builder: (context, themeProvider, _) {
          return MaterialApp(
            title: 'Flutter Core',
            debugShowCheckedModeBanner: false,
            theme: Themes.themeData(themeProvider.darkTheme, context),
            home: SplashScreen(),
            navigatorObservers: [AppUtils().routeObserver],
            initialRoute: '/',
            routes: {
              '/login': (context) => LoginView(),
              '/forgot-password': (context) => ForgotPasswordView(),
              '/sign-up': (context) => SignUpView(),
              '/dashboard': (context) => DashboardView(),
            },
          );
        },
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3)).then(
      (value) => Navigator.pushNamedAndRemoveUntil(
          context, "/login", (route) => false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Splash Screen"),
      ),
    );
  }
}
