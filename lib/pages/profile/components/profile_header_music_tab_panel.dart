import 'package:material_ui/material_ui.dart';

enum ProfileHeaderMusicTabItem { recentPlay, create, collect }

class ProfileHeaderMusicTabPanel extends StatefulWidget {
  const ProfileHeaderMusicTabPanel({
    super.key,
    this.initialItem = ProfileHeaderMusicTabItem.recentPlay,
  });

  final ProfileHeaderMusicTabItem initialItem;

  @override
  State<ProfileHeaderMusicTabPanel> createState() =>
      _ProfileHeaderMusicTabPanelState();
}

class _ProfileHeaderMusicTabPanelState
    extends State<ProfileHeaderMusicTabPanel> {
  late ProfileHeaderMusicTabItem currentItem;

  @override
  void initState() {
    super.initState();
    currentItem = widget.initialItem;
  }

  Widget _buildItem({
    required ProfileHeaderMusicTabItem item,
    required String label,
    IconData? icon,
    IconData? inactiveIcon,
  }) {
    final isActive = currentItem == item;
    final color = isActive ? const Color(0xff1C0000) : Colors.grey.shade500;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (isActive) return;
        setState(() => currentItem = item);
      },
      child: SizedBox(
        height: 32,
        child: Row(
          children: [
            if (icon != null) ...[
              Icon(
                isActive ? icon : inactiveIcon ?? icon,
                size: 12,
                color: color,
              ),
              const SizedBox(width: 3),
            ],
            Text(
              label,
              style: TextStyle(
                color: color,
                fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              spacing: 16,
              children: [
                _buildItem(
                  item: ProfileHeaderMusicTabItem.recentPlay,
                  label: '近期',
                  icon: Icons.lock,
                  inactiveIcon: Icons.lock_outline,
                ),
                _buildItem(item: ProfileHeaderMusicTabItem.create, label: '创建'),
                _buildItem(
                  item: ProfileHeaderMusicTabItem.collect,
                  label: '收藏',
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              spacing: 10,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Icons.exit_to_app_outlined,
                    color: Colors.grey.shade500,
                    size: 18,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Icons.more_vert,
                    color: Colors.grey.shade500,
                    size: 18,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
