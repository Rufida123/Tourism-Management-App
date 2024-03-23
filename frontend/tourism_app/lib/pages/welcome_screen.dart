import 'package:flutter/material.dart';
import 'package:tourism_app/pages/login_page.dart';
import 'package:get/get.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.0, 0.5, 1.0],
                colors: [
                  Colors.transparent,
                  Colors.white.withOpacity(0.8),
                  Colors.white,
                ],
              ),
            ),
          ),
          ColorFiltered(
            colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.5),
              BlendMode.srcOver,
            ),
            child: Image.asset(
              'assets/308 Palmyra  (Syria).jpeg',
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.location_on_sharp,
                  size: 100,
                  color: Color(0xff55D3BD),
                ),
                const Text(
                  'Welcome to',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      letterSpacing: 2),
                ),
                const Text(
                  "Syria",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                      letterSpacing: 2),
                ),
                const SizedBox(
                  height: 400,
                ),
                const Text(
                  'Continue as',
                  style: TextStyle(
                      color: Color(0xff30323D),
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                const SizedBox(
                  height: 6,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => LoginPage(), transition: Transition.zoom);
                  },
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()),
                      );
                    },
                    child: Text(
                      'User',
                      style: TextStyle(
                          color: Colors.white, fontSize: 20, letterSpacing: 2),
                    ),
                    style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(Size(200, 50)),
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xff55D3BD)),
                        shadowColor:
                            MaterialStateProperty.all(Color(0xff30323D))),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Service Provider',
                    style: TextStyle(
                      color: Color(0xff55D3BD),
                      fontSize: 20,
                    ),
                  ),
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(Size(200, 50)),
                    shadowColor: MaterialStateProperty.all(Color(0xff30323D)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
