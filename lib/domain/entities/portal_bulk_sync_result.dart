class PortalBulkSyncItemResult {
  const PortalBulkSyncItemResult({
    required this.id,
    required this.status,
  });

  final String id;
  final String status;
}

class PortalBulkSyncResult {
  const PortalBulkSyncResult({
    required this.created,
    required this.updated,
    required this.ignored,
    required this.items,
  });

  final int created;
  final int updated;
  final int ignored;
  final List<PortalBulkSyncItemResult> items;
}
