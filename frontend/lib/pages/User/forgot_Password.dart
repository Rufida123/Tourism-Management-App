import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_app/components/shared_state_manager.dart';
import 'package:tourism_app/pages/User/cubits/password_cubit/forgot_password_cubit.dart';
import 'package:tourism_app/pages/User/cubits/password_cubit/forgot_password_state.dart';

class UserForgotPassword extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserForgotPasswordCubit, UserForgotPasswordState>(
      listener: (context, state) {
        if (state is UserForgotPasswordLoading) {
          isLoading = true;
        } else if (state is UserForgotPasswordSuccess) {
          Navigator.pushNamed(context, '/UserPassVerification');
          isLoading = false;
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(''),
            duration: Duration(seconds: 2),
          ));
        } else if (state is UserForgotPasswordFailure) {
          isLoading = false;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              duration: Duration(seconds: 2),
            ),
          );
        }
      },
      builder: (context, state) {
        if (isLoading) {
          return Center(child: CircularProgressIndicator());
        } else {
          return Form(
            key: _formKey,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Color.fromARGB(255, 8, 145, 125),
                title: Text('Forgot Password'),
              ),
              body: Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 153, 165, 164),
                  image: DecorationImage(
                    image: AssetImage("assets/OIG4 (7).jpg"),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Color.fromARGB(255, 8, 145, 125).withOpacity(0.2),
                      BlendMode.dstATop,
                    ),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Reset Password',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Please enter your email address',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter an email';
                          } else if (!value.contains('@')) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: "Email",
                          hintStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 8, 145, 125)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 8, 145, 125)),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              final email = emailController.text;
                              if (email.isNotEmpty) {
                                userSharedEmail.setEmail(emailController.text);
                                BlocProvider.of<UserForgotPasswordCubit>(
                                        context)
                                    .cubitUserForgotPassword(
                                        emailController.text);
                              } else {
                                print(
                                    "Email is empty, please enter your email and try again.");
                              }
                            }
                          },
                          child: Text(
                            'Reset Password',
                            style: TextStyle(
                              color: Color.fromARGB(255, 8, 145, 125),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
