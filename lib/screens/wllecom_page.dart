import 'package:flutter/material.dart';
import 'package:flutter_application_1/Register_Pages/login.dart';
import 'package:flutter_application_1/screens/home_page.dart';
import 'package:google_fonts/google_fonts.dart';

class wllecom_page extends StatefulWidget {
  const wllecom_page({super.key});

  @override
  _wllecom_pageState createState() => _wllecom_pageState();
}

class _wllecom_pageState extends State<wllecom_page> {
  @override
  void initState() {
    super.initState();

    // Navigate with animation after a 3-second delay
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.push(context, MaterialPageRoute(builder: (builder) {
        return const Login();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAF6FF),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const CircleAvatar(
            backgroundImage: AssetImage('assets/images/student.png'),
            radius: 100,
            backgroundColor: Colors.white,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Sakani.app',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              fontSize: 35,
              color: const Color(0xFF2B6CB0),
            ),
          ),
        ]),
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const HomePage(
      isAdmin: true,
    ),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      // Fade transition
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  );
}
