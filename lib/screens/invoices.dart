import 'package:flowfin/screens/invoice_full.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class InvoicesPage extends StatelessWidget {
  const InvoicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final backgroundColor = const Color(0xFFf2e2e3);
    final surfaceColor = Colors.white.withValues(alpha: 0.6);
    final accentColor = const Color(0xFFa188a6);
    final textPrimary = const Color(0xFF1A1B1E);
    final textSecondary = const Color(0xFF6D6D6D);

    final invoices = [
      {
        "id": "#4339",
        "buyer": "ABC Textiles Pvt Ltd",
        "amount": "₹80,000",
        "status": 2,
        "date": DateTime.now().subtract(const Duration(days: 2)),
      },
      {
        "id": "#4340",
        "buyer": "XYZ Apparel Co.",
        "amount": "₹1,25,000",
        "status": 1,
        "date": DateTime.now().subtract(const Duration(days: 1)),
      },
      {
        "id": "#4341",
        "buyer": "LMN Clothing Exports",
        "amount": "₹60,000",
        "status": 3,
        "date": DateTime.now(),
      },
      {
        "id": "#4342",
        "buyer": "RST Garments",
        "amount": "₹95,000",
        "status": 3,
        "date": DateTime.now().subtract(const Duration(days: 5)),
      },
    ];

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
              const SizedBox(height: 24),

              Expanded(
                child: ListView.separated(
                  itemCount: invoices.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 18),
                  itemBuilder: (context, index) {
                    final Map invoice = invoices[index];
                    final dateFormatted = DateFormat(
                      'dd MMM yyyy, hh:mm a',
                    ).format(invoice["date"]);

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => InvoiceDetailPage(),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(18),
                        decoration: BoxDecoration(
                          color: surfaceColor,
                          borderRadius: BorderRadius.circular(18),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.08),
                              blurRadius: 12,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Invoice ${invoice["id"]}",
                                  style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  invoice["amount"]!,
                                  style: GoogleFonts.poppins(
                                    color: accentColor,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),

                            Text(
                              invoice["buyer"]!,
                              style: GoogleFonts.poppins(
                                color: textPrimary,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),

                            const SizedBox(height: 20),

                            _InvoiceProgressStepper(
                              currentStep: invoice["status"] as int,
                              accent: accentColor,
                              textColor: textPrimary,
                            ),

                            const SizedBox(height: 16),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(
                                  Icons.access_time_rounded,
                                  size: 16,
                                  color: textSecondary,
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  dateFormatted,
                                  style: GoogleFonts.poppins(
                                    color: textSecondary,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
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

class _InvoiceProgressStepper extends StatelessWidget {
  final int currentStep;
  final Color accent;
  final Color textColor;

  const _InvoiceProgressStepper({
    required this.currentStep,
    required this.accent,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final steps = [
      {"label": "Created", "icon": Icons.description_rounded},
      {"label": "Processed", "icon": Icons.local_shipping_rounded},
      {"label": "Completed", "icon": Icons.verified_rounded},
    ];

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Positioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  height: 2,
                  margin: const EdgeInsets.symmetric(horizontal: 28),
                  color: Colors.grey.shade300,
                ),
              ),
            ),

            Positioned.fill(
              child: Align(
                alignment: Alignment.centerLeft,
                child: FractionallySizedBox(
                  widthFactor: (currentStep - 1) / (steps.length - 1),
                  child: Container(
                    height: 2,
                    margin: const EdgeInsets.symmetric(horizontal: 28),
                    color: accent,
                  ),
                ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(steps.length, (index) {
                final stepNum = index + 1;
                final isDone = stepNum <= currentStep;

                return Column(
                  children: [
                    Container(
                      width: 38,
                      height: 38,
                      decoration: BoxDecoration(
                        color: isDone ? accent : Colors.grey.shade300,
                        shape: BoxShape.circle,
                        boxShadow: isDone
                            ? [
                                BoxShadow(
                                  color: accent.withValues(alpha: 0.3),
                                  blurRadius: 8,
                                  offset: const Offset(0, 3),
                                ),
                              ]
                            : [],
                      ),
                      child: Icon(
                        steps[index]["icon"] as IconData,
                        size: 20,
                        color: isDone ? Colors.white : Colors.grey.shade700,
                      ),
                    ),
                  ],
                );
              }),
            ),
          ],
        ),

        const SizedBox(height: 10),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(steps.length, (index) {
            final stepNum = index + 1;
            final isDone = stepNum <= currentStep;
            return SizedBox(
              width: 80,
              child: Text(
                steps[index]["label"] as String,
                textAlign: index == 0
                    ? TextAlign.left
                    : index == steps.length - 1
                    ? TextAlign.right
                    : TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 12.5,
                  fontWeight: isDone ? FontWeight.w600 : FontWeight.w400,
                  color: isDone ? textColor : Colors.grey.shade500,
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
