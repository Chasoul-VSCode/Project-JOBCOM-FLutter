import 'package:flutter/material.dart';
import '../layouts/appbar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Header
            Center(
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.blue,
                    child: Icon(Icons.person, size: 40, color: Colors.white),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton.icon(
                    onPressed: () {
                      // TODO: Implement photo upload
                    },
                    icon: const Icon(Icons.camera_alt, size: 18),
                    label: const Text('Change Photo', style: TextStyle(fontSize: 13)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // CV Upload Section
            Card(
              child: ListTile(
                leading: const Icon(Icons.upload_file, size: 20),
                title: const Text('Upload CV', style: TextStyle(fontSize: 14)),
                subtitle: const Text('PDF format (Max 5MB)', style: TextStyle(fontSize: 12)),
                trailing: IconButton(
                  icon: const Icon(Icons.add, size: 20),
                  onPressed: () {
                    // TODO: Implement CV upload
                  },
                ),
                dense: true,
              ),
            ),

            // Portfolio Section
            const SizedBox(height: 12),
            const Text('Portfolio', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Card(
              child: ListTile(
                leading: const Icon(Icons.work, size: 20),
                title: const Text('Add Portfolio', style: TextStyle(fontSize: 14)),
                subtitle: const Text('Share your work samples', style: TextStyle(fontSize: 12)),
                trailing: IconButton(
                  icon: const Icon(Icons.add, size: 20),
                  onPressed: () {
                    // TODO: Implement portfolio upload
                  },
                ),
                dense: true,
              ),
            ),

            // Skills Section
            const SizedBox(height: 12),
            const Text('Skills', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Wrap(
              spacing: 6,
              children: [
                Chip(
                  label: const Text('Flutter', style: TextStyle(fontSize: 12)),
                  deleteIcon: const Icon(Icons.close, size: 16),
                  onDeleted: () {},
                  padding: const EdgeInsets.all(4),
                ),
                ActionChip(
                  label: const Text('+ Add Skill', style: TextStyle(fontSize: 12)),
                  onPressed: () {
                    // TODO: Implement add skill
                  },
                  padding: const EdgeInsets.all(4),
                ),
              ],
            ),

            // Certifications Section
            const SizedBox(height: 12),
            const Text('Certifications', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Card(
              child: ListTile(
                title: const Text('Add Certification', style: TextStyle(fontSize: 14)),
                trailing: IconButton(
                  icon: const Icon(Icons.add, size: 20),
                  onPressed: () {
                    // TODO: Implement add certification
                  },
                ),
                dense: true,
              ),
            ),

            // Work Experience Section
            const SizedBox(height: 12),
            const Text('Work Experience', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Card(
              child: ListTile(
                title: const Text('Add Work Experience', style: TextStyle(fontSize: 14)),
                subtitle: const Text('Add your previous jobs', style: TextStyle(fontSize: 12)),
                trailing: IconButton(
                  icon: const Icon(Icons.add, size: 20),
                  onPressed: () {
                    // TODO: Implement add work experience
                  },
                ),
                dense: true,
              ),
            ),
            
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // TODO: Implement save profile
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                child: const Text('Save Profile', style: TextStyle(fontSize: 14)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
