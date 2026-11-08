import 'package:material_ui/material_ui.dart';
import 'package:go_router/go_router.dart';

import 'components/profile_header.dart';
import 'components/profile_left_detail_drawer.dart';
import 'profile_event.dart';
import '../../widgets/tab_placeholder.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileHeaderComponent(
          // 打开左侧个人信息详情抽屉
          onOpenLeftDetailDrawer: () => showProfileLeftDetailDrawer(
            context,
            // 每次打开抽屉时新建闭包，用 handled 保证一次打开内只触发一次，
            // 防止快速连点时重复 pop + push（第二次 pop 会误关掉新页面）。
            // 之前的普通写法也不会重复点，这里只是展示一下防重复写法
            onPressed: () {
              var handled = false;
              return ({required eventKey, eventParams}) {
                if (handled) return;
                handled = true;

                Navigator.of(context, rootNavigator: true).pop();

                switch (eventKey) {
                  case ProfileDrawerEventKey.recognize:
                    context.push('/profile/recognize', extra: eventParams);
                  case ProfileDrawerEventKey.scan:
                    context.push('/profile/scan', extra: eventParams);
                  case ProfileDrawerEventKey.startVip:
                    break;
                }
              };
            }(),
          ),
        ),
        const Expanded(
          child: TabPlaceholder(
            title: '我的',
            subtitle: '个人设置与播放记录',
            icon: Icons.person_outline,
          ),
        ),
      ],
    );
  }
}
