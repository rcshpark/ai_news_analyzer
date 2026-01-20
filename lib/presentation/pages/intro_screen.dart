import 'package:flutter/material.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xFF09090B),
              const Color(0xFF18181B),
              const Color(0xFF09090B),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Logo
            SizedBox(height: 80),
            // Title
            Text('Insight, Not Just News', style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold)),
            // Subtitle
            Text('AI-powered analysis to understand what matters', style: TextStyle(color: Color(0xFF9F9FA9), fontSize: 14)),
            SizedBox(height: 50),
            // Email Input
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: '이메일',
                  hintStyle: TextStyle(color: Color(0xFF71717B)),
                  prefixIcon: Icon(Icons.email_outlined, color: Color(0xFF71717B)),
                  filled: true,
                  fillColor: Color.fromRGBO(24, 24, 27, 0.6),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: Color(0xFF27272A), width: 0.5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: Color(0xFF27272A), width: 0.5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: Color(0xFF27272A), width: 0.5),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            // Password Input
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: '비밀번호',
                  hintStyle: TextStyle(color: Color(0xFF71717B)),
                  prefixIcon: Icon(Icons.lock_outline, color: Color(0xFF71717B)),
                  filled: true,
                  fillColor: Color.fromRGBO(24, 24, 27, 0.6),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: Color(0xFF27272A), width: 0.5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: Color(0xFF27272A), width: 0.5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: Color(0xFF27272A), width: 0.5),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            // Login Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF004FFF),
                  minimumSize: Size(double.infinity, 52),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  shadowColor: Color.fromRGBO(43, 127, 255, 0.5),
                  elevation: 10,
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.flash_on, color: Colors.white),
                    SizedBox(width: 8),
                    Text('로그인하고 시작하기', style: TextStyle(color: Colors.white, fontSize: 16)),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            // Divider
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: Divider(color: Color(0xFF27272A), indent: 24, endIndent: 10)),
                Text('또는', style: TextStyle(color: Color(0xFF71717B))),
                Expanded(child: Divider(color: Color(0xFF27272A), indent: 10, endIndent: 24)),
              ],
            ),
            SizedBox(height: 20),
            // Guest Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  minimumSize: Size(double.infinity, 52),
                  side: BorderSide(color: Color(0xFF27272A), width: 0.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('게스트로 계속하기', style: TextStyle(color: Color(0xFFD4D4D8), fontSize: 16)),
                    SizedBox(width: 8),
                    Icon(Icons.arrow_forward, color: Color(0xFFD4D4D8), size: 16),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            // Sign up
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('계정이 없으신가요? ', style: TextStyle(color: Color(0xFF71717B))),
                Text('가입하기', style: TextStyle(color: Color(0xFF51A2FF))),
              ],
            )
          ],
        ),
      ),
    );
  }
}
