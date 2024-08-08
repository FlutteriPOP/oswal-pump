import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oswal/controller/login_controller.dart';
import 'package:oswal/pages/widgets/button_circular_widget.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../utils/routs.dart';
import '../widgets/custom_button.dart';
import '../widgets/mytext_form.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
    requestPermission();
  }

  Future<void> requestPermission() async {
    await Permission.camera.request();
    await Permission.location.request();
    await Permission.storage.request();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Theme.of(context).colorScheme.onSurface,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _icon(context),
              const SizedBox(height: 20),
              _buildTextFields(context),
              const SizedBox(height: 20),
              _buildForgotPassword(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _icon(BuildContext context) {
    return Image.asset(
      'assets/images/icon.png',
      height: 200,
      width: 200,
    );
  }

  Widget _buildTextFields(BuildContext context) {
    final emailFocusNode = FocusNode();
    final passwordFocusNode = FocusNode();

    final emailController = TextEditingController(text: 'AMAN');
    final passwordController = TextEditingController(text: 'Ama@4852');

    final formKey = GlobalKey<FormState>();

    return Form(
      key: formKey,
      child: AutofillGroup(
        child: Column(
          children: [
            _buildEmailField(
              context: context,
              emailController: emailController,
              emailFocusNode: emailFocusNode,
              passwordFocusNode: passwordFocusNode,
            ),
            _buildPasswordField(
              context: context,
              passwordController: passwordController,
              passwordFocusNode: passwordFocusNode,
            ),
            const SizedBox(height: 10),
            _buildLoginButton(
              context: context,
              formKey: formKey,
              emailController: emailController,
              passwordController: passwordController,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmailField({
    required BuildContext context,
    required TextEditingController emailController,
    required FocusNode emailFocusNode,
    required FocusNode passwordFocusNode,
  }) {
    return MyTextForm(
      controller: emailController,
      labelText: 'Mobile/Email/Username',
      autofillHints: const [
        AutofillHints.email,
        AutofillHints.username,
        AutofillHints.telephoneNumber,
      ],
      leadingIcon: Icon(
        Icons.person,
        color: Theme.of(context).colorScheme.primary,
      ),
      focusNode: emailFocusNode,
      nextFocusNode: passwordFocusNode,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your email/username/mobile number';
        }
        return null;
      },
    );
  }

  Widget _buildPasswordField({
    required BuildContext context,
    required TextEditingController passwordController,
    required FocusNode passwordFocusNode,
  }) {
    final LoginController loginController = Get.find<LoginController>();

    return Obx(
      () => MyTextForm(
        controller: passwordController,
        labelText: 'Password',
        leadingIcon: Icon(
          Icons.lock,
          color: Theme.of(context).colorScheme.primary,
        ),
        suffixIcon: IconButton(
          icon: Icon(
            loginController.isObscure.value
                ? Icons.visibility_off
                : Icons.visibility,
            color: Theme.of(context).colorScheme.primary,
          ),
          onPressed: () {
            loginController.toggleVisibility();
            log('Password visibility toggled: ${loginController.isObscure.value}');
          },
        ),
        autofillHints: const [AutofillHints.password],
        obscureText: loginController.isObscure.value,
        focusNode: passwordFocusNode,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your password';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildLoginButton({
    required BuildContext context,
    required GlobalKey<FormState> formKey,
    required TextEditingController emailController,
    required TextEditingController passwordController,
  }) {
    final LoginController loginController = Get.find<LoginController>();

    return Obx(
      () => CustomButton(
        onPressed: loginController.isLoading.value
            ? null
            : () {
                if (formKey.currentState != null &&
                    formKey.currentState!.validate()) {
                  loginController.login(
                    email: emailController.text,
                    password: passwordController.text,
                  );
                  log('Login attempted with email: ${emailController.text}');
                }
              },
        width: double.infinity,
        height: 50,
        backgroundColor: Theme.of(context).colorScheme.primary,
        textColor: Theme.of(context).colorScheme.onPrimary,
        child: loginController.isLoading.value
            ? const ButtonCircularWidget()
            : Text(
                'Login',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
      ),
    );
  }

  Widget _buildForgotPassword(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: InkWell(
        onTap: () {
          Get.toNamed(AppRouts.forgot);
        },
        child: Text(
          'Forgot Password?',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                decoration: TextDecoration.underline,
                decorationColor: Theme.of(context).colorScheme.primary,
                decorationStyle: TextDecorationStyle.solid,
                color: Theme.of(context).colorScheme.primary,
              ),
        ),
      ),
    );
  }
}
