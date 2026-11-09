import 'package:flu_app/pages/profile/components/profile_header_blog_tab_panel.dart';
import 'package:flu_app/pages/profile/components/profile_header_music_tab_panel.dart';
import 'package:flu_app/pages/profile/components/profile_header_note_tab_panel.dart';
import 'package:material_ui/material_ui.dart';

enum ProfileActiveTab { music, blog, note }

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key, this.initialTab = ProfileActiveTab.music});

  final ProfileActiveTab initialTab;

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  late ProfileActiveTab _activeTab;

  @override
  void initState() {
    super.initState();
    _activeTab = widget.initialTab;
  }

  Widget _buildTab(ProfileActiveTab tab, String label) {
    final isActive = _activeTab == tab;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (isActive) return;
        setState(() => _activeTab = tab);
      },
      child: Container(
        height: 30,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isActive ? const Color(0xff1C0000) : Colors.transparent,
              width: 2,
            ),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isActive ? const Color(0xff1C0000) : Colors.black,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    const padding = EdgeInsets.only(left: 15, right: 15);
    return switch (_activeTab) {
      ProfileActiveTab.music => Container(
        padding: padding,
        child: const ProfileHeaderMusicTabPanel(),
      ),
      ProfileActiveTab.blog => Container(
        padding: padding,
        child: const ProfileHeaderBlogTabPanel(),
      ),
      ProfileActiveTab.note => Container(
        padding: padding,
        child: const ProfileHeaderNoteTabPanel(),
      ),
    };
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(color: Color(0xff1C0000)),
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
            color: Color(0xffF5F6FA),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          child: Column(
            children: [
              Container(
                height: 50,
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                decoration: const BoxDecoration(
                  color: Color(0xffF5F6FA),
                  border: Border(
                    bottom: BorderSide(color: Color(0xffe6e3e3), width: 1),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _buildTab(ProfileActiveTab.music, '音乐'),
                    _buildTab(ProfileActiveTab.blog, '博客'),
                    _buildTab(ProfileActiveTab.note, '笔记'),
                  ],
                ),
              ),
              _buildContent(),
            ],
          ),
        ),
      ),
    );
  }
}
