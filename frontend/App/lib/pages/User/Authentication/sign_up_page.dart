import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_app/components/custom_snackbar.dart';
import 'package:tourism_app/components/navigation_service.dart';
import 'package:tourism_app/components/shared_state_manager.dart';
import 'package:tourism_app/pages/User/cubits/signup_cubit/cubit/signup_cubit.dart';
import 'package:tourism_app/pages/User/cubits/signup_cubit/cubit/signup_state.dart';

class UserSignUpPage extends StatelessWidget {
  UserSignUpPage({Key? key}) : super(key: key);

  late Color myColor;

  late Size mediaSize;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  bool rememberUser = false;
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  void navigateTologinPage() {
    navigatorKey.currentState?.pushReplacementNamed('/UserLogin');
  }

  @override
  Widget build(BuildContext context) {
    myColor = Theme.of(context).primaryColor;
    mediaSize = MediaQuery.of(context).size;
    return BlocConsumer<SignUpUserCubit, SignUpUserState>(
      listener: (context, state) {
        if (state is SignUpUserLoading) {
          isLoading = true;
        } else if (state is SignUpUserSuccess) {
          Navigator.pushNamedAndRemoveUntil(
              context, '/UserAccVerification', (Route<dynamic> route) => false);
          showCustomSnackBar(
              context, 'A code was sent to your Email please verifiy');
          isLoading = false;
        } else if (state is SignUpUserFailure) {
          showCustomSnackBar(context, state.errorMessage);
          isLoading = false;
        }
      },
      builder: (context, state) {
        if (isLoading) {
          return Center(child: CircularProgressIndicator());
        } else {
          return Container(
            decoration: BoxDecoration(
              color: myColor,
              image: DecorationImage(
                image: const AssetImage("assets/syria.jpg"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    myColor.withOpacity(0.2), BlendMode.dstATop),
              ),
            ),
            child: Scaffold(
              backgroundColor: const Color.fromARGB(0, 82, 152, 151),
              body: SingleChildScrollView(
                child: Column(
                  children: [_buildTop(), _buildBottom(context)],
                ),
              ),
            ),
          );
        }
      },
    );
  }

  Widget _buildTop() {
    return SizedBox(
      width: mediaSize.width,
      child: const Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Icon(
            Icons.location_on_sharp,
            size: 100,
            color: Colors.white,
          ),
          Text(
            "Syria",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 40,
                letterSpacing: 2),
          )
        ],
      ),
    );
  }

  Widget _buildBottom(BuildContext context) {
    return SizedBox(
      width: mediaSize.width,
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: _buildForm(context),
        ),
      ),
    );
  }

  Widget _buildForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Sign Up",
            style: TextStyle(
                color: Color.fromARGB(255, 8, 145, 125),
                fontSize: 32,
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 40),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildGreyField("First Name"),
                    _buildInputField(firstNameController, validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a First Name';
                      }
                      return null;
                    }),
                  ],
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildGreyField("Last Name"),
                    _buildInputField(lastNameController, validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a Last Name';
                      }
                      return null;
                    }),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          _buildGreyField("Email Address"),
          _buildInputField(
            emailController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter an email';
              } else if (!value.contains('@')) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          _buildGreyField("Password"),
          _buildInputField(
            passwordController,
            isPassword: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a password';
              } else if (value.length < 8) {
                return 'Password must be at least 8 characters long';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          _buildGreyField("Confirm Password"),
          _buildInputField(
            confirmPasswordController,
            isPassword: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a password';
              } else if (value.length < 8) {
                return 'Password must be at least 8 characters long';
              } else if (value != passwordController.text) {
                return 'Passwords do not match';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          _buildGreyField("Phone Number"),
          _buildInputField(
            phoneController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a phone number';
              } else if (value.length < 10) {
                return 'Password must be at least 10 numbers long';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          _buildLoginButton(context),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Already have an account? ",
                style: TextStyle(color: Colors.grey),
              ),
              TextButton(
                onPressed: navigateTologinPage,
                child: const Text(
                  "Login",
                  style: TextStyle(
                    color: Color.fromARGB(255, 8, 145, 125),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildGreyField(String labelText) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        labelText,
        style: const TextStyle(color: Colors.grey),
      ),
    );
  }

  Widget _buildInputField(
    TextEditingController controller, {
    bool isPassword = false,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(color: Color.fromARGB(255, 8, 145, 125)),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18.0),
          borderSide: const BorderSide(color: Color.fromARGB(255, 8, 145, 125)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18.0),
          borderSide: const BorderSide(color: Color.fromARGB(255, 8, 145, 125)),
        ),
        suffixIcon: isPassword ? const Icon(Icons.remove_red_eye) : null,
      ),
      obscureText: isPassword,
      validator: validator,
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        if (_formKey.currentState!.validate()) {
          final email = emailController.text;
          if (email.isNotEmpty) {
            userSharedEmail.setEmail(emailController.text);
            BlocProvider.of<SignUpUserCubit>(context).cubitUserSignUP(
                emailController.text,
                firstNameController.text,
                lastNameController.text,
                passwordController.text,
                confirmPasswordController.text,
                phoneController.text);
          } else {
            print("Email is empty, please enter your email and try again.");
          }
        }
      },
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        elevation: 20,
        shadowColor: const Color.fromARGB(255, 8, 145, 125),
        minimumSize: const Size.fromHeight(60),
      ),
      child: const Text(
        "SIGN UP",
        style: TextStyle(color: Color.fromARGB(255, 8, 145, 125)),
      ),
    );
  }
}
