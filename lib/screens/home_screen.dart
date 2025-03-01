import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../category_card.dart';
import '../widgets/category_card.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F8F8),
      body: SafeArea(
        child: Stack(
          children: [
            // Background ClipPath
            ClipPath(
              clipper: HeaderClipper(),
              child: Container(
                height: 320, // Extended to cover part of the cards section
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFFFA726), Color(0xFFFF7043)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
            ),

            // Foreground Content
            Column(
              children: [
                _buildHeader(),
      Expanded(
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 1.1, // Adjust height-width ratio
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8), // Less padding
          crossAxisSpacing: 12, // Reduce spacing
          mainAxisSpacing: 12, // Reduce spacing
          children: [
            CategoryCard(title: "Basics", progress: 4 / 5, icon: Icons.menu_book, color: Colors.orange),
            CategoryCard(title: "Occupations", progress: 1 / 5, icon: Icons.work, color: Colors.red),
            CategoryCard(title: "Conversation", progress: 3 / 5, icon: Icons.chat, color: Colors.blue),
            CategoryCard(title: "Places", progress: 1 / 5, icon: Icons.place, color: Colors.green),
            CategoryCard(title: "Family members", progress: 3 / 5, icon: Icons.group, color: Colors.purple),
            CategoryCard(title: "Foods", progress: 2 / 5, icon: Icons.fastfood, color: Colors.blueGrey),
          ],
        ),
      ),

              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Bar (Back Arrow, Title, Menu Icon)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.arrow_back_ios, color: Colors.white, size: 24), // Back Arrow
              Text(
                "Course", // Title
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              Icon(Icons.more_vert, color: Colors.white, size: 24), // Menu Icon
            ],
          ),
          SizedBox(height: 20),

          // Title Row (Text + Progress Indicator)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Spanish",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  SizedBox(height: 5),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("Beginner", style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold)),
                        Icon(Icons.arrow_drop_down, color: Colors.orange), // Dropdown Arrow
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.diamond, color: Colors.pinkAccent),
                      Icon(Icons.diamond, color: Colors.pinkAccent),
                      SizedBox(width: 5),
                      Text("2 Milestones", style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ],
              ),

              // Progress Indicator
              Stack(
                alignment: Alignment.center,
                children: [
                  CircularPercentIndicator(
                    radius: 50.0,
                    lineWidth: 8.0,
                    animation: true,
                    percent: 0.43,
                    circularStrokeCap: CircularStrokeCap.round,
                    progressColor: Colors.white,
                    backgroundColor: Colors.white.withOpacity(0.2),
                  ),
                  Column(
                    children: [
                      Text(
                        "43%",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.white),
                      ),
                      Text(
                        "Completed",
                        style: TextStyle(fontSize: 12, color: Colors.white.withOpacity(0.8), fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Custom Clipper for Background Shape
class HeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 100); // Extended downward
    path.quadraticBezierTo(size.width / 2, size.height + 20, size.width, size.height - 100);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
