import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oswal/controller/forgot_controller.dart';
import 'package:oswal/pages/widgets/appbar_widget.dart';

import '../widgets/button_circular_widget.dart';
import '../widgets/custom_button.dart';
import '../widgets/mytext_form.dart';

class ForgotPage extends StatefulWidget {
  const ForgotPage({super.key});

  @override
  ForgotPageState createState() => ForgotPageState();
}

class ForgotPageState extends State<ForgotPage> {
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarWidget(
        title: 'Forgot Password',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              _icon(context),
              _buildTextFields(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _icon(BuildContext context) {
    return Image.asset(
      'assets/images/icon.png',
      height: 150,
      width: 150,
    );
  }

  Widget _buildTextFields(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          MyTextForm(
            controller: emailController,
            labelText: 'Username',
            leadingIcon: Icon(
              Icons.person,
              color: Theme.of(context).colorScheme.primary,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your username';
              }
              return null;
            },
          ),
          const SizedBox(height: 5),
          _buildSubmitButton(context),
        ],
      ),
    );
  }

  Widget _buildSubmitButton(BuildContext context) {
    ForgotController forgotController = Get.find<ForgotController>();

    return Obx(
      () => CustomButton(
        onPressed: () {
          if (formKey.currentState!.validate()) {
            // Handle the form submission and navigation
            log('Email: ${emailController.text}');
            // Get.toNamed(AppRouts.home);
            // log('Navigated to home page');

            forgotController.forgotPassword(email: emailController.text);
          }
        },
        width: double.infinity,
        height: 50,
        backgroundColor: Theme.of(context).colorScheme.primary,
        textColor: Theme.of(context).colorScheme.onPrimary,
        child: forgotController.isLoading.value
            ? const ButtonCircularWidget()
            : Text(
                'Submit',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
              ),
      ),
    );
  }
}
