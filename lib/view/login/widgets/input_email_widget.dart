import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:userauthapi/view_models/controller/login/login_view_model.dart';
import '../../../utils/utils.dart';

class InputEmailWidget extends StatelessWidget {
  InputEmailWidget({super.key});

  final loginVM = Get.put(LoginViewModel());

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: loginVM.emailController.value,
      focusNode: loginVM.emailFocusNode.value,
      validator: (value) {
        if (value!.isEmpty) {
          Utils.snackBar('Email', 'Enter email');
          return "Enter email";
        } else {
          return null;
        }
      },
      onFieldSubmitted: (value) {
        Utils.fieldFocusChange(context, loginVM.emailFocusNode.value,
            loginVM.passwordFocusNode.value);
      },
      decoration: const InputDecoration(
          hintText: 'Email', border: OutlineInputBorder()),
    );
  }
}
