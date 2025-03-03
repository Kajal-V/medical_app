import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Dashboard(),
  ));
}

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    // Auto-slide every 3 seconds
    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_currentPage < offerImages.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0; // Reset to first image for looping effect
      }
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer?.cancel(); // Cancel timer to prevent memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.teal.shade700,
        elevation: 0,
        title: Row(
          children: [
            Icon(Icons.location_on, color: Colors.white),
            SizedBox(width: 5),
            Text(
              "Raipur (C.G.)",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            IconButton(
              icon: Icon(Icons.sync, color: Colors.white),
              onPressed: () {
                // Handle location update
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: "Search...",
                filled: true,
                fillColor: Colors.white,
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
              ),
            ),

            SizedBox(height: 20),

            // "What We Offer" Section
            Text(
              "What We Offer",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
            SizedBox(height: 10),

            // Full-Width Image Slider with Infinite Loop
            SizedBox(
              height: 200,
              child: PageView.builder(
                controller: _pageController,
                itemCount: offerImages.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return OfferCard(imagePath: offerImages[index]);
                },
              ),
            ),

            SizedBox(height: 20),

            // "All Category" Section
            Text(
              "All Category",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
            SizedBox(height: 10),

            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                shrinkWrap: true,
                children: [
                  CategoryItem(icon: Icons.local_hospital, label: "Doctor"),
                  CategoryItem(icon: Icons.local_pharmacy, label: "Pharmacy"),
                  CategoryItem(icon: Icons.security, label: "Insurance"),
                  CategoryItem(icon: Icons.home, label: "Home Care"),
                  CategoryItem(icon: Icons.elderly, label: "Old Age Care"),
                  CategoryItem(icon: Icons.biotech, label: "Pathology"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// List of images for the slider
final List<String> offerImages = [
  "assets/images/pills.jpg",
  "assets/images/medical_center.jpg",
];

// Card for "What We Offer" Section - FULL WIDTH IMAGE
class OfferCard extends StatelessWidget {
  final String imagePath;

  OfferCard({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Makes image full width
      height: 200, // Adjust height if needed
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover, // Covers entire container
        ),
      ),
    );
  }
}

// Category Item for Grid View
class CategoryItem extends StatelessWidget {
  final IconData icon;
  final String label;

  CategoryItem({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: Colors.teal.shade100,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: Colors.teal.shade700, size: 30),
        ),
        SizedBox(height: 5),
        Text(
          label,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
