import 'package:flutter/material.dart';
import '../auth/login.dart';
import '../auth/register.dart';

class FrontPage extends StatelessWidget {
  const FrontPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Banner Section
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.blue, Colors.lightBlue],
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
          ),

          SingleChildScrollView(
            child: Column(
              children: [
                // Banner Content
                Container(
                  height: 250, // Mengurangi tinggi banner
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'JOBCOM',
                        style: TextStyle(
                          fontSize: 32, // Mengurangi ukuran font
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                          letterSpacing: 2,
                        ),
                      ),
                      const SizedBox(height: 8), // Mengurangi jarak
                      const Text(
                        'Platform Khusus Pekerjaan\nBidang Komputer',
                        style: TextStyle(
                          fontSize: 16, // Mengurangi ukuran font
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16), // Mengurangi jarak
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const RegisterPage()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.blue,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: const Text('Daftar',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 14)),
                          ),
                          const SizedBox(width: 12),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginPage()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                              backgroundColor: Colors.transparent,
                              foregroundColor: Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side: const BorderSide(color: Colors.white),
                              ),
                            ),
                            child: const Text('Masuk',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 14)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Features Section
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0), // Mengurangi padding
                    child: Column(
                      children: [
                        const Text(
                          'Fitur Utama',
                          style: TextStyle(
                            fontSize: 24, // Mengurangi ukuran font
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 16), // Mengurangi jarak
                        _buildFeatureCard(
                          icon: Icons.work_outline,
                          title: 'Lowongan Khusus IT',
                          description:
                              'Temukan pekerjaan yang sesuai dengan keahlian IT Anda',
                        ),
                        const SizedBox(height: 8), // Mengurangi jarak
                        _buildFeatureCard(
                          icon: Icons.person_outline,
                          title: 'Portofolio Online',
                          description:
                              'Tampilkan karya terbaik Anda dalam portofolio digital',
                        ),
                        const SizedBox(height: 8), // Mengurangi jarak
                        _buildFeatureCard(
                          icon: Icons.auto_awesome_outlined,
                          title: 'Pencocokan Otomatis',
                          description:
                              'Sistem cerdas mencocokkan skill Anda dengan pekerjaan yang tepat',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureCard({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Card(
      elevation: 1, // Mengurangi elevation
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0), // Mengurangi padding
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8), // Mengurangi padding
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                icon,
                size: 24, // Mengurangi ukuran icon
                color: Colors.blue,
              ),
            ),
            const SizedBox(width: 12), // Mengurangi jarak
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16, // Mengurangi ukuran font
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 2), // Mengurangi jarak
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 12, // Mengurangi ukuran font
                      color: Colors.black54,
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
