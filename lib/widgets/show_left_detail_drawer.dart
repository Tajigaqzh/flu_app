import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import 'package:flu_app/common/profile_event.dart';
import 'package:flu_app/common/tabs.dart';
import 'package:flu_app/widgets/left_detail_drawer/left_detail_drawer.dart';

/// 在根导航器显示左侧详情抽屉，并统一处理抽屉内的导航操作。
Future<void> showLeftDetailDrawer(BuildContext context, [AppTabEnum? appTab]) {
  var handled = false;
  void onPressed({required String eventKey, Map<String, Object>? eventParams}) {
    if (handled) return;
    handled = true;

    Navigator.of(context, rootNavigator: true).pop();

    switch (eventKey) {
      case DrawerEventKey.recognize:
        context.push('/drawer/recognize', extra: eventParams);
        break;
      case DrawerEventKey.scan:
        context.push('/drawer/scan', extra: eventParams);
        break;
      case DrawerEventKey.myMessage:
        context.push('/drawer/message');
        break;
      case DrawerEventKey.recentPlay:
        context.push('/drawer/recentPlay');
        break;
      case DrawerEventKey.startVip:
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
