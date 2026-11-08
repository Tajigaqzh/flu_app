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
          size: 20,
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
    // 内容用 SafeArea 让出状态栏，因此第一行紧贴刘海；布局到顶部时不会有白边。
    final barContent = SafeArea(
      bottom: false,
      child: Column(
        children: [
          SizedBox(
            height: height,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // 标题铺满整行并居中，不受左右内容宽度影响。
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 56),
                    child: Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: isDark ? Colors.black : Colors.white,
                      ),
                    ),
                  ),
                ),

                // 左侧。
                Align(
                  alignment: Alignment.centerLeft,
                  child: leading ?? _defaultLeading(context),
                ),

                // 右侧（默认不显示）。
                Align(
                  alignment: Alignment.centerRight,
                  child: _defaultTrail(trailing),
                ),
              ],
            ),
          ),

          Expanded(child: child),
        ],
      ),
    );

    if (backgroundColor == null) {
      return barContent;
    }
    return ColoredBox(color: backgroundColor!, child: barContent);
  }
}
