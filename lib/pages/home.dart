import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0), // Reduced padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12), // Reduced padding
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(6), // Smaller radius
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: 'Search jobs...',
                    border: InputBorder.none,
                    icon: Icon(Icons.search, size: 20), // Smaller icon
                  ),
                ),
              ),
              
              const SizedBox(height: 16), // Reduced spacing
              
              // Recent Job Searches
              const Text(
                'Recent Job Searches',
                style: TextStyle(
                  fontSize: 16, // Smaller font
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8), // Reduced spacing
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildRecentSearchChip('Software Engineer'),
                    _buildRecentSearchChip('Flutter Developer'),
                    _buildRecentSearchChip('Mobile Developer'),
                    _buildRecentSearchChip('Frontend Developer'),
                  ],
                ),
              ),

              const SizedBox(height: 16), // Reduced spacing

              // Recommended Jobs
              const Text(
                'Recommended Jobs',
                style: TextStyle(
                  fontSize: 16, // Smaller font
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8), // Reduced spacing
              _buildJobCard(
                'Senior Flutter Developer',
                'Google Inc.',
                'Mountain View, CA',
                '\$120k - \$150k/year',
              ),
              _buildJobCard(
                'Mobile App Developer',
                'Facebook',
                'Menlo Park, CA',
                '\$100k - \$130k/year',
              ),
              _buildJobCard(
                'Software Engineer',
                'Microsoft',
                'Redmond, WA',
                '\$110k - \$140k/year',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRecentSearchChip(String label) {
    return Container(
      margin: const EdgeInsets.only(right: 6), // Reduced margin
      child: Chip(
        label: Text(
          label,
          style: const TextStyle(fontSize: 12), // Smaller font
        ),
        backgroundColor: Colors.blue[50],
        deleteIcon: const Icon(Icons.arrow_forward, size: 12), // Smaller icon
        onDeleted: () {},
        padding: const EdgeInsets.all(4), // Reduced padding
      ),
    );
  }

  Widget _buildJobCard(String title, String company, String location, String salary) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8), // Reduced margin
      child: Padding(
        padding: const EdgeInsets.all(12), // Reduced padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 40, // Smaller container
                  height: 40, // Smaller container
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(6), // Smaller radius
                  ),
                  child: const Icon(Icons.business, color: Colors.grey, size: 20), // Smaller icon
                ),
                const SizedBox(width: 12), // Reduced spacing
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 14, // Smaller font
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        company,
                        style: TextStyle(
                          fontSize: 12, // Smaller font
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.bookmark_border, size: 20), // Smaller icon
              ],
            ),
            const SizedBox(height: 12), // Reduced spacing
            Row(
              children: [
                Icon(Icons.location_on_outlined, size: 14, color: Colors.grey[600]), // Smaller icon
                const SizedBox(width: 2), // Reduced spacing
                Text(
                  location,
                  style: TextStyle(
                    fontSize: 12, // Smaller font
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(width: 12), // Reduced spacing
                Icon(Icons.attach_money, size: 14, color: Colors.grey[600]), // Smaller icon
                const SizedBox(width: 2), // Reduced spacing
                Text(
                  salary,
                  style: TextStyle(
                    fontSize: 12, // Smaller font
                    color: Colors.grey[600],
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
