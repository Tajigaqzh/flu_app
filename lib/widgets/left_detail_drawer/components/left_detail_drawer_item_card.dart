import 'package:material_ui/material_ui.dart';

import 'package:flu_app/common/iconfont_icons.dart';
import 'package:flu_app/common/profile_event.dart';

class LeftDetailDrawerItemCard extends StatelessWidget {
  const LeftDetailDrawerItemCard({super.key, required this.onPressed});

  final ProfileDrawerPressed onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: ,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(6)),
      ),
      child: Padding(
        padding: const EdgeInsetsGeometry.symmetric(horizontal: 16),
        child: Column(
          children: [
            _DrawerSettingItem(
              leftIcon: IconfontIcons.mianfei,
              leftText: "免费听VIP歌曲",
              rightText: "一键开启",
              withBorder: true,
              rightContent: _RightContent.button,
              onPressed: () {
                onPressed(eventKey: ProfileDrawerEventKey.tryVipMusic);
              },
            ),

            _DrawerSettingItem(
              leftIcon: IconfontIcons.xiaoxi,
              leftText: "我的消息",
              rightText: "12",
              rightContent: _RightContent.toolkit,
              onPressed: () {
                onPressed(eventKey: ProfileDrawerEventKey.myMessage);
              },
            ),

            _DrawerSettingItem(
              leftIcon: IconfontIcons.yun,
              leftText: "我的云贝",
              rightText: "免费兑换黑胶VIP",
              rightContent: _RightContent.text,
              onPressed: () {
                onPressed(eventKey: ProfileDrawerEventKey.myClaud);
              },
            ),

            _DrawerSettingItem(
              leftIcon: IconfontIcons.pifu,
              leftText: "装扮中心",
              rightText: "罗小黑装扮上新",
              rightContent: _RightContent.text,
              onPressed: () {
                onPressed(eventKey: ProfileDrawerEventKey.skin);
              },
            ),
            _DrawerSettingItem(
              leftIcon: IconfontIcons.ideaXiangfa,
              withBorder: true,
              leftText: "创作者中心",
              rightText: "",
              rightContent: _RightContent.none,
              onPressed: () {
                onPressed(eventKey: ProfileDrawerEventKey.creator);
              },
            ),

            _DrawerSettingItem(
              leftIcon: IconfontIcons.shizhong,
              leftText: "最近播放",
              rightText: "4台设备登录",
              rightContent: _RightContent.text,
              onPressed: () {
                onPressed(eventKey: ProfileDrawerEventKey.recentPlay);
              },
            ),

            _DrawerSettingItem(
              leftIcon: IconfontIcons.shizhong,
              leftText: "定时关闭",
              rightText: "",
              withBorder: true,
              rightContent: _RightContent.none,
              onPressed: () {
                onPressed(eventKey: ProfileDrawerEventKey.regularClosed);
              },
            ),

            _DrawerSettingItem(
              leftIcon: IconfontIcons.shangcheng1,
              leftText: "商城",
              rightText: "",
              rightContent: _RightContent.none,
              onPressed: () {
                onPressed(eventKey: ProfileDrawerEventKey.store);
              },
            ),

            _DrawerSettingItem(
              leftIcon: IconfontIcons.piao,
              leftText: "云村有票",
              rightText: "",
              rightContent: _RightContent.none,
              onPressed: () {
                onPressed(eventKey: ProfileDrawerEventKey.ticket);
              },
            ),

            _DrawerSettingItem(
              leftIcon: IconfontIcons.huore,
              leftText: "云推歌",
              rightText: "",
              rightContent: _RightContent.none,
              onPressed: () {
                onPressed(eventKey: ProfileDrawerEventKey.suggestionMusic);
              },
            ),

            _DrawerSettingItem(
              leftIcon: IconfontIcons.kefu,
              leftText: "我的客服",
              rightText: "",
              rightContent: _RightContent.none,
              onPressed: () {
                onPressed(eventKey: ProfileDrawerEventKey.customerService);
              },
            ),
          ],
        ),
      ),
    );
  }
}

enum _RightContent { button, text, none, toolkit }

class _DrawerSettingItem extends StatefulWidget {
  const _DrawerSettingItem({
    required this.leftIcon,
    required this.leftText,
    required this.onPressed,
    this.rightText = "",
    this.withBorder = false,
    this.rightContent = _RightContent.text,
  });

  final VoidCallback onPressed;

  final _RightContent rightContent;
  final IconData leftIcon;
  final String leftText;
  final String rightText;
  final bool withBorder;

  @override
  State<_DrawerSettingItem> createState() => _DrawerSettingItemState();
}

class _DrawerSettingItemState extends State<_DrawerSettingItem> {
  bool _pressed = false;

  double getVerticalHeight() {
    if (widget.rightContent == _RightContent.button) {
      return 6;
    }
    return 16;
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (_) => setState(() => _pressed = true),
      onPointerUp: (_) => setState(() => _pressed = false),
      onPointerCancel: (_) => setState(() => _pressed = false),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: widget.onPressed,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: getVerticalHeight()),
          decoration: widget.withBorder
              ? const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Color(0xffececec), width: 1),
                  ),
                )
              : null,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    widget.leftIcon,
                    color: _pressed
                        ? const Color(0xff000000).withAlpha(100)
                        : const Color(0xff000000),
                    size: 16,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    widget.leftText,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: _pressed
                          ? const Color(0xff000000).withAlpha(100)
                          : const Color(0xff000000),
                    ),
                  ),
                ],
              ),
              Row(children: [generateRight(_pressed)]),
            ],
          ),
        ),
      ),
    );
  }

  Widget generateRight(bool pressed) {
    switch (widget.rightContent) {
      case _RightContent.button:
        return TextButton(
          onPressed: () {},
          style: ButtonStyle(
            backgroundColor: const WidgetStatePropertyAll(Color(0xffffffff)),
            side: WidgetStatePropertyAll(
              BorderSide(
                color: pressed
                    ? const Color(0xffff0000).withAlpha(100)
                    : const Color(0xffff0000),
                width: 1,
              ),
            ),
            padding: const WidgetStatePropertyAll(
              EdgeInsets.symmetric(vertical: 5, horizontal: 14),
            ),
            minimumSize: const WidgetStatePropertyAll(Size(0, 16)),
          ),
          child: Text(
            widget.rightText,
            style: TextStyle(
              color: pressed
                  ? const Color(0xffff0000).withAlpha(100)
                  : const Color(0xffff0000),
            ),
          ),
        );
      case _RightContent.text:
        return Text(
          widget.rightText,
          style: TextStyle(
            color: pressed
                ? const Color(0xff858587).withAlpha(100)
                : const Color(0xff858587),
            fontSize: 10,
          ),
        );

      case _RightContent.none:
        return const SizedBox();
      case _RightContent.toolkit:
        return Container(
          decoration: BoxDecoration(
            color: pressed
                ? const Color(0xffff0000).withAlpha(100)
                : const Color(0xffff0000),
            borderRadius: const BorderRadius.all(Radius.circular(12)),
          ),
          padding: const EdgeInsetsGeometry.symmetric(
            horizontal: 8,
            vertical: 0,
          ),
          child: Text(
            widget.rightText,
            style: const TextStyle(color: Colors.white, fontSize: 13),
          ),
        );
    }
  }
}
