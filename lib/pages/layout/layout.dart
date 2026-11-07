import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';
import 'package:material_ui/material_ui.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/services.dart';

/// 应用主界面的统一布局壳。
///
/// [StatefulNavigationShell] 负责管理各个底部导航分支及其独立的导航栈，
/// 本布局只负责绘制公共外框和底部导航栏。
class AppLayout extends StatelessWidget {
  const AppLayout({required this.navigationShell, super.key});

  /// 当前的路由分支容器，会显示在玻璃脚手架的主体区域。
  final StatefulNavigationShell navigationShell;

  /// 底部导航栏的固定项目，顺序必须与 app_router.dart 中的 branches 对应。
  static const _tabs = [
    GlassTab(icon: Icon(Icons.home_outlined), label: '首页'),
    GlassTab(icon: Icon(Icons.library_music_outlined), label: '曲库'),
    GlassTab(icon: Icon(Icons.play_circle_outline), label: '视频'),
    GlassTab(icon: Icon(Icons.person_outline), label: '我的'),
  ];

  @override
  Widget build(BuildContext context) {
    // 是不是我的页面
    final isProfileTab = navigationShell.currentIndex == 3;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      // 修改顶部状态栏颜色
      value: SystemUiOverlayStyle(
        statusBarIconBrightness: isProfileTab
            ? Brightness.light
            : Brightness.dark,
        statusBarBrightness: isProfileTab ? Brightness.dark : Brightness.light,
        statusBarColor: isProfileTab
            ? const Color(0xFF351910)
            : const Color(0xffffffff),
      ),
      child: Material(
        type: MaterialType.transparency,
        child: DefaultTextStyle(
          style: Theme.of(context).textTheme.bodyMedium!,
          child: GlassScaffold(
            backgroundColor: const Color(0xFFF7F7FA),
            // 将路由当前分支作为页面主体，切换 tab 时由 navigationShell 更新。
            body: navigationShell,
            bottomBar: GlassTabBar.bottom(
              tabs: _tabs,
              selectedIndex: navigationShell.currentIndex,
              // 重复点击当前 tab 时回到该分支的初始页面，否则只切换分支。
              onTabSelected: (index) => navigationShell.goBranch(
                index,
                initialLocation: index == navigationShell.currentIndex,
              ),
              selectedIconColor: const Color(0xFF5E4BB6),
              unselectedIconColor: const Color(0xFF707078),
              selectedLabelColor: const Color(0xFF514099),
              unselectedLabelColor: const Color(0xFF707078),
              indicatorColor: const Color(0xFFE8E2FA),
              settings: LiquidGlassSettings.ios27Light.copyWith(
                glassColor: const Color(0x70FFFFFF),
                thickness: 24,
                rimShade: 0.42,
                rimLight: 0.52,
                shadow: const [
                  BoxShadow(
                    color: Color(0x10000000),
                    blurRadius: 14,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              showIndicator: true,
            ),
          ),
        ),
      ),
    );
  }
}
