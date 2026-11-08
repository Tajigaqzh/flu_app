import 'package:flutter/services.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../widgets/navigate_bar.dart';

/// 识别页。
class RecognizePage extends StatefulWidget {
  const RecognizePage({super.key});

  @override
  State<RecognizePage> createState() => _RecognizePageState();
}

class _RecognizePageState extends State<RecognizePage> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
        statusBarColor: Colors.white,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Expanded(
              child: SafeArea(
                top: false,
                bottom: true,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // TODO: 在这里编写识别页的内容。
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}