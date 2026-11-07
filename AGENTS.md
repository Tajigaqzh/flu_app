# 仓库协作指南

## 项目结构

本仓库是 Flutter 应用。应用入口和界面代码位于 `lib/`，入口文件为 `lib/main.dart`，页面按功能放在 `lib/pages/`（例如 `lib/pages/launch/`）。Widget 测试放在 `test/`。`cleaned_images/` 存放设计参考图；应用运行时使用的资源应放在 `assets/`，并在 `pubspec.yaml` 中声明。`android/`、`ios/`、`web/`、`windows/`、`linux/` 和 `macos/` 包含各平台的运行器与配置。不要直接修改 `build/` 或平台目录中的生成文件。

## 构建、测试与本地开发

以下命令均在仓库根目录运行，并要求已安装 Flutter：

- `flutter pub get`：根据 `pubspec.yaml` 安装依赖。
- `flutter run`：在已连接的设备或选定的桌面平台运行应用。
- `flutter analyze`：依据 `analysis_options.yaml` 执行 Dart 静态分析。
- `flutter test`：运行 `test/` 中的单元测试和 Widget 测试。
- `flutter build <platform>`：构建指定平台的发布版本，例如 `flutter build apk` 或 `flutter build web`。

## 代码风格与命名

遵循 Dart 格式规范：使用两个空格缩进，多行 Widget 参数列表末尾保留逗号。提交前运行 `dart format lib test`。遵循 `analysis_options.yaml` 启用的 `flutter_lints` 规则。文件名使用小写加下划线（如 `launch_page.dart`）；类型使用 `UpperCamelCase`，成员和局部变量使用 `lowerCamelCase`。功能页面放在 `lib/pages/` 下对应的目录；确有多处复用时再提取共享 Widget。

## 测试

测试使用 `flutter_test`，文件名采用 `*_test.dart`。界面和交互行为优先通过 Widget 测试验证，断言应聚焦用户可观察的结果。修改 Dart 代码后运行 `flutter test` 和 `flutter analyze`。项目目前未设置覆盖率门槛。

## 提交与 Pull Request

仓库未记录固定的提交消息格式。提交标题应简短并说明变更，例如 `Add library empty state`。PR 应说明用户可见的改动，列出已运行的验证命令及结果；适用时关联 issue，界面改动附截图，并注明平台特定改动或所需配置更新。

## 配置与资源

在 `pubspec.yaml` 中声明依赖和应用资源。修改应用依赖后，提交相应的 `pubspec.lock` 更新。不要提交密钥或仅适用于本机的配置。除非应用确实会加载设计参考图，否则不要将大型参考图作为运行时资源。
