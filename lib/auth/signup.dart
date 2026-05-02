import 'package:firebaselearn/auth/login.dart';
import 'package:firebaselearn/auth/widgets/customauthbutton.dart';
import 'package:flutter/material.dart';
import 'package:firebaselearn/auth/widgets/customtextfield.dart';
import 'package:firebaselearn/core/colors.dart';
import 'package:gap/gap.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    TextEditingController userController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: SingleChildScrollView(
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(20),
            children: [
              Gap(80),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 55,
                      backgroundColor: AppColors.secondaryBlack,
                      // child: CircleAvatar(
                      // radius: 50,
                      child: Icon(
                        Icons.person,
                        size: 50,
                        color: AppColors.primary,
                      ),
                    ),
                    // ),
                  ),
                  Gap(10),
                  Text(
                    'SignUp',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Create an account to get started',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  Gap(30),
                  Customtextfield(
                    controller: userController,
                    obscure: false,
                    preIcon: Icon(Icons.person),
                    text: 'Username',
                    hintText: 'Enter your username',
                  ),
                  Gap(30),
                  Customtextfield(
                    controller: emailController,
                    obscure: false,
                    preIcon: Icon(Icons.email),
                    text: 'Email',
                    hintText: 'hi@example.com',
                  ),
                  Gap(25),
                  Customtextfield(
                    controller: passwordController,
                    obscure: true,
                    preIcon: Icon(Icons.lock),
                    text: 'Password',
                    hintText: 'Your password must be strong',
                  ),
                  Gap(30),
                  Customtextfield(
                    controller: confirmPasswordController,
                    obscure: true,
                    preIcon: Icon(Icons.lock),
                    text: 'Confirm Password',
                    hintText: 'Confirm your password',
                  ),
                  Gap(30),
                  CustomAuthButton(
                    text: 'SignUp',
                    textColor: AppColors.primary,
                    color: AppColors.secondaryBlue,
                  ),
                  Gap(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      Gap(5),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => Login()),
                          );
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.secondaryBlue,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Gap(300),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
