import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LeaderboardPage extends StatelessWidget {
  const LeaderboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final backgroundColor = const Color(0xFFf2e2e3);
    final surfaceColor = Colors.white.withValues(alpha: 0.6);
    final accentColor = const Color(0xFFa188a6);
    final textPrimary = const Color(0xFF1A1B1E);
    final textSecondary = const Color(0xFF6D6D6D);

    final leaderboard = [
      {"name": "Rohit Sharma", "score": 97, "company": "TexWorld Exports"},
      {"name": "Priya Nair", "score": 94, "company": "SilkLine Traders"},
      {"name": "Rakesh Mehta", "score": 92, "company": "ABC Textiles Pvt Ltd"},
      {"name": "Anjali Kapoor", "score": 89, "company": "Blue Looms Co."},
      {"name": "Amit Khanna", "score": 86, "company": "Urban Threads"},
      {"name": "Kavita Singh", "score": 84, "company": "CottonCraft India"},
    ];

    const currentUser = "Rakesh Mehta";
    const userScore = 92;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_back_ios),
                      ),
                      Text(
                        "Trust Leaderboard",
                        style: GoogleFonts.poppins(
                          color: textPrimary,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    backgroundColor: accentColor.withValues(alpha: 0.15),
                    radius: 18,
                    child: const Icon(Icons.person, color: Colors.black87),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  vertical: 28,
                  horizontal: 20,
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      accentColor.withValues(alpha: 0.9),
                      accentColor.withValues(alpha: 0.7),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: accentColor.withValues(alpha: 0.35),
                      blurRadius: 25,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      "Your Trust Score",
                      style: GoogleFonts.poppins(
                        color: Colors.white.withValues(alpha: 0.9),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "$userScore",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 56,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Excellent Standing",
                      style: GoogleFonts.poppins(
                        color: Colors.white.withValues(alpha: 0.85),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 26),

              Text(
                "Top Performers",
                style: GoogleFonts.poppins(
                  color: textPrimary,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16),

              Expanded(
                child: ListView.separated(
                  itemCount: leaderboard.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 14),
                  itemBuilder: (context, index) {
                    final Map user = leaderboard[index];
                    final rank = index + 1;
                    final isCurrent = user["name"] == currentUser;

                    Color rankColor;
                    switch (rank) {
                      case 1:
                        rankColor = const Color(0xFFFFD700);
                        break;
                      case 2:
                        rankColor = const Color(0xFFC0C0C0);
                        break;
                      case 3:
                        rankColor = const Color(0xFFCD7F32);
                        break;
                      default:
                        rankColor = accentColor;
                    }

                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 14,
                      ),
                      decoration: BoxDecoration(
                        color: isCurrent
                            ? accentColor.withValues(alpha: 0.15)
                            : surfaceColor,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: isCurrent ? 0.02: 0.06),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 38,
                            height: 38,
                            decoration: BoxDecoration(
                              color: rankColor.withValues(alpha: 0.2),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                rank <= 3
                                    ? (rank == 1
                                          ? "🥇"
                                          : rank == 2
                                          ? "🥈"
                                          : "🥉")
                                    : "$rank",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold,
                                  fontSize: rank <= 3 ? 20 : 15,
                                  color: rank <= 3 ? null : rankColor,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 14),

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  user["name"]!,
                                  style: GoogleFonts.poppins(
                                    color: isCurrent
                                        ? accentColor
                                        : textPrimary,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15.5,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  user["company"]!,
                                  style: GoogleFonts.poppins(
                                    color: textSecondary,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Text(
                            "${user["score"]}",
                            style: GoogleFonts.poppins(
                              color: accentColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
