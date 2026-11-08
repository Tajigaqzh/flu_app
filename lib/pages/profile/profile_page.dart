import 'package:material_ui/material_ui.dart';
import 'package:flu_app/pages/profile/components/profile_header.dart';
import 'package:flu_app/widgets/show_left_detail_drawer.dart';
import 'package:flu_app/widgets/tab_placeholder.dart';
/// 我的 tab 激活页面
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileHeaderComponent(
          // 打开左侧个人信息详情抽屉
          onOpenLeftDetailDrawer: () => showLeftDetailDrawer(context),
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
