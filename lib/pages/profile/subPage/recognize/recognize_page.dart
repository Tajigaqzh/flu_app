import 'package:flu_app/widgets/navigate_bar.dart';
import 'package:material_ui/material_ui.dart';

/// 识别页。
class RecognizePage extends StatefulWidget {
  const RecognizePage({super.key});

  @override
  State<RecognizePage> createState() => _RecognizePageState();
}

class _RecognizePageState extends State<RecognizePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: CustomWidgetWithNavigateBar(
        title: "听歌识曲",
        child: Column(children: [
          Center(
            child: Text(
              "占位页面"
            ),
          )
        ]),
      ),
    );
  }
}
