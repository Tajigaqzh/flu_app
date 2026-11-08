import 'package:material_ui/material_ui.dart';

import 'package:flu_app/widgets/tab_placeholder.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const TabPlaceholder(
      title: '本地曲库',
      subtitle: '管理设备中的音乐',
      icon: Icons.library_music_outlined,
    );
  }
}
