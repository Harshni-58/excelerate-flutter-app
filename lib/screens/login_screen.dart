import 'package:flutter/material.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController =
  TextEditingController();

  final TextEditingController passwordController =
  TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFFF7A00),
              Color(0xFFFF1493),
            ],
          ),
        ),

        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),

            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 500,
                ),

                child: Column(
                  children: [
                    const SizedBox(height: 40),

                    // EXCELERATE LOGO / ICON
                    Container(
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            blurRadius: 12,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.school,
                        size: 65,
                        color: Color(0xFFFF1493),
                      ),
                    ),

                    const SizedBox(height: 20),

                    const Text(
                      'EXCELERATE',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                    ),

                    const SizedBox(height: 5),

                    const Text(
                      'Learn • Grow • Succeed',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),

                    const SizedBox(height: 35),

                    // LOGIN CARD
                    Card(
                      elevation: 8,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22),
                      ),

                      child: Padding(
                        padding: const EdgeInsets.all(25),

                        child: Column(
                          children: [
                            const Text(
                              'Welcome Back!',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 27,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 8),

                            const Text(
                              'Login to continue your Excelerate journey.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                              ),
                            ),

                            const SizedBox(height: 30),

                            // EMAIL
                            TextField(
                              controller: emailController,
                              keyboardType:
                              TextInputType.emailAddress,

                              decoration: InputDecoration(
                                labelText: 'Email',
                                hintText: 'Enter your email',
                                prefixIcon: const Icon(
                                  Icons.email,
                                  color: Color(0xFFFF7A00),
                                ),

                                focusedBorder:
                                OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.circular(12),
                                  borderSide: const BorderSide(
                                    color: Color(0xFFFF1493),
                                    width: 2,
                                  ),
                                ),

                                border: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.circular(12),
                                ),
                              ),
                            ),

                            const SizedBox(height: 20),

                            // PASSWORD
                            TextField(
                              controller: passwordController,
                              obscureText: true,

                              decoration: InputDecoration(
                                labelText: 'Password',
                                hintText: 'Enter your password',
                                prefixIcon: const Icon(
                                  Icons.lock,
                                  color: Color(0xFFFF1493),
                                ),

                                focusedBorder:
                                OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.circular(12),
                                  borderSide: const BorderSide(
                                    color: Color(0xFFFF1493),
                                    width: 2,
                                  ),
                                ),

                                border: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.circular(12),
                                ),
                              ),
                            ),

                            const SizedBox(height: 25),

                            // GRADIENT LOGIN BUTTON
                            SizedBox(
                              width: double.infinity,
                              height: 52,

                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  gradient:
                                  const LinearGradient(
                                    colors: [
                                      Color(0xFFFF7A00),
                                      Color(0xFFFF1493),
                                    ],
                                  ),

                                  borderRadius:
                                  BorderRadius.circular(12),
                                ),

                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                        const HomeScreen(),
                                      ),
                                    );
                                  },

                                  style:
                                  ElevatedButton.styleFrom(
                                    backgroundColor:
                                    Colors.transparent,
                                    shadowColor:
                                    Colors.transparent,
                                  ),

                                  child: const Text(
                                    'LOGIN',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1,
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(height: 20),

                            const Text(
                              'Excelerate • Learn • Grow • Succeed',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}