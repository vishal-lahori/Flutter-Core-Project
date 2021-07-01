import 'package:flutter/material.dart';
import 'package:flutter_core_eis/config/size_config.dart';
import 'package:flutter_core_eis/constants/colors.dart';
import 'package:flutter_core_eis/modules/core/signup/provider/signup_provider.dart';
import 'package:flutter_core_eis/utils/responsive_sizes.dart';
import 'package:provider/provider.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final isLargeScreen = SizeConfig.isLargeScreen;

    final Responsive responsiveSize = Responsive();
    final totalWidth = SizeConfig.screenWidth;
    final totalHeight = SizeConfig.screenHeight;

    double getWidthMobile(double pixels) {
      return responsiveSize.getResponsiveWidth(pixels, totalWidth, 414);
    }

    double getHeightMobile(double pixels) {
      return responsiveSize.getResponsiveHeight(pixels, totalHeight, 896);
    }

    double getWidthWeb(double pixels) {
      return responsiveSize.getResponsiveWidth(pixels, totalWidth, 1440);
    }

    double getHeightWeb(double pixels) {
      return responsiveSize.getResponsiveHeight(pixels, totalHeight, 900);
    }

    return Scaffold(
      body: SafeArea(
        child: Consumer<SignUpProvider>(
          builder: (context, signupProvider, _) {
            return Container(
              margin: isLargeScreen
                  ? EdgeInsets.all(0)
                  : EdgeInsets.symmetric(horizontal: getWidthMobile(30)),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        isLargeScreen
                            ? Expanded(
                                child: Container(
                                    color: Colors.grey[200],
                                    height: totalHeight,
                                    width: totalWidth),
                              )
                            : Container(),
                        Expanded(
                          child: Column(
                            children: [
                              SizedBox(
                                height: isLargeScreen
                                    ? getHeightWeb(60)
                                    : getHeightMobile(70),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        isLargeScreen ? getWidthWeb(60) : 0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      child: Image.asset(
                                        "assets/images/logo.png",
                                        height: isLargeScreen
                                            ? getHeightWeb(40)
                                            : getHeightMobile(40),
                                        width: isLargeScreen
                                            ? getWidthWeb(106)
                                            : getWidthMobile(106),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        "Need help?",
                                        style: TextStyle(
                                          fontSize: isLargeScreen
                                              ? getHeightWeb(18)
                                              : getHeightMobile(18),
                                          color: AppColors.kPrimaryAppColor,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: isLargeScreen
                                    ? getHeightWeb(111)
                                    : getHeightMobile(95.53),
                              ),
                              Center(
                                child: Text(
                                  "Signup Here",
                                  style: TextStyle(
                                    color: AppColors.kBtnColor,
                                    fontSize: isLargeScreen
                                        ? getHeightWeb(35)
                                        : getHeightMobile(30),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: isLargeScreen
                                    ? getHeightWeb(40)
                                    : getHeightMobile(35.5),
                              ),
                              Container(
                                margin: isLargeScreen
                                    ? EdgeInsets.only(
                                        left: getWidthWeb(166),
                                        right: getWidthWeb(154),
                                      )
                                    : EdgeInsets.all(0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Form(
                                      key: signupProvider.signUpNameFormKey,
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      child: TextFormField(
                                        controller:
                                            signupProvider.nameController,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          contentPadding: EdgeInsets.only(
                                            top: isLargeScreen
                                                ? getHeightWeb(16.92)
                                                : getHeightMobile(15.02),
                                            bottom: isLargeScreen
                                                ? getHeightWeb(17.08)
                                                : getHeightMobile(14.79),
                                          ),
                                          prefixIcon: Container(
                                            margin:
                                                EdgeInsets.only(right: 18.72),
                                            decoration: BoxDecoration(
                                                border: Border(
                                                    right: BorderSide(
                                                        color: Color(
                                                            0xFFE0E3E5)))),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 14.98,
                                                      vertical: 15.01),
                                              child: Image.asset(
                                                "assets/icons/ic_account_circle.png",
                                                height: isLargeScreen
                                                    ? getHeightWeb(25.43)
                                                    : getHeightMobile(22),
                                                width: isLargeScreen
                                                    ? getWidthWeb(25.43)
                                                    : getWidthMobile(22),
                                              ),
                                            ),
                                          ),
                                          hintText: "Enter Your Name",
                                          hintStyle: TextStyle(
                                            fontSize: isLargeScreen
                                                ? getHeightWeb(18)
                                                : getHeightMobile(16),
                                            color: AppColors.kPrimaryAppColor,
                                          ),
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFFE0E3E5),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            borderSide: BorderSide(
                                              color: AppColors.kBtnColor,
                                              width: 2.0,
                                            ),
                                          ),
                                        ),
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Please enter your name!!";
                                          }
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: isLargeScreen
                                          ? getHeightWeb(40)
                                          : getHeightMobile(35.5),
                                    ),
                                    Form(
                                      key: signupProvider.signUpEmailFormKey,
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      child: TextFormField(
                                        controller:
                                            signupProvider.emailController,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          contentPadding: EdgeInsets.only(
                                            top: isLargeScreen
                                                ? getHeightWeb(16.92)
                                                : getHeightMobile(15.02),
                                            bottom: isLargeScreen
                                                ? getHeightWeb(17.08)
                                                : getHeightMobile(14.79),
                                          ),
                                          prefixIcon: Container(
                                            margin:
                                                EdgeInsets.only(right: 18.72),
                                            decoration: BoxDecoration(
                                                border: Border(
                                                    right: BorderSide(
                                                        color: Color(
                                                            0xFFE0E3E5)))),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 14.98,
                                                      vertical: 15.01),
                                              child: Image.asset(
                                                "assets/icons/ic_email.png",
                                                height: isLargeScreen
                                                    ? getHeightWeb(18)
                                                    : getHeightMobile(18),
                                                width: isLargeScreen
                                                    ? getWidthWeb(21.15)
                                                    : getWidthMobile(18),
                                              ),
                                            ),
                                          ),
                                          hintText: "Enter Your Email",
                                          hintStyle: TextStyle(
                                            fontSize: isLargeScreen
                                                ? getHeightWeb(18)
                                                : getHeightMobile(16),
                                            color: AppColors.kPrimaryAppColor,
                                          ),
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFFE0E3E5),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            borderSide: BorderSide(
                                              color: AppColors.kBtnColor,
                                              width: 2.0,
                                            ),
                                          ),
                                        ),
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Please enter email address!!";
                                          }
                                          if (!RegExp(
                                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                              .hasMatch(value)) {
                                            return "Please enter valid email address!!";
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: isLargeScreen
                                          ? getHeightWeb(40)
                                          : getHeightMobile(35.5),
                                    ),
                                    Form(
                                      key: signupProvider.signUpPasswordFormKey,
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      child: TextFormField(
                                        controller:
                                            signupProvider.passwordController,
                                        obscureText:
                                            signupProvider.isMasked == true
                                                ? true
                                                : false,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          contentPadding: EdgeInsets.only(
                                            top: isLargeScreen
                                                ? getHeightWeb(16.92)
                                                : getHeightMobile(15.02),
                                            bottom: isLargeScreen
                                                ? getHeightWeb(17.08)
                                                : getHeightMobile(14.79),
                                          ),
                                          prefixIcon: Container(
                                            margin:
                                                EdgeInsets.only(right: 18.72),
                                            decoration: BoxDecoration(
                                                border: Border(
                                                    right: BorderSide(
                                                        color: Color(
                                                            0xFFE0E3E5)))),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 14.98,
                                                      vertical: 15.01),
                                              child: Image.asset(
                                                "assets/icons/ic_vpn_key.png",
                                                height: isLargeScreen
                                                    ? getHeightWeb(25.43)
                                                    : getHeightMobile(22),
                                                width: isLargeScreen
                                                    ? getWidthWeb(25.43)
                                                    : getWidthMobile(22),
                                              ),
                                            ),
                                          ),
                                          suffixIcon: InkWell(
                                            onTap: () {
                                              signupProvider.changeMasking();
                                            },
                                            child: Container(
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                  right: isLargeScreen
                                                      ? getWidthWeb(21.57)
                                                      : getWidthMobile(17.37),
                                                  left: isLargeScreen
                                                      ? getWidthWeb(21.57)
                                                      : getWidthMobile(17.37),
                                                  top: isLargeScreen
                                                      ? getHeightWeb(19.56)
                                                      : getHeightMobile(17.01),
                                                  bottom: isLargeScreen
                                                      ? getHeightWeb(19.56)
                                                      : getHeightMobile(17.01),
                                                ),
                                                child: Image.asset(
                                                  "assets/icons/ic_eye.png",
                                                  height: isLargeScreen
                                                      ? getHeightWeb(15)
                                                      : getHeightMobile(14),
                                                  width: isLargeScreen
                                                      ? getWidthWeb(23)
                                                      : getWidthMobile(20),
                                                ),
                                              ),
                                            ),
                                          ),
                                          hintText: "Create Password",
                                          hintStyle: TextStyle(
                                            fontSize: isLargeScreen
                                                ? getHeightWeb(18)
                                                : getHeightMobile(16),
                                            color: AppColors.kPrimaryAppColor,
                                          ),
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFFE0E3E5),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            borderSide: BorderSide(
                                              color: AppColors.kBtnColor,
                                              width: 2.0,
                                            ),
                                          ),
                                        ),
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Please enter password!!";
                                          }
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: isLargeScreen
                                          ? getHeightWeb(40)
                                          : getHeightMobile(41.27),
                                    ),
                                    Row(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Navigator.pushReplacementNamed(
                                                    context, "/login")
                                                .then((value) {
                                              signupProvider.emailController
                                                  .clear();
                                              signupProvider.passwordController
                                                  .clear();
                                              signupProvider.nameController
                                                  .clear();
                                            });
                                          },
                                          child: Text(
                                            "Already have account?",
                                            style: TextStyle(
                                                fontSize: isLargeScreen
                                                    ? getHeightWeb(18)
                                                    : getHeightMobile(16),
                                                color:
                                                    AppColors.kPrimaryAppColor),
                                          ),
                                        ),
                                        Spacer(),
                                        InkWell(
                                          onTap: () {
                                            // if (signupProvider
                                            //     .signUpFormKey.currentState!
                                            //     .validate()) {
                                            //   signupProvider
                                            //       .signUpFormKey.currentState!
                                            //       .save();
                                            // }

                                            if (signupProvider.signUpNameFormKey.currentState != null &&
                                                signupProvider
                                                        .signUpEmailFormKey
                                                        .currentState !=
                                                    null &&
                                                signupProvider
                                                        .signUpPasswordFormKey
                                                        .currentState !=
                                                    null) {
                                              if (signupProvider
                                                      .signUpNameFormKey
                                                      .currentState!
                                                      .validate() &&
                                                  signupProvider
                                                      .signUpEmailFormKey
                                                      .currentState!
                                                      .validate() &&
                                                  signupProvider
                                                      .signUpPasswordFormKey
                                                      .currentState!
                                                      .validate()) {
                                                signupProvider.signUpNameFormKey
                                                    .currentState!
                                                    .save();
                                                signupProvider
                                                    .signUpEmailFormKey
                                                    .currentState!
                                                    .save();
                                                signupProvider
                                                    .signUpPasswordFormKey
                                                    .currentState!
                                                    .save();

                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                        "Signed up successfully"),
                                                  ),
                                                );

                                                Navigator
                                                    .pushNamedAndRemoveUntil(
                                                        context,
                                                        "/dashboard",
                                                        (route) => false);
                                              }
                                            }
                                          },
                                          child: Container(
                                            alignment: Alignment.center,
                                            height: isLargeScreen
                                                ? getHeightWeb(52)
                                                : getHeightMobile(46.15),
                                            width: isLargeScreen
                                                ? getWidthWeb(100)
                                                : getWidthMobile(88.5),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              color: AppColors.kBtnColor,
                                            ),
                                            child: Text(
                                              "SIGN UP",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: isLargeScreen
                                                    ? getHeightWeb(18)
                                                    : getHeightMobile(16),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
