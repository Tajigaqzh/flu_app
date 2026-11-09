import 'package:material_ui/material_ui.dart';

// 首页
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      key: const PageStorageKey('home-tab'),
      padding: const EdgeInsets.fromLTRB(24, 30, 24, 112),
      children: const [
        Text(
          'hpMusic',
          style: TextStyle(
            color: Color(0xFF202027),
            fontSize: 30,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 8),
        Text(
          '让喜欢的音乐，随时相伴',
          style: TextStyle(color: Color(0xFF777781), fontSize: 15),
        ),
        SizedBox(height: 32),
        Text(
          '最近播放',
          style: TextStyle(
            color: Color(0xFF202027),
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 12),
        Text(
          '播放过的歌曲会出现在这里',
          style: TextStyle(color: Color(0xFF85858E), fontSize: 14),
        ),
      ],
    );
  }
}
