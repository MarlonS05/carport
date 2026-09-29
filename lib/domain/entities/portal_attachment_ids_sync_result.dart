class PortalAttachmentIdsSyncResult {
  const PortalAttachmentIdsSyncResult({
    required this.deleted,
    required this.attachmentIds,
  });

  final int deleted;
  final List<String> attachmentIds;
}
