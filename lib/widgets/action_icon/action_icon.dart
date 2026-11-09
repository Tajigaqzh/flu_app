import 'package:material_ui/material_ui.dart';

class ActionIcon extends StatelessWidget {
  const ActionIcon({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
    this.color = Colors.white,
    this.size = 20,
    this.compact = false,
    this.constraints,
  });

  final double size;
  final Color color;
  final IconData icon;
  final String label;
  final VoidCallback onPressed;
  final bool compact;
  final BoxConstraints? constraints;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      tooltip: label,
      color: color,
      padding: compact ? EdgeInsets.zero : null,
      constraints:
          constraints ??
          (compact ? const BoxConstraints(minWidth: 30, minHeight: 30) : null),
      icon: Icon(icon, size: size),
      iconSize: size,
    );
  }
}
