typedef ProfileDrawerPressed = void Function({
  required String eventKey,
  Map<String, Object?>? eventParams,
});

abstract final class ProfileDrawerEventKey {
  // 打开语音识别页面
  static const recognize = 'profile:recognize:newPage';

  // 打开扫描二维码页面
  static const scan = 'profile:scan:newPage';

  // 打开vip设置页面
  static const startVip = 'profile:vip:start';
}
