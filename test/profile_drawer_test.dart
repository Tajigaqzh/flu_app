import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import 'package:flu_app/widgets/left_detail_drawer/left_detail_drawer.dart';
import 'package:flu_app/widgets/left_detail_drawer/components/left_detail_drawer_vip_card.dart';
import 'package:flu_app/pages/profile/profile_page.dart';
import 'package:flu_app/common/profile_event.dart';

void main() {
  testWidgets('profile drawer covers bottom navigation', (tester) async {
    var navigationTaps = 0;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: const ProfilePage(),
          bottomNavigationBar: TextButton(
            onPressed: () => navigationTaps++,
            child: const Text('底部导航'),
          ),
        ),
      ),
    );

    await tester.tap(find.byTooltip('折叠'));
    await tester.pumpAndSettle();

    expect(find.byType(LeftDetailDrawer), findsOneWidget);
    expect(
      tester.getSize(find.byType(LeftDetailDrawerVipCard)),
      const Size(285, 130),
    );

    final voiceButton = find.byWidgetPredicate(
      (widget) => widget is IconButton && widget.tooltip == '语音',
    );
    final scanButton = find.byWidgetPredicate(
      (widget) => widget is IconButton && widget.tooltip == '扫描',
    );
    expect(tester.getSize(voiceButton).width, 24);
    expect(tester.getSize(scanButton).width, 24);
    expect(
      tester.getTopLeft(scanButton).dx - tester.getTopRight(voiceButton).dx,
      10,
    );

    await tester.tap(find.text('底部导航'), warnIfMissed: false);
    await tester.pumpAndSettle();

    expect(navigationTaps, 0);
    expect(find.byType(LeftDetailDrawer), findsNothing);
  });

  testWidgets('VIP actions invoke start VIP callback', (tester) async {
    final eventKeys = <String>[];
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: LeftDetailDrawerVipCard(
              onPressed: ({required eventKey, eventParams}) {
                eventKeys.add(eventKey);
              },
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.text('去打卡'));
    await tester.tap(find.text('续费'));

    expect(eventKeys, [
      ProfileDrawerEventKey.startVip,
      ProfileDrawerEventKey.startVip,
    ]);
  });

  testWidgets('voice action opens recognize route', (tester) async {
    final router = GoRouter(
      initialLocation: '/profile',
      routes: [
        GoRoute(
          path: '/profile',
          builder: (context, state) => const ProfilePage(),
        ),
        GoRoute(
          path: '/profile/recognize',
          builder: (context, state) => const Text('语音识别页面'),
        ),
      ],
    );
    addTearDown(router.dispose);
    await tester.pumpWidget(MaterialApp.router(routerConfig: router));

    await tester.tap(find.byTooltip('折叠'));
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('语音'));
    await tester.pumpAndSettle();

    expect(find.text('语音识别页面'), findsOneWidget);
    expect(find.byType(LeftDetailDrawer), findsNothing);
    expect(tester.takeException(), isNull);
  });

  testWidgets('scan action works without a Scaffold', (tester) async {
    final router = GoRouter(
      initialLocation: '/profile',
      routes: [
        GoRoute(
          path: '/profile',
          builder: (context, state) => const ProfilePage(),
        ),
        GoRoute(
          path: '/profile/scan',
          builder: (context, state) => const Text('扫码页面'),
        ),
      ],
    );
    addTearDown(router.dispose);
    await tester.pumpWidget(MaterialApp.router(routerConfig: router));

    await tester.tap(find.byTooltip('折叠'));
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('扫描'));
    await tester.pumpAndSettle();

    expect(find.text('扫码页面'), findsOneWidget);
    expect(find.byType(LeftDetailDrawer), findsNothing);
    expect(tester.takeException(), isNull);
  });
}
