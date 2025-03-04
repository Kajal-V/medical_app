import 'dart:async';
import 'package:flutter/material.dart';
import 'add_customer.dart';


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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0), // Set the height
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(25),
          ),
          child: AppBar(
            backgroundColor: Color(0xFF0E606E),
            foregroundColor: Colors.white,
            elevation: 0,
            title: Row(
              children: [
                Icon(Icons.location_on, color: Colors.white),
                SizedBox(width: 5),
                Text(
                  "Raipur (C.G.)",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
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
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Full-Width Image Slider with Infinite Loop
            SizedBox(
              height: 170,
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
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  CategoryItem(imgPath: 'assets/images/category/user.png', label: "Add Customer "),
                  CategoryItem(imgPath: 'assets/images/category/add-product.png', label: "Add Product  "),
                  CategoryItem(imgPath: 'assets/images/category/order.png', label: "Order History"),
                  CategoryItem(imgPath: 'assets/images/category/profile.png', label: "My Profile"),

                ],
              ),
            ),



          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(10),
        child: SizedBox(
          width: double.infinity,
          height: 45,
        child: ElevatedButton(
            onPressed: (){
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => AddCustomerScreen()),
              );
            },
            style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF0E606E)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("View Recent Order", style: TextStyle(color: Colors.white, fontSize: 16),),
                SizedBox(width: 8,),
                Stack(
                  children: [
                    Icon(Icons.notifications, color: Colors.white, size: 25,),
                    Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 2,horizontal: 6),
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          constraints: BoxConstraints(
                            minHeight: 4,
                            minWidth: 6,
                          ),
                          child: Text("1",style: TextStyle(fontSize: 9, fontWeight: FontWeight.w700, color: Colors.black),),
                        ))
                  ],
                ),

              ],
            )
        ),
        ),
      ),
    );
  }
}

// List of images for the slider
final List<String> offerImages = [
  // "assets/images/pills.jpg",
  // "assets/images/medical_center.jpg",
  "https://trinitysoftwares.in/myprojects/mediport/assets/img/silder/s1.png",
  "https://trinitysoftwares.in/myprojects/mediport/assets/img/silder/s2.png",
];

// Card for "What We Offer" Section - FULL WIDTH IMAGE
class OfferCard extends StatelessWidget {
  final String imagePath;

  OfferCard({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Makes image full width
      height: 170, // Adjust height if needed
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          // image: AssetImage(imagePath),
          image: NetworkImage(imagePath),
          fit: BoxFit.cover, // Covers entire container
        ),
      ),
    );
  }
}

// Category Item for Grid View
class CategoryItem extends StatelessWidget {
  final String imgPath;
  final String label;

  CategoryItem({required this.imgPath, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded( // Prevents overflow
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // Centers content
              children: [
                Center(
                  child: SizedBox(
                    width: 65,
                    height: 65, // Ensure image fits
                    child: Image.asset(imgPath),
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    border: Border(top: BorderSide(color: Color(0xFF0E606E), width: 1)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 4), // Add some padding
                    child: Text(
                      label,
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xFF0E606E)),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
