import 'package:flu_app/common/iconfont_icons.dart';
import 'package:flu_app/common/math_util.dart';
import 'package:flu_app/widgets/action_icon/action_icon.dart';
import 'package:flutter_svg/svg.dart';
import 'package:material_ui/material_ui.dart';

/// Profile 页面的顶部区域组件。
/// 显示 Profile 页面的渐变顶部区域和快捷操作图标。
class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
    required this.onOpenLeftDetailDrawer,
    this.statusText = '添加状态',
  });

  final VoidCallback onOpenLeftDetailDrawer;
  final String statusText;

  List<Widget> _getFanAndSubscribe(int follow,
      int fan,
      String level,
      int hour,) {
    return [
      Text(
        "$follow关注",
        style: const TextStyle(fontSize: 12, color: Colors.white),
      ),
      Text("$fan粉丝",
          style: const TextStyle(fontSize: 12, color: Colors.white)),
      Text(
        "Lv.$level",
        style: const TextStyle(fontSize: 12, color: Colors.white),
      ),
      Text(
        "$hour小时",
        style: const TextStyle(fontSize: 12, color: Colors.white),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final topInset = MediaQuery.paddingOf(context).top;
    return Container(
      height: 350,
      width: double.infinity,
      alignment: Alignment.topLeft,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xff351910), Color(0xff1b0b05)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: Padding(
          padding: EdgeInsets.only(top: topInset * 0.75),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                height: 48,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          IconfontIcons.add,
                          color: Colors.white,
                          size: 10,
                        ),
                        Text(
                          statusText,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ActionIcon(
                          icon: IconfontIcons.fold,
                          label: '折叠',
                          size: 20,
                          onPressed: onOpenLeftDetailDrawer,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ActionIcon(
                              icon: IconfontIcons.add,
                              label: '添加',
                              onPressed: () {},
                              compact: true,
                            ),
                            ActionIcon(
                              icon: IconfontIcons.search,
                              label: '搜索',
                              onPressed: () {},
                              compact: true,
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                IconfontIcons.moreVertical,
                                size: 20,
                                color: Colors.white,
                              ),
                              tooltip: '更多',
                              padding: EdgeInsets.zero,
                              style: const ButtonStyle(
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              constraints: const BoxConstraints.tightFor(
                                width: 30,
                                height: 30,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 0, right: 0, top: 10),
                  child: Column(
                    children: [
                      Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: SvgPicture.asset(
                            'assets/images/svg/profile/default_avatar.svg',
                            width: 60,
                            height: 60,
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "毛毛qzh",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                          SvgPicture.asset(
                            "/assets/images/svg/profile/vip.svg",
                            width: 40,
                            height: 12,
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "3枚勋章",
                            style: TextStyle(fontSize: 9, color: Colors.white),
                          ),
                        ],
                      ),

                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 18,
                        children: _getFanAndSubscribe(10, 0, "6", 103),
                      ),

                      const SizedBox(height: 12),

                      Padding(
                          padding: EdgeInsetsGeometry.only(left: 15, right: 15),
                          child:
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            spacing: 12,
                            children: [
                              _HeaderActionButton(
                                title: "测试",
                                icon: Icons.add,
                                onPressed: () {},
                              ),
                              _HeaderActionButton(
                                title: "测试",
                                icon: Icons.add,
                                onPressed: () {},
                              ),
                              _HeaderActionButton(
                                title: "测试",
                                icon: Icons.add,
                                onPressed: () {},
                              ),
                              _HeaderActionButton(
                                icon: Icons.eighteen_mp_sharp,
                                onPressed: () {},
                              ),
                            ],
                          )
                      ),

                      const Spacer(),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100.withAlpha(50),
                        ),
                        height: 40,
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Row(
                              children: [
                                Text(
                                  "双十一特惠！",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                              ],
                            ),

                            Transform.rotate(angle: MathUtil.rotatePi, child:
                            const Icon(
                                Icons.arrow_back_ios_new,
                                size: 14,
                                color: Colors.white)
                            )

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HeaderActionButton extends StatelessWidget {
  const _HeaderActionButton({
    this.title,
    required this.icon,
    required this.onPressed,
  });

  final String? title;
  final IconData icon;
  final VoidCallback onPressed;

  ButtonStyle _getStyle(bool isOnlyIconButton) {
    return ButtonStyle(
      minimumSize: WidgetStateProperty.all(
        isOnlyIconButton ? const Size(36, 36) : const Size(70, 36),
      ),
      padding: WidgetStateProperty.all(EdgeInsets.zero),
      backgroundColor: WidgetStateProperty.all(
        Colors.grey.shade100.withAlpha(50),
      ),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      ),
    );
  }

  Widget _getContent(String buttonTitle) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: Colors.white, size: 20),
        if (buttonTitle.isNotEmpty) ...[
          const SizedBox(width: 4),
          Text(buttonTitle, style: const TextStyle(color: Colors.white)),
        ],
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final buttonTitle = title ?? '';
    final isOnlyIconButton = buttonTitle.isEmpty;
    final button = ElevatedButton(
      onPressed: onPressed,
      style: _getStyle(isOnlyIconButton),
      child: _getContent(buttonTitle),
    );

    if (isOnlyIconButton) {
      return button;
    }

    return Expanded(child: button);
  }
}
