import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF5165A5),
          elevation: 0,
        ),
      ),
      routes: {
        '/': (context) => const Scaffold(body: SafeArea(child: LoginPage())),
        '/menu': (context) => const MenuPage(),
        '/daftar': (context) => const RegisterPage(),
      },
      initialRoute: '/',
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passCtrl.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      Navigator.of(context).pushReplacementNamed('/menu');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Terjadi error: Periksa input')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
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

            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Email', style: TextStyle(fontSize: 12)),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _emailCtrl,
                    decoration: InputDecoration(
                      hintText: 'email',
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 14,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    validator: (v) =>
                        (v == null || v.isEmpty) ? 'Email wajib diisi' : null,
                  ),

                  const SizedBox(height: 16),

                  const Text('Password*', style: TextStyle(fontSize: 12)),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _passCtrl,
                    obscureText: _obscurePassword,
                    onChanged: (_) => setState((){}),
                    decoration: InputDecoration(
                      hintText: 'Min. 8 characters',
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 14,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(_obscurePassword ? Icons.visibility_off : Icons.visibility, color: Colors.black26),
                        onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                      ),
                    ),
                    validator: (v) => (v == null || v.length < 8)
                        ? 'Password minimal 8 karakter'
                        : null,
                  ),

                  const SizedBox(height: 24),

                  // Tombol Login (bergaya) clickable
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: _submit,
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                      ),
                      child: Ink(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFF5165A5), Color(0xFF6E8BE0)],
                          ),
                          borderRadius: BorderRadius.circular(12),
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
                  ),

                  const SizedBox(height: 12),

                  // Tombol Daftar -> navigasi ke RegisterPage
                  Center(
                    child: TextButton(
                      onPressed: () => Navigator.of(context).pushNamed('/daftar'),
                      child: const Text('Daftar', style: TextStyle(color: Color(0xFF5165A5), fontWeight: FontWeight.w600)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Halaman pendaftaran (Daftar Activity)
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  final _confirmCtrl = TextEditingController();
  bool _obscurePass = true;
  bool _obscureConfirm = true;

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passCtrl.dispose();
    _confirmCtrl.dispose();
    super.dispose();
  }

  void _register() {
    if (!(_formKey.currentState?.validate() ?? false)) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Terjadi error: Periksa input')));
      return;
    }
    if (_passCtrl.text != _confirmCtrl.text) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Password dan konfirmasi tidak sama')));
      return;
    }
    // berhasil (demo)
    Navigator.of(context).pushReplacementNamed('/menu');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daftar')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Email', style: TextStyle(fontSize: 12)),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _emailCtrl,
                  decoration: InputDecoration(
                    hintText: 'email',
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  validator: (v) => (v == null || v.isEmpty) ? 'Email wajib diisi' : null,
                ),

                const SizedBox(height: 16),

                const Text('Password', style: TextStyle(fontSize: 12)),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _passCtrl,
                  obscureText: _obscurePass,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    suffixIcon: IconButton(
                      icon: Icon(_obscurePass ? Icons.visibility_off : Icons.visibility, color: Colors.black26),
                      onPressed: () => setState(() => _obscurePass = !_obscurePass),
                    ),
                  ),
                  validator: (v) => (v == null || v.length < 8) ? 'Password minimal 8 karakter' : null,
                ),

                const SizedBox(height: 16),

                const Text('Konfirmasi Password', style: TextStyle(fontSize: 12)),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _confirmCtrl,
                  obscureText: _obscureConfirm,
                  decoration: InputDecoration(
                    hintText: 'Konfirmasi Password',
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    suffixIcon: IconButton(
                      icon: Icon(_obscureConfirm ? Icons.visibility_off : Icons.visibility, color: Colors.black26),
                      onPressed: () => setState(() => _obscureConfirm = !_obscureConfirm),
                    ),
                  ),
                  validator: (v) => (v == null || v.length < 8) ? 'Konfirmasi minimal 8 karakter' : null,
                ),

                const SizedBox(height: 24),

                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: _register,
                    style: ElevatedButton.styleFrom(padding: EdgeInsets.zero, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                    child: Ink(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(colors: [Color(0xFF5165A5), Color(0xFF6E8BE0)]),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(child: Text('Daftar', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600))),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Halaman Menu Activity
class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  static final List<Map<String, dynamic>> items = [
    {
      "kode_produk": "PRD-001",
      "deskripsi": "Good Day Freeze",
      "harga": 15000,
      "stok": 5,
      "rating": 4.8,
      "gambar": "gambar/001.jpg"
    },
    {
      "kode_produk": "PRD-002",
      "deskripsi": "Kapal Api",
      "harga": 20000,
      "stok": 6,
      "rating": 4.7,
      "gambar": "gambar/002.jpg"
    },
    {
      "kode_produk": "PRD-003",
      "deskripsi": "Torabika Coffee",
      "harga": 21000,
      "stok": 5,
      "rating": 4.8,
      "gambar": "gambar/003.jpg"
    },
    {
      "kode_produk": "PRD-004",
      "deskripsi": "Pikopi ",
      "harga": 13000,
      "stok": 5,
      "rating": 4.4,
      "gambar": "gambar/004.jpg"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Menu Activity')),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              leading: Image.asset(item['gambar'], width: 56, height: 56, fit: BoxFit.cover),
              title: Text(item['deskripsi']),
              subtitle: Text('Rp ${item['harga']} • Stok: ${item['stok']}'),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.star, color: Colors.amber, size: 18),
                  Text(item['rating'].toString()),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

