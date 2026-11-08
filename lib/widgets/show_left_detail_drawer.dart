import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import 'package:flu_app/common/profile_event.dart';
import 'package:flu_app/widgets/left_detail_drawer/left_detail_drawer.dart';

/// 在根导航层打开左侧详情抽屉，使其覆盖底部玻璃导航。
Future<void> showLeftDetailDrawer(BuildContext context) {
  var handled = false;
  void onPressed({required String eventKey, Map<String, Object>? eventParams}) {
    if (handled) return;
    handled = true;

    Navigator.of(context, rootNavigator: true).pop();

    switch (eventKey) {
      case ProfileDrawerEventKey.recognize:
        context.push('/profile/recognize', extra: eventParams);
        break;
      case ProfileDrawerEventKey.scan:
        context.push('/profile/scan', extra: eventParams);
        break;
      case ProfileDrawerEventKey.myMessage:
        context.push('/profile/message');
        break;
      case ProfileDrawerEventKey.recentPlay:
        context.push('/profile/recentPlay');
        break;
      case ProfileDrawerEventKey.startVip:
        break;
    }
  }

  return showGeneralDialog<void>(
    context: context,
    useRootNavigator: true,
    barrierDismissible: true,
    barrierLabel: '关闭抽屉',
    barrierColor: Colors.black54,
    transitionDuration: const Duration(milliseconds: 220),
    pageBuilder: (context, animation, secondaryAnimation) => Align(
      alignment: Alignment.centerLeft,
      child: LeftDetailDrawer(onPressed: onPressed),
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
