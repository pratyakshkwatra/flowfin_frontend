import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final backgroundColor = const Color(0xFFf2e2e3);
    final surfaceColor = Colors.white.withValues(alpha: 1);
    final accentColor = const Color(0xFFa188a6);
    final successColor = const Color(0xFF5BB381);
    final pendingColor = Color(0xFF1A1B1E);
    final failedColor = const Color(0xFFD9534F);
    final textPrimary = const Color(0xFF1A1B1E);
    final textSecondary = const Color(0xFF6D6D6D);

    final transactions = [
      {
        "id": "#5031",
        "buyer": "Cotton Mills Ltd",
        "amount": "₹1,20,000",
        "status": "Completed",
        "date": DateTime.now().subtract(const Duration(days: 1, hours: 3)),
      },
      {
        "id": "#5030",
        "buyer": "Denim & Co.",
        "amount": "₹90,500",
        "status": "Pending",
        "date": DateTime.now().subtract(const Duration(days: 2, hours: 5)),
      },
      {
        "id": "#5029",
        "buyer": "Urban Threads Pvt Ltd",
        "amount": "₹1,75,000",
        "status": "Completed",
        "date": DateTime.now().subtract(const Duration(days: 3, hours: 2)),
      },
      {
        "id": "#5028",
        "buyer": "Elegant Exports",
        "amount": "₹78,000",
        "status": "Failed",
        "date": DateTime.now().subtract(const Duration(days: 4, hours: 7)),
      },
    ];

    Color statusColor(String status) {
      switch (status) {
        case "Completed":
          return successColor;
        case "Pending":
          return pendingColor;
        case "Failed":
          return failedColor;
        default:
          return textSecondary;
      }
    }

    IconData statusIcon(String status) {
      switch (status) {
        case "Completed":
          return Icons.check_circle_rounded;
        case "Pending":
          return Icons.hourglass_bottom_rounded;
        case "Failed":
          return Icons.cancel_rounded;
        default:
          return Icons.info_rounded;
      }
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [GestureDetector(onTap: () {
                      Navigator.pop(context);
                    }, child: Icon(Icons.arrow_back_ios)),
                  Text(
                    "Transaction History",
                    style: GoogleFonts.poppins(
                    color: textPrimary,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                  ),],
                  ),
                  CircleAvatar(
                    backgroundColor: accentColor.withValues(alpha: 0.15),
                    radius: 18,
                    child: const Icon(Icons.person, color: Colors.black87),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              Expanded(
                child: ListView.separated(
                  itemCount: transactions.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    final Map txn = transactions[index];
                    final dateFormatted = DateFormat(
                      'dd MMM yyyy, hh:mm a',
                    ).format(txn["date"] as DateTime);

                    return Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 18,
                        horizontal: 18,
                      ),
                      decoration: BoxDecoration(
                        color: surfaceColor,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.07),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 44,
                            height: 44,
                            decoration: BoxDecoration(
                              color: statusColor(
                                txn["status"]!,
                              ).withValues(alpha: 0.15),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              statusIcon(txn["status"]!),
                              color: statusColor(txn["status"]!),
                              size: 24,
                            ),
                          ),
                          const SizedBox(width: 14),

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  txn["buyer"]!,
                                  style: GoogleFonts.poppins(
                                    color: textPrimary,
                                    fontSize: 15.5,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  dateFormatted,
                                  style: GoogleFonts.poppins(
                                    color: textSecondary,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                txn["amount"]!,
                                style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Icon(
                                    statusIcon(txn["status"]!),
                                    size: 14,
                                    color: statusColor(txn["status"]!),
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    txn["status"]!,
                                    style: GoogleFonts.poppins(
                                      color: statusColor(txn["status"]!),
                                      fontSize: 12.5,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ],
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
