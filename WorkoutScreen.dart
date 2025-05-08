import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WorkoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1F24), // Dark background to match the image
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A1F24), // Match app bar to background
        elevation: 0, // Remove shadow
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Back button functionality
          },
        ),
        title: Text(
          "Treino", // Changed to "Treino" to match your screenshot
          style: GoogleFonts.montserrat(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Thumbnail with play button overlay
            Container(
              height: 200, // Height of the thumbnail
              width: double.infinity, // Full width
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), // Rounded corners
                image: const DecorationImage(
                  image: AssetImage("assets/workout_thumb.png"), // Your image asset
                  fit: BoxFit.cover,
                ),
              ),
              child: const Center(
                child: Icon(
                  Icons.play_circle_fill, // Play button icon
                  color: Colors.white,
                  size: 60, // Larger play button
                ),
              ),
            ),
            const SizedBox(height: 20), // Space between thumbnail and text
            // Title
            Text(
              "LOWER BODY TRAINING",
              style: GoogleFonts.montserrat(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white, // White text to match the theme
              ),
            ),
            const SizedBox(height: 10), // Space between title and description
            // Description
            Text(
              "The lower abdomen and hips are the most difficult\n"
              "areas of the body to reduce when we are on a diet.\n"
              "Even so, in this area, especially the legs as a whole,\n"
              "you can reduce weight even if you don't use tools.",
              style: GoogleFonts.montserrat(
                fontSize: 16,
                color: Colors.white70, // Slightly lighter white for contrast
                height: 1.5, // Line spacing for better readability
              ),
            ),
          ],
        ),
      ),
    );
  }
}