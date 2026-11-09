import 'package:flu_app/widgets/navigate_bar/navigate_bar.dart';
import 'package:material_ui/material_ui.dart';

class RecentPlayPage extends StatefulWidget {
  const RecentPlayPage({super.key});

  @override
  State<StatefulWidget> createState() => _RecentPlayPageState();
}

class _RecentPlayPageState extends State<RecentPlayPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: CustomWidgetWithNavigateBar(
        title: "最近播放",
        child: Column(children: [Center(child: Text("占位内容"))]),
      ),
    );
  }
}
