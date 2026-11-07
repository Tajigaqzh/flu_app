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
            onPressed: ({required eventKey, eventParams}) {
              switch (eventKey) {
                case ProfileDrawerEventKey.recognize:
                  Navigator.of(context, rootNavigator: true).pop();
                  context.push('/profile/recognize', extra: eventParams);
                case ProfileDrawerEventKey.scan:
                  Navigator.of(context, rootNavigator: true).pop();
                  context.push('/profile/scan', extra: eventParams);
                case ProfileDrawerEventKey.startVip:
                  break;
              }
            },
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
