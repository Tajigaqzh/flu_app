import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import 'package:flu_app/pages/profile/subPage/message/message_page.dart';

void main() {
  testWidgets('message page lays out its scrollable content', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: MessagePage()));

    expect(find.text('我的消息'), findsOneWidget);
    const preview = '分享专辑《烟霞》，我的最新专辑《烟霞》发布了。快来听听吧';
    final previews = find.text(preview);
    expect(previews, findsWidgets);
    expect(tester.getSize(find.byType(ListView)).height, greaterThan(0));

    final noBadgePreview = previews.at(1);
    final previewRow = find
        .ancestor(of: noBadgePreview, matching: find.byType(Row))
        .first;
    expect(
      tester.getSize(noBadgePreview).width,
      tester.getSize(previewRow).width,
    );
    expect(tester.takeException(), isNull);
  });
}
