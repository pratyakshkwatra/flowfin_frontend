import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ComingSoonPage extends StatelessWidget {
  const ComingSoonPage({super.key});

  @override
  Widget build(BuildContext context) {
    final backgroundColor = const Color(0xFFf2e2e3);
    final accentColor = const Color(0xFFa188a6);
    final textPrimary = const Color(0xFF1A1B1E);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.construction_rounded,
                size: 100,
                color: accentColor.withValues(alpha: 0.7),
              ),
              const SizedBox(height: 24),
              Text(
                "Coming Soon",
                style: GoogleFonts.poppins(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: textPrimary,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                "We are working hard to bring this feature to you.",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.grey.shade700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
