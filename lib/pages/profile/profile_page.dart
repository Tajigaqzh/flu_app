import 'package:flu_app/common/tabs.dart';
import 'package:flu_app/pages/profile/components/profile_header.dart';
import 'package:flu_app/pages/profile/components/profile_tab.dart';
import 'package:flu_app/widgets/left_detail_drawer/show_left_detail_drawer.dart';
import 'package:material_ui/material_ui.dart';

/// 我的 tab 激活页面
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileHeader(
          // 打开左侧个人信息详情抽屉
          onOpenLeftDetailDrawer: () =>
              showLeftDetailDrawer(context, AppTabEnum.profile),
        ),
        const ProfileTab(),
      ],
    );
  }
}
