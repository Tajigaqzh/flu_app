import 'dart:math' as math;

import 'package:flu_app/pages/profile/components/profile_left_detail_drawer_item_card.dart';
import 'package:flu_app/pages/profile/components/profile_left_detail_drawer_vip_card.dart';
import 'package:material_ui/material_ui.dart';

import '../../../common/iconfont_icons.dart';
import '../profile_event.dart';

/// Profile 页面的左侧抽屉内容。
class ProfileLeftDetailDrawerComponent extends StatelessWidget {
  const ProfileLeftDetailDrawerComponent({super.key, required this.onPressed});

  final ProfileDrawerPressed onPressed;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 315,
      backgroundColor: Color(0xFFF2F6FA),

      child: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 15),
          child: SizedBox.expand(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          IconfontIcons.avatar,
                          size: 32,
                          color: Color(0xffffffff),
                        ),
                        SizedBox(width: 10),

                        Text("毛毛qzh"),
                        Transform.rotate(
                          angle: math.pi,
                          child: Icon(Icons.arrow_back_ios_rounded, size: 12),
                        ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () => onPressed(
                            eventKey: ProfileDrawerEventKey.recognize,
                          ),
                          tooltip: '语音',
                          padding: EdgeInsets.all(0),
                          style: const ButtonStyle(
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),

                          icon: const Icon(IconfontIcons.voice, size: 20),
                          constraints: BoxConstraints(
                            maxWidth: 24,
                            minWidth: 24,
                            maxHeight: 24,
                            minHeight: 24,
                          ),
                        ),

                        SizedBox(width: 10),
                        IconButton(
                          onPressed: () =>
                              onPressed(eventKey: ProfileDrawerEventKey.scan),
                          tooltip: '扫描',
                          padding: EdgeInsets.all(0),
                          style: const ButtonStyle(
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          icon: const Icon(IconfontIcons.scan, size: 20),
                          constraints: BoxConstraints(
                            maxWidth: 24,
                            minWidth: 24,
                            maxHeight: 24,
                            minHeight: 24,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 6),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      ProfileLeftDetailDrawerVipCard(onPressed: onPressed),
                      SizedBox(height: 16),

                      ProfileLeftDetailDrawerItemCard(onPressed: onPressed),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// 在根导航层打开抽屉，使其覆盖底部玻璃导航。
Future<void> showProfileLeftDetailDrawer(
  BuildContext context, {
  required ProfileDrawerPressed onPressed,
}) {
  return showGeneralDialog<void>(
    context: context,
    useRootNavigator: true,
    barrierDismissible: true,
    barrierLabel: '关闭抽屉',
    barrierColor: Colors.black54,
    transitionDuration: const Duration(milliseconds: 220),
    pageBuilder: (context, animation, secondaryAnimation) => Align(
      alignment: Alignment.centerLeft,
      child: ProfileLeftDetailDrawerComponent(onPressed: onPressed),
    ),
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      final offset = Tween<Offset>(
        begin: const Offset(-1, 0),
        end: Offset.zero,
      ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOutCubic));
      return SlideTransition(position: offset, child: child);
    },
  );
}
