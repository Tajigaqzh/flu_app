import 'package:material_ui/material_ui.dart';
import 'package:flu_app/widgets/navigate_bar/navigate_bar.dart';

class AppSettingPage extends StatefulWidget {
  const AppSettingPage({super.key});

  @override
  State<AppSettingPage> createState() => _AppSettingPageState();
}

class _AppSettingPageState extends State<AppSettingPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: CustomWidgetWithNavigateBar(
        title: "设置",
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
