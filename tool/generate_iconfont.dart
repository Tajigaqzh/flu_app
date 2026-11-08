import 'dart:convert';
import 'dart:io';

const _sourcePath = 'assets/fonts/icon/iconfont.json';
const _outputPath = 'lib/common/iconfont_icons.dart';

// 保留项目中已经使用的语义化图标名称。
const _nameOverrides = <String, String>{
  'sousuo': 'search',
  'jiahao': 'add',
  '24gf-ellipsisVertical': 'moreVertical',
  'gengduo': 'fold',
  'icon-test': 'avatar',
  'a-6Ahuatong': 'voice',
};

void main(List<String> arguments) {
  final sourcePath = arguments.isNotEmpty ? arguments[0] : _sourcePath;
  final outputPath = arguments.length > 1 ? arguments[1] : _outputPath;
  final source = jsonDecode(File(sourcePath).readAsStringSync());
  if (source is! Map<String, dynamic> || source['glyphs'] is! List) {
    throw const FormatException('Invalid iconfont JSON: expected a glyphs array.');
  }

  final fontFamily = source['font_family'];
  if (fontFamily is! String || fontFamily.isEmpty) {
    throw const FormatException('Invalid iconfont JSON: font_family is missing.');
  }

  final glyphs = source['glyphs'] as List<dynamic>;
  final members = <({String name, String comment, String codePoint})>[];
  final usedNames = <String>{};

  for (final glyph in glyphs) {
    if (glyph is! Map<String, dynamic>) {
      throw const FormatException('Invalid iconfont JSON: glyph must be an object.');
    }
    final fontClass = glyph['font_class'];
    final title = glyph['name'];
    final unicode = glyph['unicode'];
    if (fontClass is! String || title is! String || unicode is! String) {
      throw const FormatException(
        'Invalid iconfont JSON: each glyph needs name, font_class, and unicode.',
      );
    }

    final name = _nameOverrides[fontClass] ?? _identifierFrom(fontClass);
    if (!usedNames.add(name)) {
      throw FormatException('Duplicate generated icon name: $name');
    }
    if (!RegExp(r'^[0-9a-fA-F]+$').hasMatch(unicode)) {
      throw FormatException(
        'Invalid unicode code point for $fontClass: $unicode',
      );
    }

    members.add((name: name, comment: _safeComment(title), codePoint: unicode));
  }

  final output = StringBuffer()
    ..writeln("import 'package:flutter/widgets.dart';")
    ..writeln()
    ..writeln('/// Generated from `$sourcePath`. Do not edit by hand.')
    ..writeln('abstract final class IconfontIcons {');

  for (var index = 0; index < members.length; index++) {
    final member = members[index];
    output
      ..writeln('  /// ${member.comment}')
      ..writeln(
        '  static const ${member.name} = IconData(0x${member.codePoint}, fontFamily: \'$fontFamily\');',
      );
    if (index < members.length - 1) output.writeln();
  }
  output.writeln('}');

  File(outputPath)
    ..createSync(recursive: true)
    ..writeAsStringSync(output.toString());
}

String _identifierFrom(String fontClass) {
  var normalized = fontClass.replaceFirst(RegExp(r'^iconfont'), '');
  final parts = normalized.split(RegExp(r'[^a-zA-Z0-9]+'))
    ..removeWhere((part) => part.isEmpty);
  if (parts.isEmpty) {
    normalized = fontClass;
  } else {
    normalized =
        parts.first +
        parts
            .skip(1)
            .map((part) => '${part[0].toUpperCase()}${part.substring(1)}')
            .join();
  }

  if (!RegExp(r'^[a-zA-Z_$]').hasMatch(normalized)) {
    normalized = 'icon${normalized[0].toUpperCase()}${normalized.substring(1)}';
  }
  return normalized;
}

String _safeComment(String value) =>
    value.replaceAll('\n', ' ').replaceAll('\r', ' ').replaceAll('*/', '* /');
