import 'package:flutter/material.dart';
import 'package:tourism_app/pages/sign_up_page.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late Color myColor;
  late Size mediaSize;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool rememberUser = false;

  @override
  Widget build(BuildContext context) {
    myColor = Theme.of(context).primaryColor;
    mediaSize = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: myColor,
        image: DecorationImage(
          image: const AssetImage("assets/photo_2024-03-23_13-15-07.jpg"),
          fit: BoxFit.cover,
          colorFilter:
              ColorFilter.mode(myColor.withOpacity(0.2), BlendMode.dstATop),
        ),
      ),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(0, 82, 152, 151),
        body: Stack(
          children: [
            Positioned(top: 80, child: _buildTop()),
            Positioned(bottom: 0, child: _buildBottom()),
          ],
        ),
      ),
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

  Widget _buildBottom() {
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
          child: _buildForm(),
        ),
      ),
    );
  }

  Widget _buildForm() {
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
        _buildLoginButton(),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Don't have an account? ",
              style: TextStyle(color: Colors.grey),
            ),
            GestureDetector(
              onTap: () {
                Get.to(() => const SignUpPage(),
                    transition: Transition.fade,
                    duration: Duration(seconds: 3));
              },
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignUpPage()),
                  );
                },
                child: const Text(
                  "Sign Up",
                  style: TextStyle(
                    color: Color.fromARGB(255, 8, 145, 125),
                    fontWeight: FontWeight.bold,
                  ),
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
                setState(() {
                  rememberUser = value!;
                });
              },
              activeColor: const Color.fromARGB(255, 8, 145, 125),
            ),
            _buildGreyText("Remember me"),
          ],
        ),
        TextButton(
            onPressed: () {}, child: _buildGreyText("I forgot my password")),
      ],
    );
  }

  Widget _buildLoginButton() {
    return ElevatedButton(
      onPressed: () {
        debugPrint("Email : ${emailController.text}");
        debugPrint("Password : ${passwordController.text}");
      },
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
