import 'package:flutter/material.dart';
import 'package:tourism_app/pages/Service_provider/verification.dart';
import 'package:tourism_app/pages/User/verfication.dart';

class ProviderForgotPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Please enter your email address',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              SizedBox(height: 20),
              ResetForm(),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProviderVerification()),
                    );
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
    );
  }
}

class ResetForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Email",
        hintStyle: TextStyle(color: Colors.black),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide(color: Color.fromARGB(255, 8, 145, 125)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide(color: Color.fromARGB(255, 8, 145, 125)),
        ),
      ),
    );
  }
}
