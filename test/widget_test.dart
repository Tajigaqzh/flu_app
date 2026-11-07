import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import 'package:flu_app/main.dart';

void main() {
  testWidgets('renders the launch background and record with halo', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is DecoratedBox &&
            widget.decoration is BoxDecoration &&
            (widget.decoration as BoxDecoration).shape == BoxShape.circle,
      ),
      findsOneWidget,
    );
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is Image &&
            widget.image is AssetImage &&
            (widget.image as AssetImage).assetName ==
                'assets/images/launch/5.jpg',
      ),
      findsOneWidget,
    );
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is Image &&
            widget.image is AssetImage &&
            (widget.image as AssetImage).assetName ==
                'assets/images/launch/1.png',
      ),
      findsOneWidget,
    );

    await tester.tap(find.text('进入本地曲库'));
    await tester.pumpAndSettle();

    expect(find.text('首页'), findsWidgets);
    expect(find.text('曲库'), findsWidgets);
    expect(find.text('视频'), findsWidgets);
    expect(find.text('我的'), findsWidgets);

    await tester.tap(find.text('曲库').first);
    await tester.pumpAndSettle();

    expect(find.text('本地曲库'), findsOneWidget);
  });
}
