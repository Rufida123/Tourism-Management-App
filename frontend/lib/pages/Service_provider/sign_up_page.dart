import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_app/components/navigation_service.dart';
import 'package:tourism_app/pages/Service_provider/account_verification.dart';
import 'package:tourism_app/pages/Service_provider/cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:tourism_app/pages/Service_provider/cubits/sign_up_cubit/sign_up_state.dart';

class ProviderSignUpPage extends StatelessWidget {
  ProviderSignUpPage({Key? key}) : super(key: key);

  late Color myColor;

  late Size mediaSize;

  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController commercialNumberController = TextEditingController();

  bool rememberUser = false;
  bool isLoading = false;
  void navigateTologinPage() {
    navigatorKey.currentState?.pushNamed('/ProviderLogin');
  }

  void navigateServiceProvidingPage() {
    navigatorKey.currentState?.pushNamed('/ServiceProviding');
  }

  @override
  Widget build(BuildContext context) {
    myColor = Theme.of(context).primaryColor;
    mediaSize = MediaQuery.of(context).size;
    return BlocConsumer<SignUpProviderCubit, SignUpProviderState>(
      listener: (context, state) {
        if (state is SignUpProviderLoading) {
          isLoading = true;
        } else if (state is SignUpProviderSuccess) {
          Navigator.pushNamed(context, '/ServiceProviding');
          isLoading = false;
        } else if (state is SignUpProviderFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Signup failed: ${state.errorMessage}'),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Sign Up",
          style: TextStyle(
              color: Color.fromARGB(255, 8, 145, 125),
              fontSize: 32,
              fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 20),
        _buildGreyField("Name"),
        _buildInputField(nameController),
        const SizedBox(height: 20),
        _buildGreyField("Email Address"),
        _buildInputField(emailController),
        const SizedBox(height: 20),
        _buildGreyField("Password"),
        _buildInputField(passwordController, isPassword: true),
        const SizedBox(height: 20),
        _buildGreyField("Confirm Password"),
        _buildInputField(confirmPasswordController, isPassword: true),
        const SizedBox(height: 20),
        _buildGreyField("Commertial Number"),
        _buildInputField(commercialNumberController),
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

  Widget _buildInputField(TextEditingController controller,
      {bool isPassword = false}) {
    return TextField(
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
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        BlocProvider.of<SignUpProviderCubit>(context).cubitProviderSignUP(
            emailController.text,
            nameController.text,
            passwordController.text,
            confirmPasswordController.text,
            commercialNumberController.text);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProviderAccVerification()),
        );
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
