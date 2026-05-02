import 'package:firebaselearn/auth/signup.dart';
import 'package:firebaselearn/auth/widgets/customauthbutton.dart';
import 'package:firebaselearn/auth/widgets/customtextfield.dart';
import 'package:firebaselearn/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
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
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage(
                          'assets/logo/JUST DO IT!.jpg',
                        ),
                      ),
                    ),
                  ),
                  Gap(10),
                  Text(
                    'Login',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Welcome Back!',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
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
                  Gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot Password?',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.secondaryBlue,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Gap(30),
                  CustomAuthButton(
                    text: 'Login',
                    textColor: AppColors.primary,
                    color: AppColors.secondaryBlue,
                  ),
                  Gap(20),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Divider(color: Colors.grey, thickness: 1.5),
                      Container(
                        color: AppColors.primary,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          'Or Login With',
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                  Gap(20),
                  Stack(
                    children: [
                      CustomAuthButton(
                        text: 'Login With Google',
                        textColor: AppColors.secondaryBlack,
                        color: AppColors.secondaryWhiteBlue,
                      ),

                      Positioned(
                        right: 75,
                        top: 10,
                        child: Image.asset(
                          'assets/googleIcon/google.png',
                          height: 30,
                        ),
                      ),
                    ],
                  ),
                  Gap(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      Gap(5),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => SignUp()),
                          );
                        },
                        child: Text(
                          'Sign Up',
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
