import 'package:flutter/services.dart';
import 'package:material_ui/material_ui.dart';

/// 通用导航栏：中间标题相对屏幕居中，左侧返回按钮，右侧内容可自定义。
///
/// 用 Stack + Align 布局，标题用 Center 铺满整个宽度，因此即使左右两侧
/// 内容宽度不对称，标题也始终严格相对屏幕居中，不会被某侧顶偏。
class CustomWidgetWithNavigateBar extends StatelessWidget {
  const CustomWidgetWithNavigateBar({
    super.key,
    required this.title,
    this.leading,
    this.trailing,
    required this.child,
    this.height = 44,
    this.isDark = true,
    this.backgroundColor,
    this.onBack,
    this.overlayChild = false,
  });

  /// 标题文案。
  final String title;

  /// 左侧内容，默认是返回按钮；传入则覆盖。
  final Widget? leading;

  /// 右侧内容，默认不显示；传入才显示。
  final List<Widget>? trailing;

  /// 自定义返回事件。传了则返回键只调用它，不再执行内部 pop；
  /// 不传则走默认 Navigator.maybePop()。
  final VoidCallback? onBack;

  /// Whether the child extends behind the navigation bar.
  final bool overlayChild;

  /// 导航栏内容高度。
  final double height;

  /// 是否黑色
  final bool isDark;

  final Widget child;

  /// 顶栏背景色；默认透明。设置后背景会铺满到屏幕最顶（含状态栏区域），
  /// 实现贴合刘海的 full-bleed 顶栏。
  final Color? backgroundColor;

  /// 默认左侧返回按钮。
  Widget _defaultLeading(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        // 传了 onBack 则完全交给调用方处理返回，不再走内部 pop。
        if (onBack != null) {
          onBack!.call();
          return;
        }
        Navigator.of(context).maybePop();
      },
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Icon(
          Icons.arrow_back_ios_rounded,
          size: 24,
          color: isDark ? Colors.black : Colors.white,
        ),
      ),
    );
  }

  Widget _defaultTrail(List<Widget>? widgets) {
    if (widgets != null && widgets.isNotEmpty) {
      return Padding(
        padding: const EdgeInsets.all(12),
        child: Row(mainAxisSize: MainAxisSize.min, children: widgets),
      );
    }
    return const SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    // 有背景色时做 full-bleed：背景铺到屏幕最顶（含状态栏区域），
    // 保留大部分顶部安全区，让栏内容避开刘海并保留 full-bleed 背景。
    final topInset = MediaQuery.paddingOf(context).top;
    final navigationBar = Padding(
      padding: EdgeInsets.only(top: topInset * 0.75),
      child: SizedBox(
        height: height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 56),
                child: Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: isDark ? Colors.black : Colors.white,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: leading ?? _defaultLeading(context),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: _defaultTrail(trailing),
            ),
          ],
        ),
      ),
    );
    final barContent = MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: overlayChild
          ? Stack(
              fit: StackFit.expand,
              children: [
                child,
                Positioned(top: 0, left: 0, right: 0, child: navigationBar),
              ],
            )
          : Column(
              children: [
                navigationBar,
                Expanded(child: child),
              ],
            ),
    );

    final content = backgroundColor == null
        ? barContent
        : ColoredBox(color: backgroundColor!, child: barContent);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarIconBrightness: isDark ? Brightness.dark : Brightness.light,
        statusBarBrightness: isDark ? Brightness.light : Brightness.dark,
        statusBarColor: backgroundColor ?? Colors.transparent,
      ),
      child: content,
    );
  }
}
