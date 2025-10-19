String shortenAddress(String address, {double? percentage}) {
  if (address.length <= 10) return address;
  return '${address.substring(0, 5)}...${address.substring(address.length - (address.length * (percentage ?? 0.2)).round())}';
}
