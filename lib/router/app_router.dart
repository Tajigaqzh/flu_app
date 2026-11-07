import 'package:flu_app/pages/recognize/recognize_page.dart';
import 'package:go_router/go_router.dart';

import '../pages/home/home_page.dart';
import '../pages/layout/layout.dart';
import '../pages/launch/launch_page.dart';
import '../pages/library/library_page.dart';
import '../pages/profile/profile_page.dart';
import '../pages/scan/scan_page.dart';
import '../pages/video/video_page.dart';

// 全应用统一的路由表，应用启动时先显示启动页。
final appRouter = GoRouter(
  initialLocation: '/launch',
  routes: [
    // 启动页通过 context.go('/home') 进入主界面。
    GoRoute(path: '/launch', builder: (context, state) => const LaunchPage()),
    GoRoute(
      path: '/profile/scan',
      builder: (context, state) => const ScanPage(),
    ),

    GoRoute(
      path: "/profile/recognize",
      builder: (context, state) => const RecognizePage(),
    ),
    // 底部导航的状态路由壳：每个分支都有独立导航栈，切换 tab 时保留页面状态。
    StatefulShellRoute.indexedStack(
      // 把当前导航壳交给主布局，由主布局绘制底部导航并切换分支。
      builder: (context, state, navigationShell) =>
          AppLayout(navigationShell: navigationShell),
      branches: [
        // 首页分支。
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/home',
              builder: (context, state) => const HomePage(),
            ),
          ],
        ),
        // 本地曲库分支。
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/library',
              builder: (context, state) => const LibraryPage(),
            ),
          ],
        ),
        // 视频分支。
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/video',
              builder: (context, state) => const VideoPage(),
            ),
          ],
        ),
        // 个人中心分支。
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/profile',
              builder: (context, state) => const ProfilePage(),
            ),
          ],
        ),
      ],
    ),
  ],
);
