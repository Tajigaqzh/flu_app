import 'package:material_ui/material_ui.dart';

import '../../widgets/tab_placeholder.dart';

class VideoPage extends StatelessWidget {
  const VideoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const TabPlaceholder(
      title: '视频',
      subtitle: '本地视频会显示在这里',
      icon: Icons.video_library_outlined,
    );
  }
}
