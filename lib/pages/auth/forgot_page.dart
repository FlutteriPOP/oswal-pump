import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oswal/controller/forgot_controller.dart';
import 'package:oswal/pages/widgets/appbar_widget.dart';

import '../widgets/button_circuler_widget.dart';
import '../widgets/custom_button.dart';
import '../widgets/mtext_form.dart';

class ForgotPage extends StatelessWidget {
  const ForgotPage({super.key});

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
    final emailController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return Form(
      key: formKey,
      child: Column(
        children: [
          MyTextForm(
            controller: emailController,
            labelText: 'Mobile/Email/Username',
            leadingIcon: Icon(
              Icons.person,
              color: Theme.of(context).colorScheme.primary,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email/';
              }
              if (!GetUtils.isEmail(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
          const SizedBox(height: 5),
          _buildSubmitButton(context, formKey, emailController),
        ],
      ),
    );
  }

  Widget _buildSubmitButton(BuildContext context, GlobalKey<FormState> formKey,
      TextEditingController emailController) {
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
            ? const ButtonCirculerWidget()
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
