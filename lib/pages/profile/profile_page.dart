import 'package:material_ui/material_ui.dart';
import 'package:go_router/go_router.dart';

import 'components/profile_header.dart';
import 'components/profile_left_detail_drawer.dart';
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
            // 点击语音识别
            onVoicePressed: () {
              // 关闭当前抽屉
              Navigator.of(context, rootNavigator: true).pop();
              context.push("/profile/recognize");
            },
            // 点击扫码
            onScanPressed: () {
              // 关闭当前抽屉
              Navigator.of(context, rootNavigator: true).pop();
              context.push('/profile/scan');
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
