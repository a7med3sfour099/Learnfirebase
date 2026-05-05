import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaselearn/auth/signup.dart';
import 'package:firebaselearn/auth/widgets/customauthbutton.dart';
import 'package:firebaselearn/auth/widgets/customtextfield.dart';
import 'package:firebaselearn/core/colors.dart';
import 'package:firebaselearn/home_page.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Welcome Back!',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    Gap(30),
                    Customtextfield(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!RegExp(
                          r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                        ).hasMatch(value)) {
                          return 'Please enter a valid email address';
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
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
                        GestureDetector(
                          onTap: () {
                            // Handle forgot password logic here
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.infoReverse,
                              animType: AnimType.rightSlide,
                              title: 'Feature Unavailable',
                              desc:
                                  'Forgot Password functionality is not implemented yet.',
                            ).show();
                          },
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.secondaryBlue,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Gap(30),
                    CustomAuthButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          try {
                            final _ = await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim(),
                                );
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: const Text(
                                  'Login successful! Redirecting to home...',
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
                              MaterialPageRoute(
                                builder: (context) => HomePage(),
                              ),
                            );
                          } on FirebaseAuthException catch (e) {
                            // print('Error code: ${e.code}');
                            // print('Error message: ${e.message}');
                            if (mounted) {
                              String errorMessage = '';

                              switch (e.code) {
                                case 'invalid-credential':
                                case 'user-not-found':
                                case 'wrong-password':
                                  errorMessage =
                                      'Invalid email or password. Please try again.';
                                  break;
                                case 'too-many-requests':
                                  errorMessage =
                                      'Too many failed attempts. Please try again later.';
                                  break;
                                case 'user-disabled':
                                  errorMessage =
                                      'This account has been disabled.';
                                  break;
                                default:
                                  errorMessage =
                                      e.message ??
                                      'Login failed. Please try again.';
                              }

                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.error,
                                animType: AnimType.rightSlide,
                                title: 'Login Failed',
                                desc: errorMessage,
                              ).show();
                            }
                            //   if (e.code == 'user-not-found') {
                            //     print('No user found for that email.');
                            //     AwesomeDialog(
                            //       context: context,
                            //       dialogType: DialogType.error,
                            //       animType: AnimType.rightSlide,
                            //       title: 'Login Failed',
                            //       desc: 'No user found for that email.',
                            //     )..show();
                            //   } else if (e.code == 'wrong-password') {
                            //     print('Wrong password provided for that user.');
                            //     AwesomeDialog(
                            //       context: context,
                            //       dialogType: DialogType.error,
                            //       animType: AnimType.rightSlide,
                            //       title: 'Login Failed',
                            //       desc: 'Wrong password provided for that user.',
                            //     )..show();
                            //   }
                          }
                        }
                      },
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
      ),
    );
  }
}
