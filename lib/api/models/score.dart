class Score {
  final int creditScore;
  final Details details;
  final List<Transaction> transactions;

  Score({
    required this.creditScore,
    required this.details,
    required this.transactions,
  });

  factory Score.fromMap(Map<String, dynamic> map) {
    return Score(
      creditScore: map['credit_score']?.toInt() ?? 0,
      details: Details.fromMap(map['details'] ?? {}),

      transactions: map['txs'] != null
          ? (map['txs'] as List<dynamic>)
                .map((x) => Transaction.fromMap(x as Map<String, dynamic>))
                .toList()
          : [],
    );
  }
}

class Details {
  final TxQuality txQuality;
  final Diversification diversification;
  final WalletAge walletAge;
  final GasUsage gasUsage;

  final TotalBalance totalBalance;
  final IncomingOutgoing incomingOutgoing;
  final InterTransactionTime interTransactionTime;

  Details({
    required this.txQuality,
    required this.diversification,
    required this.walletAge,
    required this.gasUsage,

    required this.totalBalance,
    required this.incomingOutgoing,
    required this.interTransactionTime,
  });

  factory Details.fromMap(Map<String, dynamic> map) {
    return Details(
      txQuality: TxQuality.fromMap(map['tx_quality'] ?? {}),
      diversification: Diversification.fromMap(map['diversification'] ?? {}),
      walletAge: WalletAge.fromMap(map['wallet_age'] ?? {}),
      gasUsage: GasUsage.fromMap(map['gas_usage'] ?? {}),

      totalBalance: TotalBalance.fromMap(map['total_balance'] ?? {}),
      incomingOutgoing: IncomingOutgoing.fromMap(
        map['incoming_outgoing'] ?? {},
      ),
      interTransactionTime: InterTransactionTime.fromMap(
        map['inter_transaction_time'] ?? {},
      ),
    );
  }
}

class TxQuality {
  final Map<String, int> frequencyPerYear;
  final Map<String, int> frequencyPerMonth;
  final double failureRate;

  final double avgTxValueUsd;

  TxQuality({
    required this.frequencyPerYear,
    required this.frequencyPerMonth,
    required this.failureRate,
    required this.avgTxValueUsd,
  });

  factory TxQuality.fromMap(Map<String, dynamic> map) {
    return TxQuality(
      frequencyPerYear:
          (map['frequency_per_year'] as Map<String, dynamic>?)
              ?.cast<String, int>() ??
          {},
      frequencyPerMonth:
          (map['frequency_per_month'] as Map<String, dynamic>?)
              ?.cast<String, int>() ??
          {},
      failureRate: map['failure_rate']?.toDouble() ?? 0.0,

      avgTxValueUsd: map['avg_tx_value_usd']?.toDouble() ?? 0.0,
    );
  }
}

class Diversification {
  final int uniqueTokensHeld;
  final int uniqueToAddresses;

  Diversification({
    required this.uniqueTokensHeld,
    required this.uniqueToAddresses,
  });

  factory Diversification.fromMap(Map<String, dynamic> map) {
    return Diversification(
      uniqueTokensHeld: map['unique_tokens_held'] ?? 0,
      uniqueToAddresses: map['unique_to_addresses'] ?? 0,
    );
  }
}

class WalletAge {
  final int walletAgeDays;
  final String firstTxDate;
  final String lastTxDate;

  WalletAge({
    required this.walletAgeDays,
    required this.firstTxDate,
    required this.lastTxDate,
  });

  factory WalletAge.fromMap(Map<String, dynamic> map) {
    return WalletAge(
      walletAgeDays: map['wallet_age_days'] ?? 0,
      firstTxDate: map['first_tx_date'],
      lastTxDate: map['last_tx_date'],
    );
  }
}

class GasUsage {
  final double avgGasPrice;
  final double medianGasPrice;
  final double gasPriceRatio;

  GasUsage({
    required this.avgGasPrice,
    required this.medianGasPrice,
    required this.gasPriceRatio,
  });

  factory GasUsage.fromMap(Map<String, dynamic> map) {
    return GasUsage(
      avgGasPrice: map['avg_gas_price']?.toDouble() ?? 0.0,
      medianGasPrice: map['median_gas_price']?.toDouble() ?? 0.0,
      gasPriceRatio: map['gas_price_ratio']?.toDouble() ?? 0.0,
    );
  }
}

class TotalBalance {
  final double totalBalanceUsd;

  TotalBalance({required this.totalBalanceUsd});

  factory TotalBalance.fromMap(Map<String, dynamic> map) {
    return TotalBalance(
      totalBalanceUsd: map['total_balance_usd']?.toDouble() ?? 0.0,
    );
  }
}

