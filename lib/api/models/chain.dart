class Chain {
  final String name;
  final String cId;
  final String iconName;

  Chain({
    required this.name,
    required this.cId,
    required this.iconName,
  });

  factory Chain.fromMapEntry(MapEntry<String, dynamic> entry) {
    return Chain(
      name: entry.key,
      cId: entry.value["c_id"],
      iconName: entry.value["icon_name"],
    );
  }
}

class ChainHeader {
  final String title;
  final List<Chain> chains;

  ChainHeader({
    required this.title,
    required this.chains,
  });
}
