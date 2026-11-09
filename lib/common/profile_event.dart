typedef ProfileDrawerPressed = void Function({
  required String eventKey,
  Map<String, Object>? eventParams,
});

abstract final class DrawerEventKey {
  // 打开语音识别页面
  static const recognize = 'drawer:recognize:newPage';

  // 打开扫描二维码页面
  static const scan = 'drawer:scan:newPage';

  // 打开vip设置页面
  static const startVip = 'drawer:vip:newPage';

  // 免费听VIP歌曲
  static const tryVipMusic = "drawer:tryVip:newPage";

  // 我的消息
  static const myMessage = "drawer:myMessage:newPage";

  // 我的云贝
  static const myClaud = "drawer:myClaud:newPage";

  // 装扮中心
  static const skin = "drawer:skin:newPage";

  // 创作者中心
  static const creator = "drawer:creator:newPage";

  // 最近播放
  static const recentPlay = "drawer:recentPlay:newPage";

  // 定时关闭
  static const regularClosed = "drawer:regularClosed:newPage";

  // 商城
  static const store = "drawer:store:newPage";

  // 云村有票
  static const ticket = "drawer:ticket:newPage";

  // 云推歌
  static const suggestionMusic = "drawer:suggestionMusic:newPage";

  // 我的客服
  static const customerService = "drawer:customerService:newPage";

  static const setting = "drawer:setting:newPage";

  static const more = "drawer:more:newPage";
}

abstract final class RouterPath {
  // 打开扫描二维码页面
  static const scan = '/profile/scan';
}
