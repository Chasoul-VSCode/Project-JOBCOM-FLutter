import 'package:flutter/material.dart';

import '../pages/profile.dart';
import '../layouts/appbar.dart';
import '../layouts/sidebar.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      labelColor: Colors.blue,
      unselectedLabelColor: Colors.grey,
      indicatorColor: Colors.blue,
      tabs: const [
        Tab(text: 'Home', icon: Icon(Icons.home)),
        Tab(text: 'Recommendations', icon: Icon(Icons.search)), 
        Tab(text: 'Profile', icon: Icon(Icons.person)),
      ],
      onTap: (index) {
        if (index == 2) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const Scaffold(
                appBar: CustomAppBar(title: 'Profile'),
                drawer: Sidebar(),
                body: ProfilePage(),
              ),
            ),
          );
        }
      },
    );
  }
}
