import 'package:flutter/material.dart';
import 'package:tourism_app/pages/User/sign_up_page.dart';

class UserResetPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 8, 145, 125),
        title: Text('Reset Password'),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 153, 165, 164),
          image: DecorationImage(
            image: AssetImage("assets/OIG3 (3).jpg"),
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
                'Set a New Password',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Please enter your password',
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
                      MaterialPageRoute(builder: (context) => UserSignUpPage()),
                    );
                  },
                  child: Text(
                    'Update Password',
                    style: TextStyle(color: Color.fromARGB(255, 8, 145, 125)),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          decoration: InputDecoration(
            hintText: "Password",
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
          obscureText: true,
        ),
        SizedBox(height: 20),
        TextFormField(
          decoration: InputDecoration(
            hintText: "Confirm Password",
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
          obscureText: true,
        ),
      ],
    );
  }
}
