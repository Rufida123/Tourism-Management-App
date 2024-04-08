import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_app/components/navigation_service.dart';
import 'package:tourism_app/pages/cubits/login_cubit/login_cubit.dart';
import 'package:tourism_app/pages/cubits/login_cubit/login_state.dart';

class LoginPage extends StatelessWidget {
  bool isLoading = false;
  late Color myColor;
  late Size mediaSize;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool rememberUser = false;

  void navigateToSignUpPage() {
    navigatorKey.currentState?.pushNamed('/SignUp');
  }

  void navigateServiceProvidingPage() {
    navigatorKey.currentState?.pushNamed('/ServiceProviding');
  }

  void navigateToForgotPassword() {
    navigatorKey.currentState?.pushNamed('/ForgotPassword');
  }

  @override
  Widget build(BuildContext context) {
    myColor = Theme.of(context).primaryColor;
    mediaSize = MediaQuery.of(context).size;
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          isLoading = true;
        } else if (state is LoginSuccess) {
          Navigator.pushNamed(context, '/ServiceProviding');
          isLoading = false;
        } else if (state is LoginFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Login failed: ${state.errorMessage}'),
              duration: Duration(seconds: 2),
            ),
          );
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
              body: Stack(
                children: [
                  Positioned(top: 80, child: _buildTop()),
                  Positioned(bottom: 0, child: _buildBottom(context)),
                ],
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
        mainAxisSize: MainAxisSize.min,
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Welcome",
          style: TextStyle(
              color: Color.fromARGB(255, 8, 145, 125),
              fontSize: 32,
              fontWeight: FontWeight.w500),
        ),
        _buildGreyText("Please login with your information"),
        const SizedBox(height: 60),
        _buildGreyText("Email address"),
        _buildInputField(emailController),
        const SizedBox(height: 40),
        _buildGreyText("Password"),
        _buildInputField(passwordController, isPassword: true),
        const SizedBox(height: 20),
        _buildRememberForgot(),
        const SizedBox(height: 20),
        _buildLoginButton(context),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Don't have an account? ",
              style: TextStyle(color: Colors.grey),
            ),
            TextButton(
              onPressed: navigateToSignUpPage,
              child: const Text(
                "Sign Up",
                style: TextStyle(
                  color: Color.fromARGB(255, 8, 145, 125),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildGreyText(String text) {
    return Text(
      text,
      style: const TextStyle(color: Colors.grey),
    );
  }

  Widget _buildInputField(TextEditingController controller,
      {bool isPassword = false}) {
    return TextField(
      controller: controller,
      style: const TextStyle(color: Color.fromARGB(255, 8, 145, 125)),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: const BorderSide(color: Color.fromARGB(255, 8, 145, 125)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: const BorderSide(color: Color.fromARGB(255, 8, 145, 125)),
        ),
        suffixIcon: isPassword
            ? const Icon(Icons.remove_red_eye)
            : const Icon(Icons.done),
      ),
      obscureText: isPassword,
    );
  }

  Widget _buildRememberForgot() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
              value: rememberUser,
              onChanged: (value) {
                // setState(() {
                //   rememberUser = value!;
                // });
              },
              activeColor: const Color.fromARGB(255, 8, 145, 125),
            ),
            _buildGreyText("Remember me"),
          ],
        ),
        TextButton(
            onPressed: navigateToForgotPassword,
            child: _buildGreyText("I forgot my password")),
      ],
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        BlocProvider.of<LoginCubit>(context)
            .cubitLogin(emailController.text, passwordController.text);
      },
      //navigateServiceProvidingPage,
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        elevation: 20,
        shadowColor: const Color.fromARGB(255, 8, 145, 125),
        minimumSize: const Size.fromHeight(60),
      ),
      child: const Text(
        "LOGIN",
        style: TextStyle(color: Color.fromARGB(255, 8, 145, 125)),
      ),
    );
  }
}
