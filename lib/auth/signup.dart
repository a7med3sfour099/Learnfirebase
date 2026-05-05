import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  final _formKey = GlobalKey<FormState>();
  TextEditingController userController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
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
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Create an account to get started',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    Gap(30),
                    Customtextfield(
                      validator: (value) {
                        if (value == null || value.trim().isEmpty)
                          return 'Name is required';
                        if (value.trim().length < 3) return 'Name too short';
                        return null;
                      },
                      controller: userController,
                      obscure: false,
                      preIcon: Icon(Icons.person),
                      text: 'Username',
                      hintText: 'Enter your username',
                    ),
                    Gap(30),
                    Customtextfield(
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Email is required';
                        }
                        if (!RegExp(
                          r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                        ).hasMatch(value.trim())) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password is required';
                        }
                        if (value.length < 8) {
                          return 'Password must be at least 8 characters';
                        }
                        return null;
                      },
                    ),
                    Gap(30),
                    Customtextfield(
                      controller: confirmPasswordController,
                      obscure: true,
                      preIcon: Icon(Icons.lock),
                      text: 'Confirm Password',
                      hintText: 'Confirm your password',
                      validator: (value) {
                        if (value != passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                    Gap(30),
                    CustomAuthButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          try {
                            final _ = await FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                                  email: emailController.text.trim(),
                                  password: passwordController.text,
                                );
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: const Text(
                                  'Sign up successfully! Redirecting to login...',
                                ),
                                duration: const Duration(seconds: 2),
                                backgroundColor: Colors.green[700],
                                behavior: SnackBarBehavior.floating,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            );
                            await Future.delayed(const Duration(seconds: 2));
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => Login()),
                            );
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'weak-password') {
                              print('The password provided is too weak.');
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.warning,
                                animType: AnimType.rightSlide,
                                title: 'Weak Password',
                                desc: 'The password provided is too weak.',
                              ).show();
                            } else if (e.code == 'email-already-in-use') {
                              print(
                                'The account already exists for that email.',
                              );
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.warning,
                                animType: AnimType.rightSlide,
                                title: 'Email Already Exists',
                                desc:
                                    'The account already exists for that email.',
                              ).show();
                            }
                          } catch (e) {
                            print(e);
                          }
                        }
                      },
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
      ),
    );
  }
}
