import 'package:flowfin/screens/history.dart';
import 'package:flowfin/screens/invoice_full.dart';
import 'package:flowfin/screens/leaderboard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flowfin/api/models/user.dart';
import 'package:flowfin/services/auth.dart';

class HomePage extends StatelessWidget {
  final AuthService authService;
  final User user;

  const HomePage({super.key, required this.authService, required this.user});

  @override
  Widget build(BuildContext context) {
    final surfaceColor = Colors.white.withValues(alpha: 0.6);
    const accentColor = Color(0xFFa188a6);
    const accentDark = Color(0xFF4E46B4);
    const textPrimary = Color(0xFF1A1B1E);
    const textSecondary = Color(0xFF6D6D6D);

    final topInvoices = [
      {
        "buyer": "ABC Textiles",
        "amount": "₹1,00,000",
        "status": "Open for Funding",
        "due": "15 days",
        "trust": "4.8",
      },
      {
        "buyer": "XYZ Apparel",
        "amount": "₹50,000",
        "status": "60% Funded",
        "due": "20 days",
        "trust": "4.5",
      },
      {
        "buyer": "LMN Clothing",
        "amount": "₹1,20,000",
        "status": "Fully Funded",
        "due": "5 days",
        "trust": "4.9",
      },
    ];
    final popularInvoices = [
      {
        "buyer": "PQR Garments",
        "amount": "₹75,000",
        "days": "10 days",
        "risk": "Medium Risk",
      },
      {
        "buyer": "QWE Exports",
        "amount": "₹60,000",
        "days": "7 days",
        "risk": "Low Risk",
      },
      {
        "buyer": "RST Weaves",
        "amount": "₹90,000",
        "days": "5 days",
        "risk": "High Risk",
      },
    ];
    final List gridItems = [
      {"title": "Call", "icon": Icons.call},
      {"title": "Score", "icon": Icons.leaderboard},
      {"title": "Scanner", "icon": Icons.qr_code_scanner},
      {"title": "History", "icon": Icons.history},
    ];
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Good Afternoon, Rakesh!",
                  style: GoogleFonts.poppins(
                    color: textPrimary,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                CircleAvatar(
                  backgroundColor: accentColor.withValues(alpha: 0.1),
                  radius: 18,
                  child: const Icon(Icons.person),
                ),
              ],
            ),
          ),

          const SizedBox(height: 18),

          CarouselSlider(
            items: topInvoices.map((invoice) {
              return Builder(
                builder: (BuildContext context) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => InvoiceDetailPage()),
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: surfaceColor,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.07),
                            blurRadius: 20,
                            spreadRadius: 2,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  invoice["buyer"]!,
                                  style: GoogleFonts.poppins(
                                    color: textPrimary,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: accentColor.withValues(alpha: 0.1),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.business_rounded,
                                  color: accentColor,
                                  size: 22,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Amount",
                                    style: GoogleFonts.poppins(
                                      color: textSecondary,
                                      fontSize: 13,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    invoice["amount"]!,
                                    style: GoogleFonts.poppins(
                                      color: accentColor,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "Due in",
                                    style: GoogleFonts.poppins(
                                      color: textSecondary,
                                      fontSize: 13,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    invoice["due"]!,
                                    style: GoogleFonts.poppins(
                                      color: textPrimary,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: accentColor.withValues(alpha: 0.12),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  invoice["status"]!,
                                  style: GoogleFonts.poppins(
                                    color: accentDark,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star_rounded,
                                    color: textSecondary,
                                    size: 18,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    invoice["rating"] ?? "4.5",
                                    style: GoogleFonts.poppins(
                                      color: textPrimary,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }).toList(),
            options: CarouselOptions(
              height: 190,
              clipBehavior: Clip.none,
              aspectRatio: 16 / 9,
              viewportFraction: 0.95,
              enableInfiniteScroll: true,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 15),
              autoPlayAnimationDuration: const Duration(milliseconds: 1500),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.25,
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 4,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1,
                children: List.generate(4, (index) {
                  return GestureDetector(
                    onTap: () {
                      if (index == 3) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => HistoryPage()),
                        );
                      }
                      if (index == 1) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => LeaderboardPage()),
                        );
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.7),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: accentColor.withValues(alpha: 0.2),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(gridItems[index]["icon"]),
                          Text(
                            gridItems[index]["title"],
                            style: const TextStyle(fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Popular Invoices",
                  style: GoogleFonts.poppins(
                    color: textPrimary,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "View All",
                    style: GoogleFonts.poppins(
                      color: textSecondary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: popularInvoices.length,
            separatorBuilder: (_, __) => const SizedBox(height: 10),
            itemBuilder: (context, index) {
              final invoice = popularInvoices[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => InvoiceDetailPage()),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: surfaceColor,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.04),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 6,
                    ),
                    title: Text(
                      invoice["buyer"]!,
                      style: GoogleFonts.poppins(
                        color: textPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: Text(
                      "${invoice["days"]} • ${invoice["risk"]}",
                      style: GoogleFonts.poppins(
                        color: textSecondary,
                        fontSize: 13,
                      ),
                    ),
                    trailing: Text(
                      invoice["amount"]!,
                      style: GoogleFonts.poppins(
                        color: accentColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    onTap: () {},
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
