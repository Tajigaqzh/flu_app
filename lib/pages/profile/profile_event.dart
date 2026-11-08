typedef ProfileDrawerPressed = void Function({
  required String eventKey,
  Map<String, Object>? eventParams,
});

abstract final class ProfileDrawerEventKey {
  // 打开语音识别页面
  static const recognize = 'profile:recognize:newPage';

  // 打开扫描二维码页面
  static const scan = 'profile:scan:newPage';

  // 打开vip设置页面
  static const startVip = 'profile:vip:newPage';

  // 免费听VIP歌曲
  static const tryVipMusic = "profile:tryVip:newPage";

  // 我的消息
  static const myMessage = "profile:myMessage:newPage";

  // 我的云贝
  static const myClaud = "profile:myClaud:newPage";

  // 装扮中心
  static const skin = "profile:skin:newPage";

  // 创作者中心
  static const creator = "profile:creator:newPage";

  // 最近播放
  static const recentPlay = "profile:recentPlay:newPage";

  // 定时关闭
  static const regularClosed = "profile:regularClosed:newPage";

  // 商城
  static const store = "profile:store:newPage";

  // 云村有票
  static const ticket = "profile:ticket:newPage";

  // 云推歌
  static const suggestionMusic = "profile:suggestionMusic:newPage";

  // 我的客服
  static const customerService = "profile:customerService:newPage";
}