class IncomingOutgoing {
  final int incomingCount;
  final int outgoingCount;
  final double incomingValueUsd;
  final double outgoingValueUsd;
  final double? ioCountRatio;
  final double? ioValueRatio;

  IncomingOutgoing({
    required this.incomingCount,
    required this.outgoingCount,
    required this.incomingValueUsd,
    required this.outgoingValueUsd,
    this.ioCountRatio,
    this.ioValueRatio,
  });

  factory IncomingOutgoing.fromMap(Map<String, dynamic> map) {
    return IncomingOutgoing(
      incomingCount: map['incoming_count'] ?? 0,
      outgoingCount: map['outgoing_count'] ?? 0,
      incomingValueUsd: map['incoming_value_usd']?.toDouble() ?? 0.0,
      outgoingValueUsd: map['outgoing_value_usd']?.toDouble() ?? 0.0,
      ioCountRatio: map['io_count_ratio']?.toDouble(),
      ioValueRatio: map['io_value_ratio']?.toDouble(),
    );
  }
}

class InterTransactionTime {
  final double? avgInterTxSeconds;
  final double? stdInterTxSeconds;

  InterTransactionTime({this.avgInterTxSeconds, this.stdInterTxSeconds});

  factory InterTransactionTime.fromMap(Map<String, dynamic> map) {
    return InterTransactionTime(
      avgInterTxSeconds: map['avg_inter_tx_seconds']?.toDouble(),
      stdInterTxSeconds: map['std_inter_tx_seconds']?.toDouble(),
    );
  }
}

class Transaction {
  final DateTime? blockSignedAt;
  final int? blockHeight;
  final String? blockHash;
  final String? txHash;
  final int? txOffset;
  final bool? successful;
  final String? fromAddress;
  final String? fromAddressLabel;
  final String? toAddress;
  final String? toAddressLabel;
  final double? value;
  final double? valueQuote;
  final String? prettyValueQuote;
  final int? gasOffered;
  final int? gasSpent;
  final int? gasPrice;
  final int? feesPaid;
  final double? gasQuote;
  final String? prettyGasQuote;
  final double? gasQuoteRate;
  final GasMetadata? gasMetadata;

  Transaction({
    this.blockSignedAt,
    this.blockHeight,
    this.blockHash,
    this.txHash,
    this.txOffset,
    this.successful,
    this.fromAddress,
    this.fromAddressLabel,
    this.toAddress,
    this.toAddressLabel,
    this.value,
    this.valueQuote,
    this.prettyValueQuote,
    this.gasOffered,
    this.gasSpent,
    this.gasPrice,
    this.feesPaid,
    this.gasQuote,
    this.prettyGasQuote,
    this.gasQuoteRate,
    this.gasMetadata,
  });

  factory Transaction.fromMap(Map<String, dynamic> map) {
    return Transaction(
      blockSignedAt: map['block_signed_at'] != null
          ? DateTime.parse(map['block_signed_at'])
          : null,
      blockHeight: map['block_height'],
      blockHash: map['block_hash'],
      txHash: map['tx_hash'],
      txOffset: map['tx_offset'],
      successful: map['successful'],
      fromAddress: map['from_address'],
      fromAddressLabel: map['from_address_label'],
      toAddress: map['to_address'],
      toAddressLabel: map['to_address_label'],
      value: map['value'] != null
          ? double.tryParse(map['value'].toString())
          : null,
      valueQuote: map['value_quote']?.toDouble(),
      prettyValueQuote: map['pretty_value_quote'],
      gasOffered: int.tryParse(map['gas_offered']?.toString() ?? ''),
      gasSpent: int.tryParse(map['gas_spent']?.toString() ?? ''),
      gasPrice: int.tryParse(map['gas_price']?.toString() ?? ''),
      feesPaid: int.tryParse(map['fees_paid']?.toString() ?? ''),
      gasQuote: map['gas_quote']?.toDouble(),
      prettyGasQuote: map['pretty_gas_quote'],
      gasQuoteRate: map['gas_quote_rate']?.toDouble(),
      gasMetadata: map['gas_metadata'] != null
          ? GasMetadata.fromMap(map['gas_metadata'] as Map<String, dynamic>)
          : null,
    );
  }
}

class GasMetadata {
  final int? contractDecimals;
  final String? contractTickerSymbol;
  final String? logoUrl;

  GasMetadata({this.contractDecimals, this.contractTickerSymbol, this.logoUrl});

  factory GasMetadata.fromMap(Map<String, dynamic> map) {
    return GasMetadata(
      contractDecimals: map['contract_decimals'],
      contractTickerSymbol: map['contract_ticker_symbol'],
      logoUrl: map['logo_url'],
    );
  }
}
