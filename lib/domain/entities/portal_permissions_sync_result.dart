class PortalPermissionsSyncResult {
  const PortalPermissionsSyncResult({
    required this.synced,
    required this.userIds,
  });

  final int synced;
  final List<int> userIds;
}
