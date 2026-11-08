import 'package:material_ui/material_ui.dart';

import '../../../common/iconfont_icons.dart';
import '../../../components/action_icon.dart';

/// Profile 页面的顶部区域组件。
/// 显示 Profile 页面的渐变顶部区域和快捷操作图标。
class ProfileHeaderComponent extends StatelessWidget {
  const ProfileHeaderComponent({
    super.key,
    required this.onOpenLeftDetailDrawer,
    this.statusText = '添加状态',
  });

  final VoidCallback onOpenLeftDetailDrawer;
  final String statusText;

  @override
  Widget build(BuildContext context) {
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
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(IconfontIcons.add, color: Colors.white, size: 10),
                  Text(
                    statusText,
                    style: const TextStyle(color: Colors.white, fontSize: 12),
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
                        padding: const EdgeInsets.all(0),
                        style: const ButtonStyle(
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        constraints: const BoxConstraints(
                          maxWidth: 30,
                          minWidth: 30,
                          maxHeight: 30,
                          minHeight: 30,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
