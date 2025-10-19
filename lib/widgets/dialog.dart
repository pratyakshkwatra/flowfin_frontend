import 'package:flowfin/api/models/chain.dart';
import 'package:flowfin/api/models/score.dart';
import 'package:cryptofont/cryptofont.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void showDataDialog(
  BuildContext context,
  Map<String, dynamic> colors,
  Score score,
  Chain chain,
) async {
  final screenSize = MediaQuery.of(context).size;

  Widget sectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16),
      child: Text(
        title,
        style: TextStyle(
          color: colors["primaryColor"],
          fontSize: 22,
          fontWeight: FontWeight.bold,
          shadows: [
            Shadow(blurRadius: 3, color: Colors.black45, offset: Offset(1, 1)),
          ],
        ),
      ),
    );
  }

  Widget labeledText(String label, String value, {IconData? icon}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: colors["primaryColor"].withValues(alpha: 0.8),
              fontSize: 16,
            ),
          ),
          Row(
            children: [
              Text(
                value,
                style: TextStyle(
                  color: colors["primaryColor"],
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              if (icon != null) const SizedBox(width: 4),
              if (icon != null)
                Icon(icon, color: colors["primaryColor"], size: 16),
            ],
          ),
        ],
      ),
    );
  }

  return await showDialog(
    context: context,
    barrierDismissible: true,
    builder: (_) => Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(
        horizontal: screenSize.width * 0.1,
        vertical: screenSize.height * 0.1,
      ),
      child: Container(
        height: screenSize.height * 0.8,
        width: screenSize.width * 0.8,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: List<Color>.from(colors["gradientColors"]),
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),

                    sectionHeader('Transaction Quality'),
                    labeledText(
                      'Failure Rate',
                      "${(score.details.txQuality.failureRate as num).toStringAsFixed(2)} %",
                    ),
                    labeledText(
                      'Average Tx Value',
                      (score.details.txQuality.avgTxValueUsd.toStringAsFixed(2)),
                      icon: CryptoFontIcons.fromSymbol(chain.iconName),
                    ),

                    const SizedBox(height: 12),
                    Divider(color: colors["primaryColor"]),
                    const SizedBox(height: 8),
                    sectionHeader('Diversification'),
                    labeledText(
                      'Unique Tokens Held',
                      score.details.diversification.uniqueTokensHeld.toString(),
                    ),
                    labeledText(
                      'Unique To Addresses',
                      score.details.diversification.uniqueToAddresses
                          .toString(),
                    ),
                    const SizedBox(height: 12),
                    Divider(color: colors["primaryColor"]),
                    const SizedBox(height: 8),
                    sectionHeader('Wallet Age'),
                    labeledText(
                      'Wallet Age',
                      "${score.details.walletAge.walletAgeDays} days",
                    ),
                    labeledText(
                      'First Tx Date',
                      score.details.walletAge.firstTxDate.toString(),
                    ),
                    labeledText(
                      'Last Tx Date',
                      score.details.walletAge.lastTxDate.toString(),
                    ),
                    const SizedBox(height: 12),
                    Divider(color: colors["primaryColor"]),

                    const SizedBox(height: 8),
                    sectionHeader('Gas Usage'),
                    labeledText(
                      'Avg Gas Price',
                      NumberFormat.compact().format(
                        score.details.gasUsage.avgGasPrice,
                      ),
                    ),
                    labeledText(
                      'Median Gas Price',
                      NumberFormat.compact().format(
                        score.details.gasUsage.medianGasPrice,
                      ),
                    ),
                    labeledText(
                      'Gas Price Ratio',
                      (score.details.gasUsage.gasPriceRatio as num)
                          .toStringAsFixed(2),
                    ),
                    const SizedBox(height: 12),
                    Divider(color: colors["primaryColor"]),
                    const SizedBox(height: 8),
                    sectionHeader('Liquidity Lockup'),
                    labeledText(
                      'Total Balance',
                      "\$${NumberFormat.compact().format(score.details.totalBalance.totalBalanceUsd)}",
                    ),
                    const SizedBox(height: 12),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
