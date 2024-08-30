import 'package:flutter/material.dart';
// import 'login_controller.dart';

class Login extends StatelessWidget {
  final LoginController controller;

  Login({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AppConfig.loginScreenBackgroundIsImage
            ? Image.asset(
          'images/background_login.png',
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        )
            : SizedBox.shrink(),
        Scaffold(
            backgroundColor: AppConfig.loginScreenBackgroundIsImage
                ? Colors.transparent
                : AppConfig.loginScreenTextColorIsBlack
                ? Colors.white
                : AppColors.corPrincipal,
            body: WillPopScope(
              onWillPop: () async {
                if (controller.isKeyboardVisible.value) {
                  controller.hideKeyboard();
                  return false;
                }
                return true;
              },   //AQUI SERIA Obx((){})
              child: ValueListenableBuilder<bool>(
                valueListenable: controller.isLoading,
                builder: (context, isLoading, child) {
                  return isLoading
                      ? CircularProgressIndicator(message: 'Aguarde...')
                      : SafeArea(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.065,
                          vertical: MediaQuery.of(context).size.height * 0.02),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(height: MediaQuery.of(context).size.height * .06),
                          Image.asset(
                            'images/logo.png',
                            height: AppConfig.loginScreenLogoIsVerticallyBigger
                                ? MediaQuery.of(context).size.height * 0.14
                                : MediaQuery.of(context).size.height * 0.11,
                            width: MediaQuery.of(context).size.width * 0.7,
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height * .02),
                          ValueListenableBuilder<bool>(
                            valueListenable: controller.isKeyboardVisible,
                            builder: (context, isKeyboardVisible, child) {
                              return SingleChildScrollView(
                                child: isKeyboardVisible
                                    ? AuthForm(loginController02: controller)
                                    : UserForm(loginController02: controller),
                              );
                            },
                          ),
              ),
            ),
    )
  }
}
