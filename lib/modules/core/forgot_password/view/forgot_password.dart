import 'package:flutter/material.dart';
import 'package:flutter_core_eis/config/size_config.dart';
import 'package:flutter_core_eis/constants/colors.dart';
import 'package:flutter_core_eis/modules/core/forgot_password/provider/forgot_password_provider.dart';
import 'package:flutter_core_eis/utils/responsive_sizes.dart';
import 'package:provider/provider.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({Key? key}) : super(key: key);

  @override
  _ForgotPasswordViewState createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
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
        child: Consumer<ForgotPasswordProvider>(
          builder: (context, forgotPasswordProvider, _) {
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
                                  "Reset Your Password",
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
                                    ? getHeightWeb(15)
                                    : getHeightMobile(12.47),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: isLargeScreen
                                        ? getWidthWeb(165)
                                        : getWidthMobile(52.0)),
                                child: Text(
                                  "Enter the email address associated with your account",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: isLargeScreen
                                          ? getHeightWeb(18)
                                          : getHeightMobile(16),
                                      color: AppColors.kPrimaryAppColor),
                                ),
                              ),
                              SizedBox(
                                height: isLargeScreen
                                    ? getHeightWeb(40)
                                    : getHeightMobile(36.42),
                              ),
                              Container(
                                margin: isLargeScreen
                                    ? EdgeInsets.only(
                                        left: getWidthWeb(166),
                                        right: getWidthWeb(154),
                                      )
                                    : EdgeInsets.all(0),
                                child: Form(
                                  key: forgotPasswordProvider.formKey,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      TextFormField(
                                        controller: forgotPasswordProvider
                                            .emailController,
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
                                                forgotPasswordProvider
                                                    .emailController
                                                    .clear();
                                              });
                                            },
                                            child: Text(
                                              "Go back to login",
                                              style: TextStyle(
                                                  fontSize: isLargeScreen
                                                      ? getHeightWeb(18)
                                                      : getHeightMobile(16),
                                                  color: AppColors
                                                      .kPrimaryAppColor),
                                            ),
                                          ),
                                          Spacer(),
                                          InkWell(
                                            onTap: () {
                                              if (forgotPasswordProvider
                                                  .formKey.currentState!
                                                  .validate()) {
                                                forgotPasswordProvider
                                                    .formKey.currentState!
                                                    .save();

                                                Navigator.pushReplacementNamed(
                                                    context, "/login");

                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                        "Reset Link sent!"),
                                                  ),
                                                );
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
                                                "SEND",
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
