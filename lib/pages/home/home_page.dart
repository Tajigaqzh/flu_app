import 'package:material_ui/material_ui.dart';

// 首页
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      key: const PageStorageKey('home-tab'),
      padding: const EdgeInsets.fromLTRB(24, 30, 24, 112),
      children: [
        const Text(
          'hpMusic',
          style: TextStyle(
            color: Color(0xFF202027),
            fontSize: 30,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          '让喜欢的音乐，随时相伴',
          style: TextStyle(color: Color(0xFF777781), fontSize: 15),
        ),
        const SizedBox(height: 32),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            'assets/images/launch/1.png',
            height: 260,
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(height: 26),
        const Text(
          '最近播放',
          style: TextStyle(
            color: Color(0xFF202027),
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          '播放过的歌曲会出现在这里',
          style: TextStyle(color: Color(0xFF85858E), fontSize: 14),
        ),
      ],
    );
  }
}
