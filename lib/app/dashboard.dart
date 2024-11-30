import 'package:flutter/material.dart';
import '../layouts/appbar.dart';
import '../layouts/navbar.dart';
import '../layouts/sidebar.dart';
import '../pages/profile.dart';
import '../pages/home.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: const CustomAppBar(title: 'Dashboard'),
        drawer: const Sidebar(),
        bottomNavigationBar: TabBar(
          controller: _tabController,
          labelColor: Colors.blue,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.blue,
          tabs: const [
            Tab(text: 'Home', icon: Icon(Icons.home)),
            Tab(text: 'Search', icon: Icon(Icons.search)),
            Tab(text: 'Profile', icon: Icon(Icons.person)),
          ],
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            // Home Tab
            const HomePage(),
            
            // Search Tab
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Search jobs...',
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: const EdgeInsets.only(bottom: 10),
                          child: ListTile(
                            title: Text('Job Position ${index + 1}'),
                            subtitle: const Text('Company Name'),
                            trailing: const Icon(Icons.arrow_forward_ios),
                            onTap: () {
                              // TODO: Navigate to job details
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            
            // Profile Tab
            const ProfilePage(),
          ],
        ),
      ),
    );
  }
}
