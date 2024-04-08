import 'package:flutter/material.dart';
import 'package:tourism_app/pages/Service_provider/login_page.dart';

class ProviderAccVerification extends StatelessWidget {
  const ProviderAccVerification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 8, 145, 125),
        title: Text('Check your Email'),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 153, 165, 164),
          image: DecorationImage(
            image: AssetImage("assets/check.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Color.fromARGB(255, 8, 145, 125).withOpacity(0.2),
              BlendMode.dstATop,
            ),
          ),
        ),
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          children: [
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 50,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    decoration: InputDecoration(
                      counterText: '',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 2),
                SizedBox(
                  width: 50,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    decoration: InputDecoration(
                      counterText: '',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 2),
                SizedBox(
                  width: 50,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    decoration: InputDecoration(
                      counterText: '',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 2),
                SizedBox(
                  width: 50,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    decoration: InputDecoration(
                      counterText: '',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 2),
                SizedBox(
                  width: 50,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    decoration: InputDecoration(
                      counterText: '',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProviderLoginPage()),
                  );
                },
                child: Text(
                  'Verification',
                  style: TextStyle(color: Color.fromARGB(255, 8, 145, 125)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
