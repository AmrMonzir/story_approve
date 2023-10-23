import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:story_approve/constants.dart';
import 'package:story_approve/core/api.dart';
import 'package:story_approve/features/list.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 25),
            const Center(
                child: Text(
              "Login",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
            )),
            const SizedBox(height: 16),
            TextField(
              decoration: inputDecoration.copyWith(
                hintText: "Email",
              ),
              onChanged: (value) {
                if (EmailValidator.validate(value)) {
                  setState(() {
                    email = value;
                  });
                }
              },
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: inputDecoration.copyWith(hintText: "Password"),
              onChanged: (value) {
                setState(() {
                  password = value;
                });
              },
            ),
            const SizedBox(height: 16),
            Center(
              child: FilledButton(
                  onPressed: email != null &&
                          email!.isNotEmpty &&
                          password != null &&
                          password!.isNotEmpty
                      ? () async {
                          try {
                            var res = await login(email!, password!);
                            if (res && context.mounted) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          const StoryList()));
                            }
                          } catch (e) {
                            print(e);
                          }
                        }
                      : null,
                  style: FilledButton.styleFrom(
                      backgroundColor: primaryColor,
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 50)),
                  child: const Text("Login", style: TextStyle(fontSize: 20))),
            )
          ],
        ),
      ),
    );
  }
}
