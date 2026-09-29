class PortalCheckinResult {
  const PortalCheckinResult({
    required this.isDatabaseSync,
    required this.users,
  });

  final bool isDatabaseSync;
  final Map<int, String> users;
}
