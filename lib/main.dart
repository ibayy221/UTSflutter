import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 24.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header: logo di kiri, teks tersusun vertikal di kanan
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('gambar/Logo.png', width: 90),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'LKS',
                            style: TextStyle(
                              fontSize: 34,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF3A5BA0),
                            ),
                          ),
                          Text(
                            'MART',
                            style: TextStyle(
                              fontSize: 34,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF3A5BA0),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 32),

                  // Judul Sign In dan subjudul
                  const Text(
                    'Sign In',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Enter your ID and password to sign in!',
                    style: TextStyle(color: Colors.black54),
                  ),

                  const SizedBox(height: 24),

                  // Field Email (placeholder visual)
                  const Text('Email', style: TextStyle(fontSize: 12)),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.black12),
                    ),
                    height: 48,
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'email',
                        style: TextStyle(color: Colors.black38),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Field Password (placeholder visual)
                  const Text('Password*', style: TextStyle(fontSize: 12)),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.black12),
                    ),
                    height: 48,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Min. 8 characters',
                          style: TextStyle(color: Colors.black38),
                        ),
                        Icon(Icons.remove_red_eye, color: Colors.black26),
                      ],
                    ),
                  ),

                  const SizedBox(height: 12),

                  Row(
                    children: const [
                      Icon(
                        Icons.check_box_outline_blank,
                        color: Colors.black26,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Keep me logged in',
                        style: TextStyle(color: Colors.black54),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

             
                  // Tombol Login (bergaya)
                  Center(
                    child: Container(
                      width: double.infinity,
                      height: 48,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        gradient: const LinearGradient(
                          colors: [Color(0xFF5165A5), Color(0xFF6E8BE0)],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.purple.withOpacity(0.25),
                            blurRadius: 12,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text(
                          'Belum punya akun?',
                          style: TextStyle(color: Colors.black54),
                        ),
                        SizedBox(width: 6),
                        Text(
                          'Daftar di sini',
                          style: TextStyle(
                            color: Color(0xFF5165A5),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
