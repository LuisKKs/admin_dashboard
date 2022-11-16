import 'package:flutter/material.dart';

class RegisterFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  String email = '';
  String password = '';
  String name = '';
  String lastname = '';
  String phonenumber = '';

  validateForm() {
    if (formKey.currentState!.validate()) {
      print('Form valid...Login');
      print('$email === $password === $name===$lastname===$phonenumber');
      return true;
    } else {
      print('Form not valid');
      return false;
    }
  }
}
