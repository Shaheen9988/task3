import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final double progress;
  final IconData icon;
  final Color color;

  CategoryCard({required this.title, required this.progress, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 6, spreadRadius: 2),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Icon inside a circle
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1), // Light background for the circle
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 32, color: color), // Adjust icon size
          ),
          SizedBox(height: 8),

          // Title Text
          Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          SizedBox(height: 4),

          // Progress Text (e.g., "4/5")
          Text(
            "${(progress * 5).toInt()}/5", // Convert fraction to actual number
            style: TextStyle(fontSize: 14, color: Colors.grey[700], fontWeight: FontWeight.w500),
          ),

          // Progress Indicator (Optional)
          SizedBox(height: 6),
          LinearProgressIndicator(
            value: progress,
            backgroundColor: Colors.grey[300],
            color: color,
            minHeight: 4,
            borderRadius: BorderRadius.circular(4),
          ),
        ],
      ),
    );
  }
}
