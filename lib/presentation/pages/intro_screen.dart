import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF09090B), Color(0xFF18181B), Color(0xFF09090B)],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Logo
            const SizedBox(height: 80),
            // Title
            Text(
              AppLocalizations.of(context)!.introTitle,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            // Subtitle
            Text(
              AppLocalizations.of(context)!.introSubTitle,
              style: const TextStyle(color: Color(0xFF9F9FA9), fontSize: 14),
            ),
            const SizedBox(height: 50),
            // Email Input
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.email,
                  hintStyle: const TextStyle(color: Color(0xFF71717B)),
                  prefixIcon: const Icon(
                    Icons.email_outlined,
                    color: Color(0xFF71717B),
                  ),
                  filled: true,
                  fillColor: const Color.fromRGBO(24, 24, 27, 0.6),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: Color(0xFF27272A),
                      width: 0.5,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: Color(0xFF27272A),
                      width: 0.5,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: Color(0xFF27272A),
                      width: 0.5,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Password Input
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.password,
                  hintStyle: const TextStyle(color: Color(0xFF71717B)),
                  prefixIcon: const Icon(
                    Icons.lock_outline,
                    color: Color(0xFF71717B),
                  ),
                  filled: true,
                  fillColor: const Color.fromRGBO(24, 24, 27, 0.6),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: Color(0xFF27272A),
                      width: 0.5,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: Color(0xFF27272A),
                      width: 0.5,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: Color(0xFF27272A),
                      width: 0.5,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            // Login Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF004FFF),
                  minimumSize: const Size(double.infinity, 52),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  shadowColor: const Color.fromRGBO(43, 127, 255, 0.5),
                  elevation: 10,
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.flash_on, color: Colors.white),
                    const SizedBox(width: 8),
                    Text(
                      AppLocalizations.of(context)!.loginToStart,
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Divider
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Expanded(
                  child: Divider(
                    color: Color(0xFF27272A),
                    indent: 24,
                    endIndent: 10,
                  ),
                ),
                Text(
                  AppLocalizations.of(context)!.or,
                  style: const TextStyle(color: Color(0xFF71717B)),
                ),
                const Expanded(
                  child: Divider(
                    color: Color(0xFF27272A),
                    indent: 10,
                    endIndent: 24,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Guest Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 52),
                  side: const BorderSide(color: Color(0xFF27272A), width: 0.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.guestToStart,
                      style: const TextStyle(
                        color: Color(0xFFD4D4D8),
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(
                      Icons.arrow_forward,
                      color: Color(0xFFD4D4D8),
                      size: 16,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            // Sign up
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppLocalizations.of(context)!.noAccount,
                  style: const TextStyle(color: Color(0xFF71717B)),
                ),
                GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const SignUpScreen(),
                    //   ),
                    // );
                  },
                  child: Text(
                    AppLocalizations.of(context)!.signUp,
                    style: const TextStyle(color: Color(0xFF51A2FF)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
