/// 非 Web 平台的占位实现，避免引用 web/js 相关库导致编译失败。
Future<void> triggerWebDownload(List<int> bytes, String fileName) async {
  // No-op on non-web platforms.
}
